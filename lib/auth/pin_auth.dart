import 'package:cs_tech_task/auth/email_auth.dart';
import 'package:cs_tech_task/auth/manager/auth_cubit.dart';
import 'package:cs_tech_task/auth/widgets/timer_with_button.dart';
import 'package:cs_tech_task/home/home.dart';
import 'package:cs_tech_task/models/otp_model.dart';
import 'package:cs_tech_task/services/services.dart';
import 'package:cs_tech_task/utils/app_images.dart';
import 'package:cs_tech_task/utils/app_styles.dart';
import 'package:cs_tech_task/widgets/custom_button.dart';
import 'package:cs_tech_task/widgets/custom_pin.dart';
import 'package:cs_tech_task/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinAuth extends StatefulWidget {
  const PinAuth({super.key});

  @override
  State<PinAuth> createState() => _PinAuthState();
}

class _PinAuthState extends State<PinAuth> {
  TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AuthCubit cubit;
  final ApiService service = ApiService();
  final OtpModel otp = OtpModel();

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<AuthCubit>(context);
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  void submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      otp.otp = pinController.text;
      otp.userId = cubit.userId;
      otp.deviceId = cubit.deviceId;
      cubit.setLoading(true);

      try {
        final res = await service.verifyOtp(otp);
        if (res != null) {
          final data = res.data as Map<String, dynamic>;
          //TODO: check if the user registered before
          // if (data['']) {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const EmailAuth(),
          //       ));
          //   return;
          // }
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ));
        }
      } finally {
        cubit.setLoading(false);
      }
    }
  }

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
                child: AppImages.pin,
              ),
              SizedBox(height: 20.h),
              Text(
                'OTP Verification',
                style: AppStyles.style30BlackSemiBold,
              ),
              SizedBox(height: 20.h),
              Text(
                'We have sent a unique OTP number to your mobile +91${cubit.number}',
                style: AppStyles.style15GreyRegular,
              ),
              SizedBox(height: 20.h),
              Form(
                key: _formKey,
                child: Align(
                  child: CustomPinPut(
                    pinController: pinController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the OTP';
                      }
                      if (value.length < 4) {
                        return 'OTP must be 4 digits';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              const TimerWithButton(),
              SizedBox(height: 10.h),
              Align(
                child: CustomButton(
                  title: 'Submit',
                  onPressed: submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
