import 'package:flutter/material.dart';
import 'package:ui_components/theme/app_theme_colors.dart';
import 'package:ui_components/tokens/app_paddings.dart';

import '../gen/assets.gen.dart';
import '../tokens/app_typography.dart';
import 'app_date_picker.dart';

class Calendar extends StatefulWidget {
  final Function(DateTime)? onChanged;
  final DateTime initialDate;

  const Calendar({super.key, required this.initialDate, this.onChanged});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String title = '';
  DateTime _selectedMonth = DateTime.now();

  @override
  void initState() {
    _selectedMonth = widget.initialDate;
    title = getTitle(_selectedMonth);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem(
      enabled: false,
      child: Container(
        color: context.colors.inputBackground,
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SizedBox(
            width: 240,
            child: Padding(
                padding: AppPaddings.input,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 26, bottom: 32),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              updateMonth(false);
                              setState(() {
                                title = getTitle(_selectedMonth);
                              });
                            },
                            child: Assets.icons.arrowLeft.svg(
                              package: 'ui_components',
                            ),
                          ),
                          Expanded(
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: AppTypography.headingSVariant(
                                  context.colors.textPrimary),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              updateMonth(true);
                              setState(() {
                                title = getTitle(_selectedMonth);
                              });
                            },
                            child: Assets.icons.arrowRight.svg(
                              package: 'ui_components',
                            ),
                          ),
                        ],
                      ),
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      children: List.generate(
                          getLengthOfMonth(
                              _selectedMonth.month, _selectedMonth.year),
                          (index) {
                        final day = index -
                            getFirstDayOfMonth(
                                _selectedMonth.month, _selectedMonth.year) +
                            1;
                        if (index <
                            getFirstDayOfMonth(
                                _selectedMonth.month, _selectedMonth.year)) {
                          return Text(
                            (getLastDayOfMonth(_selectedMonth.month,
                                        _selectedMonth.year) +
                                    day)
                                .toString(),
                            textAlign: TextAlign.center,
                            style: AppTypography.headingSVariant(context
                                .colors.calendarTextColor
                                .withOpacity(0.0814)),
                          );
                        }
                        if (day >
                            getLastDayOfMonth(
                                _selectedMonth.month, _selectedMonth.year)) {
                          return Text(
                            (day -
                                    getLastDayOfMonth(_selectedMonth.month,
                                        _selectedMonth.year))
                                .toString(),
                            textAlign: TextAlign.center,
                            style: AppTypography.headingSVariant(context
                                .colors.calendarTextColor
                                .withOpacity(0.0814)),
                          );
                        }
                        return InkWell(
                          onTap: () {
                            widget.onChanged?.call(DateTime(_selectedMonth.year,
                                _selectedMonth.month, day));
                          },
                          child: Text(
                            day.toString(),
                            textAlign: TextAlign.center,
                            style: AppTypography.headingSVariant(
                                isSelectedDay(_selectedMonth, day)
                                    ? context.colors.buttonPrimary
                                    : context.colors.calendarTextColor),
                          ),
                        );
                      }),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  String getTitle(DateTime date) {
    return '${Month.values[date.month - 1].monthName} ${date.year}';
  }

  int getLastDayOfMonth(int month, int year) {
    return DateTime(year, month + 1, 0).day;
  }

  bool isSelectedDay(DateTime date, int day) {
    return widget.initialDate.month == date.month &&
        widget.initialDate.year == date.year &&
        widget.initialDate.day == day;
  }

  int getLengthOfMonth(int month, int year) {
    return getDaysInMonth(month, year) +
        getFirstDayOfMonth(month, year) +
        (7 - getLastWeekday(month, year));
  }

  int getDaysInMonth(int month, int year) {
    return DateTime(year, month + 1, 0).day;
  }

  int getFirstDayOfMonth(int month, int year) {
    return DateTime(year, month, 1).weekday == 7
        ? 0
        : DateTime(year, month, 1).weekday;
  }

  int getLastWeekday(int month, int year) {
    if (DateTime(year, month, getDaysInMonth(month, year)).weekday == 7) {
      return 1;
    }
    return DateTime(year, month, getDaysInMonth(month, year)).weekday + 1;
  }

  bool isToday(DateTime date, int day) {
    final now = DateTime.now();
    return now.month == date.month && now.year == date.year && now.day == day;
  }

  void updateMonth(bool isNext) {
    if (isNext) {
      if (_selectedMonth.month == 12) {
        _selectedMonth = DateTime(_selectedMonth.year + 1, 1);
      } else {
        _selectedMonth =
            DateTime(_selectedMonth.year, _selectedMonth.month + 1);
      }
    } else {
      if (_selectedMonth.month == 1) {
        _selectedMonth = DateTime(_selectedMonth.year - 1, 12);
      } else {
        _selectedMonth =
            DateTime(_selectedMonth.year, _selectedMonth.month - 1);
      }
    }
  }
}
