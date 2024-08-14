import 'package:flutter/material.dart';

class ContactModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void clearFields() {
    nameController.clear();
    emailController.clear();
    messageController.clear();
  }
}
