import 'package:flutter/material.dart';
import 'package:ui_components/primitives/app_colors.dart';

import 'app_theme_colors.dart';

class AppTheme {
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() => _instance;

  AppTheme._internal();

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        extensions: <ThemeExtension<dynamic>>[
          AppColors(
            buttonPrimary: color01,
            buttonSecondary: color02,
            background: color11,
            textPrimary: color08,
            inputHint: color07,
            inputBackground: colorWhile,
            textSelectedDropdown: color01,
            textButtonWhite: colorWhile,
            borderColor: color05,
            borderColorActive: color02,
            cursorColor: color01,
            buttonSecondaryColor: color13,
            textButtonSecondaryColor: color07,
            buttonSecondaryHoverColor: color05,
            darkButtonColor: color14,
            darkButtonHoverColor: color08,
            textDarkButtonColor: color06,
            dangerColor: color09,
            dangerHoverColor: color10,
            stretchedButtonColor: color13,
            dropdownBackground: colorWhile,
            dropdownDivider: color05,
            dropdownItem: color08,
            dropdownItemSelected: color01,
            invoiceStatusPaid: green,
            invoiceStatusPending: orange,
            invoiceStatusDraft: gray,
            groupLabelColor: color01,
            appBarBackground: gray,
            dividerColor: grayLight,
            calendarTextColor: color08,
            textClientColor: grayLighter,
            textPrefixColor: color06,
            textDateColor: color07,
            scrollBarColor: color05,
            textDialogContent: color06,
            textQuantityColor: color07,
            amountBgColor: color14,
            shadowColor: color03.withOpacity(0.1),
            textFieldDisabledColor: color06,
          ),
        ],
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        extensions: <ThemeExtension<dynamic>>[
          AppColors(
              buttonPrimary: color01,
              buttonSecondary: color02,
              background: color12,
              textPrimary: colorWhile,
              inputHint: color05,
              inputBackground: color03,
              textSelectedDropdown: color02,
              textButtonWhite: colorWhile,
              borderColor: color04,
              borderColorActive: color04,
              cursorColor: color01,
              buttonSecondaryColor: color04,
              textButtonSecondaryColor: color07,
              buttonSecondaryHoverColor: colorWhile,
              darkButtonColor: color14,
              darkButtonHoverColor: color03,
              textDarkButtonColor: color05,
              dangerColor: color09,
              dangerHoverColor: color10,
              stretchedButtonColor: color06,
              dropdownBackground: color04,
              dropdownDivider: color03,
              dropdownItem: color05,
              dropdownItemSelected: color02,
              invoiceStatusPaid: green,
              invoiceStatusPending: orange,
              invoiceStatusDraft: gray,
              groupLabelColor: color01,
              appBarBackground: gray,
              dividerColor: grayLight,
              calendarTextColor: color05,
              textClientColor: colorWhile,
              textPrefixColor: color05,
              textDateColor: color05,
              scrollBarColor: color04,
              textDialogContent: color06,
              textQuantityColor: color06,
              amountBgColor: color08,
              shadowColor: color03.withOpacity(0.1),
              textFieldDisabledColor: color06),
        ],
      );
}
