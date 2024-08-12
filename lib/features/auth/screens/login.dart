import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yara/core/blocs/app_bloc.dart';
import 'package:yara/core/constants/styles.dart';
import 'package:yara/core/utils/enums.dart';
import 'package:yara/core/utils/extensions.dart';
import 'package:yara/features/auth/widgets/send_message_error_dialog.dart';
import 'package:yara/locator.dart';

import '../../../config/routes/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _formatPhoneNumber(String value) {
    // Remove all non-digits
    String text = value.replaceAll(RegExp(r'\D'), '');

    // Format the text with dashes
    String formatted = '';
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 3 == 0) {
        formatted += ' ';
      }
      formatted += text[i];
    }

    // Update the controller's text while preserving the cursor position
    _controller.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState?>(
      listenWhen: (_, current) {
        return current?.whoCalledBloc == WhoCalledBloc.login ? true : false;
      },
      listener: (BuildContext context, state) {
        if (state is AppDataCompleted &&
            state.whoCalledBloc == WhoCalledBloc.login) {
          context.pushNamed(
            Routes.smsVerify,
            arguments: {'phoneNumber': '+98${_controller.text.replaceAll(' ', '')}'},
          );
        }
        if (state is AppDataError &&
            state.whoCalledBloc == WhoCalledBloc.login) {
          showDialog(
            context: this.context,
            builder: (BuildContext dialogContext) {
              return const LoginErrorsDialog(
                title: 'عدم ارسال پیام',
                description: 'کد تایید پیامک نشد دوباره امتحان کنید.',
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
              'ورود به حساب کاربری',
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
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: TextField(
                        enabled: false,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: '+98',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: Styles.fonts.vazirMatn,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        // 9 digits + 2 spaces
                        maxLength: 12,
                        style: TextStyle(
                          fontFamily: Styles.fonts.vazirMatn,
                          color: Colors.black,
                        ),
                        onChanged: _formatPhoneNumber,
                        decoration: InputDecoration(
                          hintText: '--- --- --- ',
                          counterText: '',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: Styles.fonts.vazirMatn,
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
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
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'شماره موبایل خود را وارد کنید.',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: Styles.fonts.vazirMatn,
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (validate(_controller.text.replaceAll(' ', ''))) {
                logger.e('message');
                // call api
                context.read<AppBloc>().add(
                      LoadData(
                        callApiFunction: () async =>
                            await locator.apiManager.sendSmsVerificationCode(
                          _controller.text.replaceAll(' ', ''),
                        ),
                        whoCalledBloc: WhoCalledBloc.login,
                      ),
                    );
              } else {
                // show dialog
              }
            },
            backgroundColor: const Color(0xff337c67),
            child: const Icon(Icons.arrow_forward_rounded),
          ),
        ),
      ),
    );
  }

  bool validate(String phone) {
    if (phone.isNotEmpty && phone.length == 10) {
      return true;
    }
    return false;
  }
}

