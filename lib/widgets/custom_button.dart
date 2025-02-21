import 'package:cs_tech_task/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          minimumSize: Size(250.w, 60.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          )),
      child: Text(
        title,
        style: AppStyles.style20WhiteSemiBold,
      ),
    );
  }
}
