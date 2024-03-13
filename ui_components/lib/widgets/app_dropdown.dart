import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/gen/assets.gen.dart';
import 'package:ui_components/theme/app_theme_colors.dart';
import 'package:ui_components/tokens/app_paddings.dart';
import 'package:ui_components/tokens/app_typography.dart';

class AppDropdown extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final String initialValue;
  final ValueChanged<String>? onChanged;

  const AppDropdown({
    Key? key,
    required this.items,
    required this.hintText,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  String? _selectedItem;
  bool _expanded = false;

  @override
  void initState() {
    _selectedItem = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
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
                  Assets.icons.arrowDown.svg(package: 'ui_components'),
                ],
              ),
            ),
          ],
        ),
        items: _buildItems(context, _selectedItem),
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
          customHeights: _customItemHeights(context),
        ),
        onChanged: (value) {
          widget.onChanged?.call(value as String);
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
    );
  }

  List<DropdownMenuItem> _buildItems(
      BuildContext context, String? selectedItem) {
    List<DropdownMenuItem> items = [];
    for (var i = 0; i < widget.items.length; i++) {
      if (widget.items.length != i && i != 0) {
        items.add(
          DropdownMenuItem<Divider>(
            enabled: false,
            child: Divider(
              color: context.colors.dropdownDivider,
              height: 1,
              thickness: 1,
            ),
          ),
        );
      }
      items.add(
        DropdownMenuItem(
          value: widget.items[i],
          child: Padding(
            padding: AppPaddings.input,
            child: Text(
              widget.items[i],
              style: AppTypography.headingSVariant(
                  selectedItem == widget.items[i]
                      ? context.colors.dropdownItemSelected
                      : context.colors.dropdownItem),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<double> _customItemHeights(BuildContext context) {
    List<double> items = [];
    for (var i = 0; i < widget.items.length; i++) {
      if (widget.items.length != i && i != 0) {
        items.add(1);
      }
      items.add(48);
    }
    return items;
  }
}
