import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color buttonPrimary;
  final Color buttonSecondary;
  final Color background;
  final Color textPrimary;
  final Color inputHint;
  final Color inputBackground;
  final Color textSelectedDropdown;
  final Color textButtonWhite;
  final Color borderColor;
  final Color borderColorActive;
  final Color cursorColor;
  final Color buttonSecondaryColor;
  final Color textButtonSecondaryColor;
  final Color buttonSecondaryHoverColor;
  final Color darkButtonColor;
  final Color darkButtonHoverColor;
  final Color textDarkButtonColor;
  final Color dangerColor;
  final Color dangerHoverColor;
  final Color stretchedButtonColor;
  final Color transparent = Colors.transparent;
  final Color dropdownBackground;
  final Color dropdownDivider;
  final Color dropdownItem;
  final Color dropdownItemSelected;
  final Color invoiceStatusPaid;
  final Color invoiceStatusPending;
  final Color invoiceStatusDraft;
  final Color groupLabelColor;
  final Color appBarBackground;
  final Color dividerColor;
  final Color calendarTextColor;
  final Color textClientColor;
  final Color textPrefixColor;
  final Color textDateColor;
  final Color scrollBarColor;
  final Color textDialogContent;
  final Color textQuantityColor;
  final Color amountBgColor;
  final Color shadowColor;
  final Color textFieldDisabledColor;

  const AppColors(
      {required this.buttonPrimary,
      required this.buttonSecondary,
      required this.background,
      required this.textPrimary,
      required this.inputHint,
      required this.inputBackground,
      required this.textSelectedDropdown,
      required this.textButtonWhite,
      required this.borderColor,
      required this.borderColorActive,
      required this.cursorColor,
      required this.buttonSecondaryColor,
      required this.textButtonSecondaryColor,
      required this.buttonSecondaryHoverColor,
      required this.darkButtonColor,
      required this.darkButtonHoverColor,
      required this.textDarkButtonColor,
      required this.dangerColor,
      required this.dangerHoverColor,
      required this.stretchedButtonColor,
      required this.dropdownBackground,
      required this.dropdownDivider,
      required this.dropdownItem,
      required this.dropdownItemSelected,
      required this.invoiceStatusPaid,
      required this.invoiceStatusPending,
      required this.invoiceStatusDraft,
      required this.groupLabelColor,
      required this.appBarBackground,
      required this.dividerColor,
      required this.calendarTextColor,
      required this.textClientColor,
      required this.textPrefixColor,
      required this.textDateColor,
      required this.scrollBarColor,
      required this.textDialogContent,
      required this.textQuantityColor,
      required this.amountBgColor,
      required this.shadowColor,
      required this.textFieldDisabledColor});

  @override
  ThemeExtension<AppColors> copyWith({
    Color? buttonPrimary,
    Color? buttonSecondary,
    Color? background,
    Color? textPrimary,
    Color? inputHint,
    Color? inputBackground,
    Color? textSelectedDropdown,
    Color? textButtonWhite,
    Color? borderColor,
    Color? borderColorActive,
    Color? cursorColor,
    Color? buttonSecondaryColor,
    Color? textButtonSecondaryColor,
    Color? buttonSecondaryHoverColor,
    Color? darkButtonColor,
    Color? darkButtonHoverColor,
    Color? textDarkButtonColor,
    Color? dangerColor,
    Color? dangerHoverColor,
    Color? stretchedButtonColor,
    Color? dropdownBackground,
    Color? dropdownDivider,
    Color? dropdownItem,
    Color? dropdownItemSelected,
    Color? invoiceStatusPaid,
    Color? invoiceStatusPending,
    Color? invoiceStatusDraft,
    Color? groupLabelColor,
    Color? appBarBackground,
    Color? dividerColor,
    Color? calendarTextColor,
    Color? textClientColor,
    Color? textPrefixColor,
    Color? textDateColor,
    Color? scrollBarColor,
    Color? textDialogContent,
    Color? textQuantityColor,
    Color? amountBgColor,
    Color? shadowColor,
    Color? textFieldDisabledColor,
  }) {
    return AppColors(
      buttonPrimary: buttonPrimary ?? this.buttonPrimary,
      buttonSecondary: buttonSecondary ?? this.buttonSecondary,
      background: background ?? this.background,
      textPrimary: textPrimary ?? this.textPrimary,
      inputHint: inputHint ?? this.inputHint,
      inputBackground: inputBackground ?? this.inputBackground,
      textSelectedDropdown: textSelectedDropdown ?? this.textSelectedDropdown,
      textButtonWhite: textButtonWhite ?? this.textButtonWhite,
      borderColor: borderColor ?? this.borderColor,
      borderColorActive: borderColorActive ?? this.borderColorActive,
      cursorColor: cursorColor ?? this.cursorColor,
      buttonSecondaryColor: buttonSecondaryColor ?? this.buttonSecondaryColor,
      textButtonSecondaryColor:
          textButtonSecondaryColor ?? this.textButtonSecondaryColor,
      buttonSecondaryHoverColor:
          buttonSecondaryHoverColor ?? this.buttonSecondaryHoverColor,
      darkButtonColor: darkButtonColor ?? this.darkButtonColor,
      darkButtonHoverColor: darkButtonHoverColor ?? this.darkButtonHoverColor,
      textDarkButtonColor: textDarkButtonColor ?? this.textDarkButtonColor,
      dangerColor: dangerColor ?? this.dangerColor,
      dangerHoverColor: dangerHoverColor ?? this.dangerHoverColor,
      stretchedButtonColor: stretchedButtonColor ?? this.stretchedButtonColor,
      dropdownBackground: dropdownBackground ?? this.dropdownBackground,
      dropdownDivider: dropdownDivider ?? this.dropdownDivider,
      dropdownItem: dropdownItem ?? this.dropdownItem,
      dropdownItemSelected: dropdownItemSelected ?? this.dropdownItemSelected,
      invoiceStatusPaid: invoiceStatusPaid ?? this.invoiceStatusPaid,
      invoiceStatusPending: invoiceStatusPending ?? this.invoiceStatusPending,
      invoiceStatusDraft: invoiceStatusDraft ?? this.invoiceStatusDraft,
      groupLabelColor: groupLabelColor ?? this.groupLabelColor,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      dividerColor: dividerColor ?? this.dividerColor,
      calendarTextColor: calendarTextColor ?? this.calendarTextColor,
      textClientColor: textClientColor ?? this.textClientColor,
      textPrefixColor: textPrefixColor ?? this.textPrefixColor,
      textDateColor: textDateColor ?? this.textDateColor,
      scrollBarColor: scrollBarColor ?? this.scrollBarColor,
      textDialogContent: textDialogContent ?? this.textDialogContent,
      textQuantityColor: textQuantityColor ?? this.textQuantityColor,
      amountBgColor: amountBgColor ?? this.amountBgColor,
      shadowColor: shadowColor ?? this.shadowColor,
      textFieldDisabledColor:
          textFieldDisabledColor ?? this.textFieldDisabledColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      buttonPrimary: Color.lerp(buttonPrimary, other.buttonPrimary, t)!,
      buttonSecondary: Color.lerp(buttonSecondary, other.buttonSecondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      inputHint: Color.lerp(inputHint, other.inputHint, t)!,
      inputBackground: Color.lerp(inputBackground, other.inputBackground, t)!,
      textSelectedDropdown:
          Color.lerp(textSelectedDropdown, other.textSelectedDropdown, t)!,
      textButtonWhite: Color.lerp(textButtonWhite, other.textButtonWhite, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderColorActive:
          Color.lerp(borderColorActive, other.borderColorActive, t)!,
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t)!,
      buttonSecondaryColor:
          Color.lerp(buttonSecondaryColor, other.buttonSecondaryColor, t)!,
      textButtonSecondaryColor: Color.lerp(
          textButtonSecondaryColor, other.textButtonSecondaryColor, t)!,
      buttonSecondaryHoverColor: Color.lerp(
          buttonSecondaryHoverColor, other.buttonSecondaryHoverColor, t)!,
      darkButtonColor: Color.lerp(darkButtonColor, other.darkButtonColor, t)!,
      darkButtonHoverColor:
          Color.lerp(darkButtonHoverColor, other.darkButtonHoverColor, t)!,
      textDarkButtonColor:
          Color.lerp(textDarkButtonColor, other.textDarkButtonColor, t)!,
      dangerColor: Color.lerp(dangerColor, other.dangerColor, t)!,
      dangerHoverColor:
          Color.lerp(dangerHoverColor, other.dangerHoverColor, t)!,
      stretchedButtonColor:
          Color.lerp(stretchedButtonColor, other.stretchedButtonColor, t)!,
      dropdownBackground:
          Color.lerp(dropdownBackground, other.dropdownBackground, t)!,
      dropdownDivider: Color.lerp(dropdownDivider, other.dropdownDivider, t)!,
      dropdownItem: Color.lerp(dropdownItem, other.dropdownItem, t)!,
      dropdownItemSelected:
          Color.lerp(dropdownItemSelected, other.dropdownItemSelected, t)!,
      invoiceStatusPaid:
          Color.lerp(invoiceStatusPaid, other.invoiceStatusPaid, t)!,
      invoiceStatusPending:
          Color.lerp(invoiceStatusPending, other.invoiceStatusPending, t)!,
      invoiceStatusDraft:
          Color.lerp(invoiceStatusDraft, other.invoiceStatusDraft, t)!,
      groupLabelColor: Color.lerp(groupLabelColor, other.groupLabelColor, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      calendarTextColor:
          Color.lerp(calendarTextColor, other.calendarTextColor, t)!,
      textClientColor: Color.lerp(textClientColor, other.textClientColor, t)!,
      textPrefixColor: Color.lerp(textPrefixColor, other.textPrefixColor, t)!,
      textDateColor: Color.lerp(textDateColor, other.textDateColor, t)!,
      scrollBarColor: Color.lerp(scrollBarColor, other.scrollBarColor, t)!,
      textDialogContent:
          Color.lerp(textDialogContent, other.textDialogContent, t)!,
      textQuantityColor:
          Color.lerp(textQuantityColor, other.textQuantityColor, t)!,
      amountBgColor: Color.lerp(amountBgColor, other.amountBgColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      textFieldDisabledColor:
          Color.lerp(textFieldDisabledColor, other.textFieldDisabledColor, t)!,
    );
  }
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}
