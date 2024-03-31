import 'package:dictionary/core/resources/app_color.dart';
import 'package:dictionary/core/resources/dimens.dart';
import 'package:dictionary/core/resources/text_styles.dart';

class R {
  static void refreshClass() {
    // _drawable = null;
    _appColor = null;
    _dimens = null;
  }

  static AppColor? _appColor;
  static AppColor get appColor => _appColor ??= AppColor();

  static Dimension? _dimens;
  static Dimension get dimens => _dimens ??= Dimension();

  static TextStyles? _textStyles;
  static TextStyles get textStyles => _textStyles ??= TextStyles();
}
