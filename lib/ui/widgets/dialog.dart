import 'package:dictionary/core/resources/r.dart';
import 'package:flutter/material.dart';

Future<void> getDialogNewtworkConnectionFailed(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: R.appColor.clr.black,
        title: Text(
          'Please Check Your Connection',
          style: TextStyle(color: R.appColor.clr.errorColor),
        ),
        content: const Text(
          "You are not connected to the internet. Please connect to the internet and try again.",
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              'Okay',
              style: TextStyle(color: R.appColor.clr.black),
            ),
            onPressed: () {
               Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
