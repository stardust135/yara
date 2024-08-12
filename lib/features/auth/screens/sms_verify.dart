import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yara/config/routes/routes.dart';
import 'package:yara/core/constants/styles.dart';
import 'package:yara/core/models/user_model.dart';
import 'package:yara/core/utils/extensions.dart';

import '../../../core/blocs/app_bloc.dart';
import '../../../core/utils/enums.dart';
import '../../../locator.dart';
import '../widgets/send_message_error_dialog.dart';

class SmsVerify extends StatefulWidget {
  final String phoneNumber;

  const SmsVerify({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<SmsVerify> createState() => _SmsVerifyState();
}

class _SmsVerifyState extends State<SmsVerify> {
  final TextEditingController _controller = TextEditingController();
  late int counter;
  late Timer _timer;
  String errorMessage = '';

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    counter = 20;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (counter == 1) {
            timer.cancel();
          } else {
            counter--;
          }
        });
      },
    );
  }

  void validate(String text) {
    if (text.length == 6) {
      logger.e(widget.phoneNumber);
      // call check code and login api
      context.read<AppBloc>().add(
            LoadData(
              callApiFunction: () async => await locator.apiManager
                  .verifyAndLogin(widget.phoneNumber, text),
              whoCalledBloc: WhoCalledBloc.verify,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState?>(
      listenWhen: (_, current) {
        return current?.whoCalledBloc == WhoCalledBloc.verify ? true : false;
      },
      listener: (BuildContext context, state) {
        logger.e(state.runtimeType);
        if (state is AppDataCompleted &&
            state.whoCalledBloc == WhoCalledBloc.verify) {
          UserModel userModel = state.appModel as UserModel;
          locator.dbManager.setUserInfo(
            token: userModel.data?.token,
            userId: userModel.data?.admin?.id,
            firstname: userModel.data?.admin?.firstname,
            lastname: userModel.data?.admin?.lastname,
            socialUsername: userModel.data?.admin?.socialUsername,
            phone: userModel.data?.admin?.phone,
            phoneVerifiedAt: userModel.data?.admin!.phoneVerifiedAt,
            lastView: userModel.data?.admin?.lastView,
            isActive: userModel.data?.admin?.isActive,
            userType: userModel.data?.admin?.userType,
            socialId: userModel.data?.admin?.socialId,
            createdAt: userModel.data?.admin?.createdAt,
            updatedAt: userModel.data?.admin?.updatedAt,
            image: userModel.data?.admin?.image,
          );
          context.pushReplacementName(Routes.home);
        }
        if (state is AppDataError &&
            state.whoCalledBloc == WhoCalledBloc.verify) {
          showDialog(
            context: this.context,
            builder: (BuildContext dialogContext) {
              return const LoginErrorsDialog(
                title: 'عدم تطابق کد تایید',
                description: 'کد وارد شده اشتباه است دوباره امتحان کنید',
              );
            },
          );
        }
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff337c67),
            title: Text(
              widget.phoneNumber,
              style: TextStyle(
                fontSize: 18,
                fontFamily: Styles.fonts.vazirMatn,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Align(
                  child: Text(
                    'پیام های خود را بررسی کنید',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: Styles.fonts.vazirMatn,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  child: Text(
                    'ما کد را برای شما پیامک کرده ایم',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontFamily: Styles.fonts.vazirMatn,
                    ),
                  ),
                ),
                Align(
                  child: SizedBox(
                    width: 60,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      // 9 digits + 2 spaces
                      maxLength: 25,
                      style: TextStyle(
                        fontFamily: Styles.fonts.vazirMatn,
                        color: Colors.black,
                      ),
                      onChanged: validate,
                      decoration: InputDecoration(
                        hintText: '- - - - -',
                        counterText: '',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: Styles.fonts.vazirMatn,
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      buildCounter: (
                        BuildContext context, {
                        required int currentLength,
                        required bool isFocused,
                        required int? maxLength,
                      }) {
                        return null; // Hide the character counter
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (counter < 21 && counter > 1)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'می توانید بعد از $counter ثانیه درخواست پیامک مجدد کنید.',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontFamily: Styles.fonts.vazirMatn,
                      ),
                    ),
                  )
                else
                  Align(
                    child: InkWell(
                      onTap: () {
                        startTimer();
                        context.read<AppBloc>().add(
                              LoadData(
                                callApiFunction: () async => await locator
                                    .apiManager
                                    .sendSmsVerificationCode(
                                  _controller.text.replaceAll(' ', ''),
                                ),
                                whoCalledBloc: WhoCalledBloc.login,
                              ),
                            );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'دریافت مجدد کد از طریق پیامک',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                            fontFamily: Styles.fonts.vazirMatn,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
