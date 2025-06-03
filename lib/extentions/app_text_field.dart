import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String fieldLabel;
  final String? error;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final bool obscureText;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixSvgPath; // add this to AppTextField constructor
  final int? maxLines;
  final Color? textColor;
  final int? minLines;
  final bool enabled;
  final double? iconHight;
  final double? iconWidth;
  final bool needRightPadding;
  final Color? fillColor;
  final bool? readyOnly;
  final Image? suffixIcon;
  final Function()? onSuffixIconPressed;

  const AppTextField({
    super.key,
    required this.controller,
    required this.fieldLabel,
    this.prefixSvgPath,
    this.error,
    this.onChange,
    this.onSubmitted,
    this.obscureText = false,
    this.textInputType,
    this.inputFormatters,
    this.maxLines = 1,
    this.textColor,
    this.needRightPadding = false,
    this.fillColor,
    this.minLines,
    this.iconHight = 40,
    this.iconWidth = 40,
    this.enabled = true,
    this.readyOnly = false,
    this.suffixIcon,
    this.onSuffixIconPressed,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      readOnly: widget.readyOnly ?? false,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.textInputType,
      onChanged: widget.onChange,
      onSubmitted: widget.onSubmitted,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: TextStyle(
        color: widget.textColor ?? Colors.black87,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: widget.fieldLabel,
        labelStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16,
        ),
        filled: true,
        fillColor: widget.fillColor ?? Colors.white,
        prefixIcon: widget.prefixSvgPath != null
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: SvgPicture.asset(
            widget.prefixSvgPath!,
            width: 15,
            height: 15,
          ),
        )
            : null,

        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
          onTap: widget.onSuffixIconPressed,
          child: Container(
            height: widget.iconHight ?? 40,
            width: widget.iconWidth ?? 40,
            margin: widget.needRightPadding
                ? EdgeInsets.symmetric(vertical: 40, horizontal: 40)
                : const EdgeInsets.only(left: 10),

          ),
        )
            : null,
        enabled: widget.enabled,
        errorText: widget.error,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
                width: 1
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300, // Light gray border
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.red.shade300,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.red.shade300,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
