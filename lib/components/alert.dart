import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final String title;
  final String msg;
  final String okText;
  final VoidCallback? onOk;
  final Color? okColor;
  const AlertWidget(
      {super.key,
      this.title = "",
      this.msg = "",
      this.okText = "OK",
      this.onOk,
      this.okColor});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        // constraints: const BoxConstraints(minHeight: 150),
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(msg),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: okColor ?? Colors.blueAccent),
                          onPressed: () {
                            if (onOk == null) {
                              Navigator.pop(context);
                            } else {
                              Navigator.pop(context);
                              onOk!();
                            }
                          },
                          child: Text(okText)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Alert {
  static void showErrorAlert(BuildContext context, {dynamic err}) {
    if (err["code"] == 5001) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertWidget(
            title: err["error_title"].toString(),
            msg: err["error_msg"].toString(),
            okText: "CLOSE",
            onOk: () {
              Navigator.pop(context);
            },
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertWidget(
            title: err["error_title"].toString(),
            msg: err["error_msg"].toString(),
            okText: "CLOSE",
          );
        },
      );
    }
  }

  static void show(BuildContext context,
      {String title = "",
      String desc = "",
      String okText = "Accept",
      VoidCallback? onOk,
      Color? okColor}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertWidget(
          title: title,
          msg: desc,
          okText: okText,
          onOk: onOk,
          okColor: okColor,
        );
      },
    );
  }
}
