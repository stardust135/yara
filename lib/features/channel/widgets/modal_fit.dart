import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yara/core/constants/assets_path.dart';
import 'package:yara/core/constants/styles.dart';

class ModalFit extends StatefulWidget {
  final Function(String) onSendPressed;
  final Function(BuildContext) onSettingsPressed;

  const ModalFit({
    super.key,
    required this.onSendPressed,
    required this.onSettingsPressed,
  });

  @override
  State<ModalFit> createState() => _ModalFitState();
}

class _ModalFitState extends State<ModalFit> {
  int selectedItemIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      constraints: const BoxConstraints(
        maxHeight: 550,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.grey.shade300,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: searchBarCreator(),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  widget.onSettingsPressed(context);
                },
                child: Column(
                  children: [
                    Text(
                      'تنظیمات',
                      style: TextStyle(
                        fontFamily: Styles.fonts.vazirMatn,
                        color: Colors.black45,
                        fontSize: 12,
                      ),
                    ),
                    SvgPicture.asset(AssetPaths.icons.settings),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            height: 400,
            child: SingleChildScrollView(
              child: Wrap(
                runSpacing: 10,
                spacing: 25,
                children: List.generate(
                  50,
                  (index) {
                    switch (index) {
                      case 0:
                        return item('ایران ما', index);
                      case 1:
                        return item('پرونده ویژه', index);
                      case 2:
                        return item('همه ما', index);
                      default:
                        return item(
                          index.toString(),
                          index,
                        );
                    }
                  },
                ),
              ),
            ),
          ),
          if(selectedItemIndex != -1)
          Center(
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: TextButton(
                onPressed: () {
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'ارسال',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: Styles.fonts.vazirMatn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  item(String text, int selectedIndex) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              selectedItemIndex = selectedIndex;
            });
          },
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black38,
                  ),
                ),
              ),
              // badge
              if (selectedIndex == selectedItemIndex)
                Transform.translate(
                  offset: const Offset(2, 2),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xff37A9F0),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            fontFamily: Styles.fonts.vazirMatn,
            color: Colors.black,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  searchBarCreator() {
    return SearchBar(
      onTap: () {},
      elevation: const MaterialStatePropertyAll(0),
      backgroundColor: const MaterialStatePropertyAll(
        Color(0xffF2F4F5),
      ),
      trailing: [
        SvgPicture.asset(
          AssetPaths.icons.search,
          color: Colors.black38,
        ),
      ],
      constraints: const BoxConstraints(
        minHeight: 35,
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 12),
      ),
      hintText: 'ارسال به',
      hintStyle: MaterialStatePropertyAll(
        TextStyle(
          fontFamily: Styles.fonts.vazirMatn,
          color: Colors.black38,
          fontSize: 14,
        ),
      ),
    );
  }
}
