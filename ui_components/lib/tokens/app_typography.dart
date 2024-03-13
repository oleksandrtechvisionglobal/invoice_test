import 'package:flutter/material.dart';
import 'package:ui_components/primitives/font_family.dart';
import 'package:ui_components/primitives/font_size.dart';
import 'package:ui_components/primitives/font_weight.dart';
import 'package:ui_components/primitives/letter_spacings.dart';
import 'package:ui_components/primitives/line_heights.dart';

class AppTypography {
  static TextStyle headingL(Color color) {
    return TextStyle(
        fontFamily: FontFamily.leagueSpartan,
        fontWeight: FontWeights.bold,
        fontSize: FontSize.FontSizeL,
        color: color,
        letterSpacing: LetterSpacings.letterSpacingL,
        height: LineHeights.lineHeightL._toFigmaHeight(FontSize.FontSizeL));
  }

  static TextStyle headingM(Color color) {
    return TextStyle(
        fontFamily: FontFamily.leagueSpartan,
        fontWeight: FontWeights.bold,
        fontSize: FontSize.FontSizeM,
        color: color,
        height: LineHeights.lineHeightS._toFigmaHeight(FontSize.FontSizeM),
        letterSpacing: LetterSpacings.letterSpacingM);
  }

  static TextStyle headingS(Color color) {
    return TextStyle(
        fontFamily: FontFamily.leagueSpartan,
        fontWeight: FontWeights.bold,
        fontSize: FontSize.FontSizeS,
        color: color,
        letterSpacing: LetterSpacings.letterSpacingS,
        height: LineHeights.lineHeightM._toFigmaHeight(FontSize.FontSizeS));
  }

  static TextStyle headingSVariant(Color color) {
    return TextStyle(
        fontFamily: FontFamily.leagueSpartan,
        fontWeight: FontWeights.bold,
        fontSize: FontSize.FontSizeS,
        color: color,
        letterSpacing: LetterSpacings.letterSpacingS,
        height: LineHeights.lineHeightXXS._toFigmaHeight(FontSize.FontSizeS));
  }

  static TextStyle body(Color color) {
    return TextStyle(
        fontFamily: FontFamily.leagueSpartan,
        fontWeight: FontWeights.medium,
        fontSize: FontSize.FontSizeXS,
        color: color,
        letterSpacing: LetterSpacings.letterSpacingXS,
        height: LineHeights.lineHeightXS._toFigmaHeight(FontSize.FontSizeXS));
  }

  static TextStyle bodyVariant(Color color) {
    return TextStyle(
        fontFamily: FontFamily.leagueSpartan,
        fontWeight: FontWeights.medium,
        fontSize: FontSize.FontSizeXS,
        color: color,
        letterSpacing: LetterSpacings.letterSpacingS,
        height: LineHeights.lineHeightXXS._toFigmaHeight(FontSize.FontSizeXS));
  }

  static TextStyle itemsTitle(Color color) {
    return TextStyle(
        fontFamily: FontFamily.leagueSpartan,
        fontSize: FontSize.FontSizeXM,
        color: color,
        letterSpacing: LetterSpacings.letterSpacingSVariant,
        height: LineHeights.lineHeightL._toFigmaHeight(FontSize.FontSizeXM));
  }
}

extension FigmaDimention on double {
  double _toFigmaHeight(double fontSize) {
    return this / fontSize;
  }
}
