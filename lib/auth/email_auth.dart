import 'package:cs_tech_task/auth/manager/auth_cubit.dart';
import 'package:cs_tech_task/home/home.dart';
import 'package:cs_tech_task/models/register_model.dart';
import 'package:cs_tech_task/services/services.dart';
import 'package:cs_tech_task/utils/app_images.dart';
import 'package:cs_tech_task/utils/app_styles.dart';
import 'package:cs_tech_task/widgets/custom_text_field.dart';
import 'package:cs_tech_task/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAuth extends StatefulWidget {
  const EmailAuth({super.key});

  @override
  State<EmailAuth> createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController refCode = TextEditingController();
  final ApiService service = ApiService();
  late AuthCubit cubit;
  RegisterModel registerModel = RegisterModel();
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<AuthCubit>(context);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    refCode.dispose();
    super.dispose();
  }

  void emailReferral() async {
    registerModel.email = email.text;
    registerModel.password = password.text;
    registerModel.referralCode = refCode.text;
    registerModel.userId = cubit.userId;
    cubit.setLoading(true);

    try {
      final res = await service.emailReferral(registerModel);
      final data = res.data as Map<String, dynamic>;
      final message = data['data']['message'];
      if (message != 'User Not Found' || message != 'Email exists') {
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
              CustomTextField(
                hintText: 'Your Email',
                controller: email,
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                hintText: 'Create Password',
                isPassword: true,
                controller: password,
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                hintText: 'Referral Code (Optional)',
                controller: refCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
