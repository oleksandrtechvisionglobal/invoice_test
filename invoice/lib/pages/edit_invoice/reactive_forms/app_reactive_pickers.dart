import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ui_components/widgets/app_date_picker.dart';
import 'package:ui_components/widgets/app_dropdown.dart';
import 'package:ui_components/widgets/app_text_field.dart';

class AppReactiveTextField<T> extends ReactiveFormField<T, String> {
  final TextEditingController? _textController;
  final String hintText;
  final bool? isDouble;

  AppReactiveTextField({
    super.key,
    TextEditingController? controller,
    required this.hintText,
    this.isDouble,
    ReactiveFormFieldCallback<T>? onChanged,
    super.formControl,
    super.formControlName,
    super.valueAccessor,
  })  : _textController = controller,
        super(builder: (ReactiveFormFieldState<T, String> field) {
          final state = field as _AppReactiveTextFieldState<T>;
          List<TextInputFormatter>? textFormat;
          if (isDouble == true) {
            textFormat = [
              FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
            ];
          } else if (isDouble == false) {
            textFormat = [FilteringTextInputFormatter.digitsOnly];
          }
          return AppTextField(
            controller: state._textController,
            onChanged: (value) {
              field.didChange(value);
              onChanged?.call(field.control);
            },
            inputType: textFormat,
            hintText: hintText,
          );
        });

  @override
  ReactiveFormFieldState<T, String> createState() =>
      _AppReactiveTextFieldState<T>();
}

class _AppReactiveTextFieldState<T>
    extends ReactiveFocusableFormFieldState<T, String> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _initializeTextController();
  }

  @override
  void onControlValueChanged(dynamic value) {
    final effectiveValue = (value == null) ? '' : value.toString();
    _textController.value = _textController.value.copyWith(
      text: effectiveValue,
      selection: TextSelection.collapsed(offset: effectiveValue.length),
      composing: TextRange.empty,
    );

    super.onControlValueChanged(value);
  }

  @override
  ControlValueAccessor<T, String> selectValueAccessor() {
    if (control is FormControl<int>) {
      return IntValueAccessor() as ControlValueAccessor<T, String>;
    } else if (control is FormControl<double>) {
      return DoubleValueAccessor() as ControlValueAccessor<T, String>;
    }

    return super.selectValueAccessor();
  }

  void _initializeTextController() {
    final initialValue = value;
    final currentWidget = widget as AppReactiveTextField<T>;
    _textController = (currentWidget._textController != null)
        ? currentWidget._textController!
        : TextEditingController();
    _textController.text = initialValue == null ? '' : initialValue.toString();
  }
}

class AppReactiveDatePicker extends ReactiveFormField<DateTime, DateTime> {
  final String hintText;

  AppReactiveDatePicker({
    super.key,
    TextEditingController? controller,
    required this.hintText,
    ReactiveFormFieldCallback<DateTime>? onChanged,
    super.formControl,
    super.formControlName,
    super.valueAccessor,
  }) : super(builder: (ReactiveFormFieldState<DateTime, DateTime> field) {
          return AppDatePicker(
            hintText: hintText,
            onChanged: (value) {
              field.didChange(value);
              onChanged?.call(field.control);
            },
            initialDate: field.value,
          );
        });
}

class AppReactiveStringPicker extends ReactiveFormField<String, String> {
  final String hintText;
  final List<String> items;

  AppReactiveStringPicker({
    super.key,
    TextEditingController? controller,
    required this.hintText,
    required this.items,
    ReactiveFormFieldCallback<String>? onChanged,
    super.formControl,
    super.formControlName,
    super.valueAccessor,
  }) : super(builder: (ReactiveFormFieldState<String, String> field) {
          return AppDropdown(
            hintText: hintText,
            onChanged: (value) {
              field.didChange(value);
              onChanged?.call(field.control);
            },
            items: items,
            initialValue: field.value ?? items.first,
          );
        });
}
