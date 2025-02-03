import 'package:cs_tech_task/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isPhone = false,
    this.isPassword = false,
  });
  final String hintText;
  final TextEditingController? controller;
  final bool isPhone;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isSecure;

  @override
  void initState() {
    super.initState();
    isSecure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Required field';
          }
          return null;
        },
        obscureText: isSecure,
        keyboardType:
            widget.isPhone ? TextInputType.phone : TextInputType.emailAddress,
        style: AppStyles.style15BlackRegular,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () => setState(() => isSecure = !isSecure),
                  icon: Icon(
                    isSecure
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: AppStyles.style15GreyRegular,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: borderDecoration(),
          enabledBorder: borderDecoration(),
          errorBorder: errBorderDecoration(),
          focusedErrorBorder: errBorderDecoration(),
        ),
      ),
    );
  }

  InputBorder borderDecoration() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    );
  }

  InputBorder errBorderDecoration() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1,
      ),
    );
  }
}
