import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../utils/project_utils.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width.w;
    return Container(
      width: screenWidth.w,
      padding: EdgeInsets.fromLTRB(25.w, 20.h, 25.w, 60.h),
      child: Column(
        children: [
          const Text(
            "My projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(height: 50.h),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900.w),
            child: Wrap(
              spacing: 25.sp,
              runSpacing: 25.sp,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: workProjectUtils[i],
                  ),
              ],
            ),
          ),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
