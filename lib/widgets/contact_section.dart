import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/size.dart';
import '../constants/links.dart';
import '../constants/colors.dart';
import '../providers/contact_provider.dart';
import '../widgets/custom_text_field.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.w, 20.h, 25.w, 60.h),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          const Text(
            "Contact me",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(height: 50.h),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 700.w,
              maxHeight: 100.h,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth.w >= kMinDesktopWidth.w) {
                  return buildNameEmailFieldDesktop(context);
                }
                return buildNameEmailFieldMobile(context);
              },
            ),
          ),
          SizedBox(height: 15.h),
          Consumer<ContactModel>(builder: (context, contactModel, child) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 700.w,
              ),
              child: CustomTextField(
                hintText: "Your message",
                maxLines: 16,
                controller: contactModel.messageController,
              ),
            );
          }),
          SizedBox(height: 20.h),
          Consumer<ContactModel>(builder: (context, contactModel, child) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 700.w,
              ),
              child: SizedBox(
                width: double.maxFinite.w,
                child: ElevatedButton(
                  onPressed: () {
                    sendEmail(contactModel, context);
                  },
                  child: const Text(
                    "Contact me",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 30.h),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 300.w,
            ),
            child: const Divider(),
          ),
          SizedBox(height: 15.h),
          buildSocialMediaLinks(),
        ],
      ),
    );
  }

  Wrap buildSocialMediaLinks() {
    return Wrap(
      spacing: 12.sp,
      runSpacing: 12.sp,
      alignment: WrapAlignment.center,
      children: [
        buildSocialMediaIcon(Links.github, "assets/github.png"),
        buildSocialMediaIcon(Links.linkedIn, "assets/linkedin.png"),
        buildSocialMediaIcon(Links.fiverr, "assets/fiverr_icon.png"),
      ],
    );
  }

  Consumer buildSocialMediaIcon(String link, String asset) {
    return Consumer<ContactModel>(builder: (context, contactModel, child) {
      return InkWell(
        onTap: () {
          // js.context.callMethod('open', [link]);
          // urlLinkOpen(contactModel, context, link);
          _launchURL(link);
        },
        child: Image.asset(
          asset,
          width: 28.w,
        ),
      );
    });
  }

  Future<void> sendEmail(
      ContactModel contactModel, BuildContext context) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'dew161995@yahoo.com',
      query:
          'subject=Contact from ${contactModel.nameController.text}&body=${contactModel.messageController.text}',
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
      contactModel.clearFields();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch email client')),
      );
    }
  }

  _launchURL(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Row buildNameEmailFieldDesktop(BuildContext context) {
    return Row(
      children: [
        Consumer<ContactModel>(builder: (context, contactModel, child) {
          return Flexible(
            child: CustomTextField(
              hintText: "Your name",
              controller: contactModel.nameController,
            ),
          );
        }),
        SizedBox(width: 15.w),
        Consumer<ContactModel>(builder: (context, contactModel, child) {
          return Flexible(
            child: CustomTextField(
              hintText: "Your email",
              controller: contactModel.emailController,
            ),
          );
        }),
      ],
    );
  }

  Column buildNameEmailFieldMobile(BuildContext context) {
    return Column(
      children: [
        Consumer<ContactModel>(builder: (context, contactModel, child) {
          return Flexible(
            child: CustomTextField(
              hintText: "Your name",
              controller: contactModel.nameController,
            ),
          );
        }),
        SizedBox(height: 15.h),
        Consumer<ContactModel>(builder: (context, contactModel, child) {
          return Flexible(
            child: CustomTextField(
              hintText: "Your email",
              controller: contactModel.emailController,
            ),
          );
        }),
      ],
    );
  }
}
