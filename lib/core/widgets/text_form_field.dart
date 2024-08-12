import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yara/core/constants/styles.dart';

class CustomTextFormField extends StatefulWidget {
  final Function? validator;
  final TextInputType? keyboardType;
  final Function? onChange;
  final TextEditingController controller;
  final String? hintText;
  final bool expands;

  const CustomTextFormField({
    super.key,
    this.validator,
    this.keyboardType,
    this.onChange,
    this.hintText,
    required this.expands,
    required this.controller,
  });

  static Widget formCreator({
    required TextInputType keyboardType,
    required String hint,
    required TextEditingController controller,
    bool? expands,
  }) {
    return CustomTextFormField(
      keyboardType: keyboardType,
      hintText: hint,
      controller: controller,
      expands: expands ?? false,
    );
  }

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        maxLines: widget.expands ? 8 : 1,
        // maxLength: widget.expands ? 512 : 1,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        // textAlign: TextAlign.center,
        expands: false,
        style: const TextStyle(
          // color: Color(0xff707070),
          color: Color(0xffececec),
          fontSize: 15,
          // fontWeight: FontWeight.w500,
        ),
        controller: widget.controller,
        // onFieldSubmitted: (term) {},

        // textInputAction: TextInputAction.done,

        decoration: InputDecoration(
          hintText: widget.hintText,
          alignLabelWithHint: true,
          hintStyle: TextStyle(
            fontFamily: Styles.fonts.vazirMatn,
            color: const Color(0xff9d9e9f),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0,
          ),
          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
                  iconSize: 20,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  icon: const Icon(
                    // phoneNumbEntered == true ? Icons.delete : null,
                    Icons.delete,
                    size: 18,
                  ),
                  onPressed: () {
                    widget.controller.clear();
                  },
                )
              : null,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff09aeea),
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
              color: Colors.grey.shade800.withOpacity(0.4),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(7.0)),
          ),
        ),
      ),
    );
  }
}
