import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '/utils/extentions.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.label,
    this.icon,
    this.radius = 15,
    this.obscure = false,
    this.type = TextInputType.text,
    this.controller,
    this.hasIcon = true,
    required this.validator,
    this.maxLines,
    this.minLines,
    this.expands = false,
    this.iconPad,
    this.suffixIcon,
    this.captitalise = false,
    this.hint,
    Key? key,
  }) : super(key: key);

  final String? hint;
  final IconData? icon;
  final String label;
  final TextInputType type;
  final double radius;
  final bool hasIcon, obscure, expands, captitalise;
  final TextEditingController? controller;
  final List<String? Function(String?)> validator;
  final int? maxLines, minLines;
  final EdgeInsets? iconPad;
  final Widget? suffixIcon;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0.hp),
      child: FormBuilderTextField(
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        textCapitalization: widget.captitalise ? TextCapitalization.words : TextCapitalization.none,
        controller: widget.controller,
        name: widget.label.toLowerCase().replaceAll(' ', '_'),
        obscureText: widget.obscure ? obscure : false,
        keyboardType: widget.type,
        validator: FormBuilderValidators.compose(widget.validator),
        style: TextStyle(fontSize: Get.height > 1000 ? 11.0.sp : 14.0.sp),
        decoration: InputDecoration(
          // labelText: widget.label,
          fillColor: Colors.white,
          filled: true,
          // labelStyle: const TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.all(Get.height > 1000 ? 0 : 15),
          prefixIcon: Padding(
            padding: widget.iconPad ?? EdgeInsets.symmetric(horizontal: 1.0.wp),
            child: Icon(widget.icon, color: Theme.of(context).textTheme.bodyText1!.color, size: Get.height > 1000 ? 11.0.sp : 19.0.sp),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.radius)),
          hintText: widget.hint ?? widget.label,
          suffixIcon: widget.obscure
              ? Padding(
                  padding: EdgeInsets.only(right: 1.0.wp),
                  child: IconButton(
                    onPressed: () => setState(() => obscure = !obscure),
                    icon: Icon(obscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye, color: Theme.of(context).textTheme.bodyText1!.color, size: Get.height > 1000 ? 10.5.sp : 19.0.sp),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(right: 1.0.wp),
                  child: widget.suffixIcon,
                ),
        ),
      ),
    );
  }
}
