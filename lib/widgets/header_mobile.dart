import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/style.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onMenuTap,
  });
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0.h,
      margin: EdgeInsets.fromLTRB(40.w, 5.h, 20.w, 5.h),
      decoration: kHederDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(Icons.menu),
          ),
          SizedBox(width: 15.w),
        ],
      ),
    );
  }
}
