import 'dart:developer';

import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final String title;
  final String msg;
  const AlertWidget({super.key, this.title = "", this.msg = ""});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        child: Column(
          children: [
            Text(title),
            Text(msg),
          ],
        ),
      ),
    );
  }
}

class Alert {
  static void showErrorAlert(BuildContext context, {Map? err}) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertWidget(
          title: err!["error_title"] ?? "",
          msg: err!["error_msg"] ?? "",
        );
      },
    );
  }
}
