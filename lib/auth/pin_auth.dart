import 'package:cs_tech_task/auth/widgets/timer_with_button.dart';
import 'package:cs_tech_task/utils/app_images.dart';
import 'package:cs_tech_task/utils/app_styles.dart';
import 'package:cs_tech_task/widgets/custom_button.dart';
import 'package:cs_tech_task/widgets/custom_pin.dart';
import 'package:cs_tech_task/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinAuth extends StatefulWidget {
  const PinAuth({super.key});

  @override
  State<PinAuth> createState() => _PinAuthState();
}

class _PinAuthState extends State<PinAuth> {
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150.w,
                // width: 200.w,
                child: AppImages.pin,
              ),
              SizedBox(height: 20.h),
              Text(
                'OTP Verification',
                style: AppStyles.style30BlackSemiBold,
              ),
              SizedBox(height: 20.h),
              Text(
                'We have sent a unique OTP number to your mobile +11111',
                style: AppStyles.style15GreyRegular,
              ),
              SizedBox(height: 20.h),
              Align(
                child: CustomPinPut(pinController: pinController),
              ),
              SizedBox(height: 10.h),
              const TimerWithButton(),
              SizedBox(height: 10.h),
              const Align(
                child: CustomButton(title: 'Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
