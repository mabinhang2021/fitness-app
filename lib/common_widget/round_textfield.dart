import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';

class RoundTextfield extends StatefulWidget {
  final TextEditingController? controller;
  final String hitText;
  final TextInputType? keyboardType;
  final String icon;
  final EdgeInsets? margin;
  final bool isPasswordField;

  const RoundTextfield({
    super.key,
    required this.hitText,
    required this.icon,
    required this.controller,
    required this.margin,
    this.keyboardType,
    this.isPasswordField= false,
  });

  @override
  State<RoundTextfield> createState() => _RoundTextfieldState();
}

class _RoundTextfieldState extends State<RoundTextfield> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: TColor.borderColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPasswordField ? obscureText : false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: widget.hitText,
          prefixIcon: Image.asset(widget.icon, width: 18, height: 18),
          suffixIcon:
              widget.isPasswordField
                  ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: TColor.greyColor1,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                  : null,
          hintStyle: TextStyle(color: TColor.greyColor1, fontSize: 16),
        ),
      ),
    );
  }
}
