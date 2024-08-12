import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/assets_path.dart';
import '../../../core/widgets/message_shape.dart';
import '../../../core/constants/styles.dart';
import '../widgets/channel_details_dialog.dart';
import '../widgets/floating_modal.dart';
import '../widgets/modal_fit.dart';
import '../widgets/settings_dialog.dart';

class Channel extends StatefulWidget {
  final String title;

  const Channel({
    super.key,
    required this.title,
  });

  @override
  State<Channel> createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  final TextEditingController _controller = TextEditingController();
  int _lines = 1;
  int a = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateMaxLines(String text) {
    setState(() {
      final lines = '\n'.allMatches(text).length + 1;
      a = text.length;
      if (lines != _lines) {
        _lines = lines;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xffc5d4df),
        appBar: AppBar(
          backgroundColor: const Color(0xff337c67),
          title: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              showDialog(
                context: this.context,
                builder: (BuildContext dialogContext) {
                  return ChannelDetailsDialog(title: widget.title);
                },
              );
            },
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.pink.shade300,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: Styles.fonts.vazirMatn,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.ellipsis_vertical,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              final key = GlobalKey();
              if (index == 0) {
                return const SizedBox(height: 20);
              }
              return GestureDetector(
                key: key,
                onTap: () {
                  final RenderBox renderBox =
                      key.currentContext?.findRenderObject() as RenderBox;
                  final Offset offset = renderBox.localToGlobal(Offset.zero);
                  showMenu(
                    context: context,
                    elevation: 10,
                    constraints: const BoxConstraints(minWidth: 200),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    position: RelativeRect.fromLTRB(
                      offset.dx,
                      offset.dy,
                      offset.dx + renderBox.size.width,
                      offset.dy + renderBox.size.height,
                    ),
                    items: popupMenuItemCreator(
                      index + 1,
                      [
                        'ارسال',
                        'کپی',
                        'کپی لینک',
                        'ویرایش',
                        'حذف',
                      ],
                    ),
                  ).then((value) {
                    // Handle menu item selection
                    if (value != null) {
                      print('Selected: $value');
                    }
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 65.0),
                  child: MessageShape(),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 7,
                spreadRadius: -2,
              ),
            ],
          ),
          constraints: const BoxConstraints(
            maxHeight: 270,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: Row(
              crossAxisAlignment: _lines > 1
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AssetPaths.icons.emojis),
                ),
                Expanded(
                  child: TextFormField(
                    // maxLength: 30,
                    // keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (String text) {
                      _updateMaxLines(text);
                    },
                    style: TextStyle(
                      color: const Color(0xff707070),
                      fontFamily: Styles.fonts.vazirMatn,
                      fontSize: 14,
                    ),
                    controller: _controller,
                    // textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      counterText: "",
                      // constraints: const BoxConstraints(
                      //   maxHeight: 40,
                      // ),
                      isCollapsed: true,
                      // isDense: true,
                      suffixIconConstraints: const BoxConstraints(
                        minHeight: 24,
                        minWidth: 27,
                      ),
                      labelText: 'اطلاع رسانی',
                      labelStyle: TextStyle(
                        fontFamily: Styles.fonts.vazirMatn,
                        fontSize: 13,
                        // fontWeight: FontWeight.bold
                        // fontFamily: "Tehran3",
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    a > 0
                        ? AssetPaths.icons.sendMessage
                        : AssetPaths.icons.pickFile,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PopupMenuEntry<String>> popupMenuItemCreator(
    int index,
    List<String> itemsText,
  ) {
    return [
      ...List.generate(
        itemsText.length,
        (index) => PopupMenuItem<String>(
          value: itemsText[index],
          onTap: () {
            // send message
            switch (index) {
              case 0:
                {
                  showFloatingModalBottomSheet(
                    context: context,
                    builder: (context) => ModalFit(
                      onSendPressed: (String name) {},
                      onSettingsPressed: (BuildContext context) {
                        Navigator.pop(context);
                        Future.delayed(
                          const Duration(milliseconds: 700),
                          () {
                            showDialog(
                              context: this.context,
                              builder: (BuildContext dialogContext) {
                                return const SettingsDialog();
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                }
            }
          },
          child: Row(
            children: [
              const Icon(Icons.add),
              const SizedBox(width: 10),
              Text(
                itemsText[index],
                style: TextStyle(
                  fontFamily: Styles.fonts.vazirMatn,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
