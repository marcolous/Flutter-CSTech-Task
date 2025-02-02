import 'package:cs_tech_task/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedSwitch extends StatefulWidget {
  const AnimatedSwitch({super.key});

  @override
  State<AnimatedSwitch> createState() => _AnimatedSwitchState();
}

class _AnimatedSwitchState extends State<AnimatedSwitch> {
  bool isPhoneSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200.w),
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment:
                isPhoneSelected ? Alignment.centerLeft : Alignment.centerRight,
            duration: const Duration(milliseconds: 200),
            child: Container(
              height: 50.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => setState(() => isPhoneSelected = true),
                child: Text('Phone',
                    style: AppStyles.style15BlackSemiBold.copyWith(
                      color: isPhoneSelected ? Colors.white : Colors.black,
                    )),
              ),
              TextButton(
                onPressed: () => setState(() => isPhoneSelected = false),
                child: Text(
                  'Email',
                  style: AppStyles.style15BlackSemiBold.copyWith(
                    color: !isPhoneSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}