import 'package:dictionary/core/resources/r.dart';
import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        color: R.appColor.clr.mediumpurple,
      );
  }
}
