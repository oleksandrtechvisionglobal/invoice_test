import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/gen/assets.gen.dart';
import 'package:ui_components/theme/app_theme_colors.dart';
import 'package:ui_components/tokens/app_paddings.dart';
import 'package:ui_components/tokens/app_typography.dart';

import 'app_calendar.dart';

class AppDatePicker extends StatefulWidget {
  final String hintText;
  final DateTime? initialDate;
  final bool enabled;
  final ValueChanged<DateTime>? onChanged;

  const AppDatePicker({
    Key? key,
    required this.hintText,
    this.onChanged,
    this.initialDate,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  String? _selectedItem;
  DateTime _selectedDate = DateTime.now();
  bool _expanded = false;
  String title = '';

  @override
  void initState() {
    _selectedDate = widget.initialDate ?? DateTime.now();
    _selectedItem =
        "${_selectedDate.day} ${Month.values[_selectedDate.month - 1].monthName} ${_selectedDate.year}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.enabled,
      child: Opacity(
        opacity: widget.enabled ? 1 : 0.5,
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField2(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            isExpanded: _expanded,
            customButton: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.hintText,
                  style: AppTypography.body(context.colors.inputHint),
                ),
                const SizedBox(height: 9),
                Container(
                  padding: AppPaddings.input,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _expanded
                          ? context.colors.borderColorActive
                          : context.colors.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    color: context.colors.inputBackground,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedItem ?? '',
                          style: AppTypography.headingSVariant(
                              context.colors.textPrimary),
                        ),
                      ),
                      Assets.icons.calendarIcon.svg(package: 'ui_components'),
                    ],
                  ),
                ),
              ],
            ),
            items: [
              DropdownMenuItem(
                enabled: false,
                child: Calendar(
                    initialDate: _selectedDate,
                    onChanged: (value) {
                      setState(() {
                        _selectedDate = value;
                        _selectedItem =
                            "${value.day} ${Month.values[value.month - 1].monthName} ${value.year}";
                        widget.onChanged?.call(value);
                        Navigator.of(context).pop();
                      });
                    }),
              )
            ],
            dropdownStyleData: DropdownStyleData(
              elevation: 4,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: context.colors.dropdownBackground,
                borderRadius: BorderRadius.circular(4),
              ),
              offset: const Offset(0, -24),
            ),
            menuItemStyleData: MenuItemStyleData(
              padding: EdgeInsets.zero,
              customHeights: [250],
            ),
            onChanged: (value) {
              setState(() {
                _selectedItem = value as String;
              });
            },
            onMenuStateChange: (isMenuOpen) {
              setState(() {
                _expanded = isMenuOpen;
              });
            },
            hint: Text('Select an option'),
          ),
        ),
      ),
    );
  }
}

enum Month {
  jan,
  feb,
  mar,
  apr,
  may,
  jun,
  jul,
  aug,
  sep,
  oct,
  nov,
  dec;

  String get monthName {
    switch (this) {
      case Month.jan:
        return 'Jan';
      case Month.feb:
        return 'Feb';
      case Month.mar:
        return 'Mar';
      case Month.apr:
        return 'Apr';
      case Month.may:
        return 'May';
      case Month.jun:
        return 'Jun';
      case Month.jul:
        return 'Jul';
      case Month.aug:
        return 'Aug';
      case Month.sep:
        return 'Sep';
      case Month.oct:
        return 'Oct';
      case Month.nov:
        return 'Nov';
      case Month.dec:
        return 'Dec';
    }
  }
}
