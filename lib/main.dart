import 'package:cs_tech_task/auth/email_auth.dart';
import 'package:cs_tech_task/auth/manager/auth_cubit.dart';
import 'package:cs_tech_task/auth/phone_auth.dart';
import 'package:cs_tech_task/home/home.dart';
import 'package:cs_tech_task/home/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const CSTech());
}

class CSTech extends StatelessWidget {
  const CSTech({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => HomeCubit()..fetchHomeData()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          home: const PhoneAuth(),
        ),
      ),
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
    );
  }
}
