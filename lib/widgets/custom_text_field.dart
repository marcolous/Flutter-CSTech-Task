import 'package:cs_tech_task/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.controller});
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 250.w),
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
        keyboardType: TextInputType.phone,
        style: AppStyles.style15BlackRegular,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
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
