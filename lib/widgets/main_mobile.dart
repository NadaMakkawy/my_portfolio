import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height.h;
    final screenWidth = screenSize.width.w;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40.0.w,
        vertical: 30.0.h,
      ),
      height: screenHeight.h,
      constraints: BoxConstraints(
        minHeight: 560.0.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldBg.withOpacity(0.6),
                CustomColor.scaffoldBg.withOpacity(0.6),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              "assets/humming_bird_dart_flutter.png",
              width: screenWidth.w,
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            "Hi,\nI'm Nada Mostafa\nA Flutter Developer",
            style: TextStyle(
              fontSize: 24.sp,
              height: 1.5.h,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            width: 190.0.w,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Contact me",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
