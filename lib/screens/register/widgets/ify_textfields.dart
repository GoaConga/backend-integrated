import 'package:flutter/material.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';


Widget primaryTextField(String preText, String hintText, bool isPassword, TextEditingController editingController, TextInputType inputType, int maxLines, int maxLength) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 3, 0, 2),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            preText.toLowerCase(),
            style: IFYFonts.inputPreText),),
      ),
      TextFormField(
        keyboardType: inputType,
        controller: editingController,
        obscureText: isPassword,
        maxLines: maxLines,
        maxLength: maxLength,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: IFYFonts.inputFieldText,
          filled: true,
          fillColor: IFYColors.inputFieldBackground,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.white, width: 1)
          ),
        ),
        style: IFYFonts.inputFieldText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'input is empty';
          }
          return null;
        }
      ),
    ],
  );
}