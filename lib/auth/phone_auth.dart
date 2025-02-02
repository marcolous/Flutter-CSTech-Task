import 'package:cs_tech_task/auth/widgets/animated_switch.dart';
import 'package:cs_tech_task/utils/app_images.dart';
import 'package:cs_tech_task/utils/app_styles.dart';
import 'package:cs_tech_task/widgets/custom_text_field.dart';
import 'package:cs_tech_task/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150.w,
                width: 200.w,
                child: AppImages.logo,
              ),
              SizedBox(height: 15.h),
              const AnimatedSwitch(),
              SizedBox(height: 15.h),
              Text(
                'Glad to see you!',
                style: AppStyles.style30BlackSemiBold,
              ),
              SizedBox(height: 15.h),
              Text(
                'Please provide your phone number',
                style: AppStyles.style15GreyRegular,
              ),
              SizedBox(height: 15.h),
              const CustomTextField(hintText: 'Phone'),
              SizedBox(height: 20.h),
              const CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          minimumSize: Size(250.w, 60.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          )),
      child: Text(
        'Send Code',
        style: AppStyles.style120WhiteSemiBold,
      ),
    );
  }
}
