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
      drawer: const SafeArea(
        child: Drawer(
            // child: Text('data'),
            ),
      ),
      body: Container(
        color: Colors.amber,
      ),
      // appBar: HomeAppBar(),
      appBar: AppBar(
        actions: [
          const SearchWidget(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          )
        ],
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController? controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: AppStyles.style15BlackRegular,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.grey[600],
            ),
          ),
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: 55.w,
            child: AppImages.search,
          ),
          hintText: 'Search here',
          hintStyle: AppStyles.style15GreyRegular,
          filled: true,
          fillColor: Colors.grey[200],
          focusedBorder: borderDecoration(),
          enabledBorder: borderDecoration(),
        ),
      ),
    );
  }

  InputBorder borderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        color: Colors.grey[200]!,
        width: 1,
      ),
    );
  }
}
