import 'package:cs_tech_task/auth/manager/auth_cubit.dart';
import 'package:cs_tech_task/auth/manager/auth_state.dart';
import 'package:cs_tech_task/auth/pin_auth.dart';
import 'package:cs_tech_task/auth/widgets/animated_switch.dart';
import 'package:cs_tech_task/models/login_model.dart';
import 'package:cs_tech_task/services/services.dart';
import 'package:cs_tech_task/utils/app_images.dart';
import 'package:cs_tech_task/utils/app_styles.dart';
import 'package:cs_tech_task/widgets/custom_button.dart';
import 'package:cs_tech_task/widgets/custom_text_field.dart';
import 'package:cs_tech_task/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  late TextEditingController controller;
  late AuthCubit cubit;
  final ApiService service = ApiService();
  final LoginModel login = LoginModel();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    cubit = BlocProvider.of<AuthCubit>(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void sendOtp() async {
    login.mobileNumber = controller.text;
    login.deviceId = '62b341aeb0ab5ebe28a758a3';
    cubit.setLoading(true);

    try {
      await service.sendOtp(login);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PinAuth(),
          ));
    } finally {
      cubit.setLoading(false);
    }
  }

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: CustomTextField(
                  hintText: 'Phone',
                  isPhone: true,
                  controller: controller,
                  isPassword: false,
                ),
              ),
              SizedBox(height: 20.h),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          title: 'Send Code',
                          onPressed: sendOtp,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
