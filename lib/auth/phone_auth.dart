import 'package:cs_tech_task/auth/widgets/animated_switch.dart';
import 'package:cs_tech_task/utils/app_images.dart';
import 'package:cs_tech_task/utils/app_styles.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.w,
              width: 200.w,
              child: AppImages.logo,
            ),
            SizedBox(height: 10.h),
            const AnimatedSwitch(),
            SizedBox(height: 10.h),
            Text(
              'Glad to see you!',
              style: AppStyles.style30BlackSemiBold,
            ),
            SizedBox(height: 10.h),
            Text(
              'Please provide your phone number',
              style: AppStyles.style15GreyRegular,
            ),
          ],
        ),
      ),
    );
  }
}
