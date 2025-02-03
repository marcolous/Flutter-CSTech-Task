import 'package:cs_tech_task/home/widgets/search_widget.dart';
import 'package:cs_tech_task/utils/app_images.dart';
import 'package:cs_tech_task/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SafeArea(child: Drawer()),
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            cardsListView(),
            SizedBox(height: 20.h),
            KYCCard(),
            SizedBox(height: 20.h),
            categoriesListView(),
            SizedBox(height: 20.h),
            exclusiveListView(),
          ],
        ),
      ),
    );
  }

  Widget exclusiveListView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: const BoxDecoration(
        color: Color(0xff63b0cc),
      ),
      height: 350.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EXCULSIVE FOR YOU',
                  style: AppStyles.style20WhiteSemiBold,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 200.w,
                          height: 200.w,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: AppImages.cards,
                        ),
                        Text('data'),
                        Text('data'),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10.w,
                    top: 10.w,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        'data',
                        style: AppStyles.style15WhiteSemiBold,
                      ),
                    ),
                  )
                ],
              ),
              separatorBuilder: (context, index) => SizedBox(width: 15.w),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget categoriesListView() {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
            // width: 70.w,
            // height: 50,
            child: Column(
          children: [
            CircleAvatar(
              maxRadius: 35.r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: AppImages.cards,
              ),
            ),
            Text('data'),
          ],
        )),
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
        itemCount: 10,
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      actions: [
        const SearchWidget(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded),
        )
      ],
    );
  }

  Padding KYCCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff5055c9),
              Color(0xff8b91f7),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'KYC Pending',
              style: AppStyles.style20WhiteSemiBold,
            ),
            Text(
              'You need to provide the required documents for your account activation',
              textAlign: TextAlign.center,
              style: AppStyles.style15WhiteSemiBold,
            ),
            Text(
              'Click Here',
              style: AppStyles.style20WhiteSemiBold.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardsListView() {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: AppImages.cards,
        ),
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
        itemCount: 10,
      ),
    );
  }
}
