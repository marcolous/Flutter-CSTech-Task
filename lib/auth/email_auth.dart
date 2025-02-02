import 'package:cs_tech_task/utils/app_images.dart';
import 'package:cs_tech_task/utils/app_styles.dart';
import 'package:cs_tech_task/widgets/custom_text_field.dart';
import 'package:cs_tech_task/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAuth extends StatelessWidget {
  const EmailAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: const Icon(
          Icons.arrow_forward_rounded,
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: SizedBox(
                  height: 150.w,
                  width: 200.w,
                  child: AppImages.logo,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Let\'s Begin!',
                style: AppStyles.style30BlackSemiBold,
              ),
              SizedBox(height: 20.h),
              Text(
                'Please enter your credentials to process',
                style: AppStyles.style15GreyRegular,
              ),
              SizedBox(height: 10.h),
              const CustomTextField(hintText: 'Your Email'),
              SizedBox(height: 10.h),
              const CustomTextField(
                  hintText: 'Create Password', isPassword: true),
              SizedBox(height: 10.h),
              const CustomTextField(hintText: 'Referral Code (Optional)'),
            ],
          ),
        ),
      ),
    );
  }
}
