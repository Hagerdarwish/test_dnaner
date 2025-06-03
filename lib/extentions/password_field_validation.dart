import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordFieldWithValidation extends StatefulWidget {
  final TextEditingController controller;
  final String fieldLabel;

  const PasswordFieldWithValidation({
    super.key,
    required this.controller,
    this.fieldLabel = 'كلمة المرور',
  });

  @override
  State<PasswordFieldWithValidation> createState() =>
      _PasswordFieldWithValidationState();
}

class _PasswordFieldWithValidationState
    extends State<PasswordFieldWithValidation> {
  late FocusNode _focusNode;
  bool obscureText = true;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });

    widget.controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // Password validation conditions
  bool get hasMinLength => widget.controller.text.length >= 8;
  bool get hasDigit => RegExp(r'\d').hasMatch(widget.controller.text);
  bool get hasUpper => RegExp(r'[A-Z]').hasMatch(widget.controller.text);
  bool get hasLower => RegExp(r'[a-z]').hasMatch(widget.controller.text);
  bool get hasSpecial =>
      RegExp(r'[!@#\$&*~%^()\-_=+{};:,<.>?]').hasMatch(widget.controller.text);

  Widget _buildCheck(String label, bool isValid) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.cancel,
            color: isValid ? Colors.green : Colors.grey,
            size: 18,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: isValid ? Colors.green : Colors.grey,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: obscureText,
          onChanged: (_) => setState(() {}),
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            labelText: widget.fieldLabel,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('images/Password.svg'),
            ),
            suffixIcon: IconButton(
              icon: Icon(obscureText ? Icons.lock : Icons.lock_open),
              onPressed: () => setState(() => obscureText = !obscureText),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),

          ),
        ),
        if (isFocused) ...[
          SizedBox(height: 12),
          _buildCheck("٨ أحرف على الأقل", hasMinLength),
          _buildCheck("رقم واحد على الأقل (0-9)", hasDigit),
          _buildCheck("على الأقل حرف كبير واحد", hasUpper),
          _buildCheck("على الأقل حرف صغير واحد", hasLower),
          _buildCheck("حرف خاص واحد على الأقل، مثل ! @ # ؟", hasSpecial),
        ]
      ],
    );
  }
}
