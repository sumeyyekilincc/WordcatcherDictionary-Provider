import 'package:dictionary/core/resources/r.dart';
import 'package:flutter/material.dart';

class TextStyles {
  final TextStyle defaultTxtStyle = TextStyle(
    color: R.appColor.clr.black,
    fontSize: R.dimens.dmn.detail,
  );

  final TextStyle searchTextStyle = TextStyle(
    fontSize: R.dimens.dmn.appBarTitle,
    fontWeight: FontWeight.bold,
  );
  final TextStyle whenSearchedNothingStyle = TextStyle(
    fontSize: R.dimens.dmn.appBarTitle2,
    color: R.appColor.clr.black,
  );
}
