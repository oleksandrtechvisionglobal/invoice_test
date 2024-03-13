// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'invoice.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveInvoiceFormConsumer extends StatelessWidget {
  const ReactiveInvoiceFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, InvoiceForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceForm.of(context);

    if (formModel is! InvoiceForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class InvoiceFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const InvoiceFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final InvoiceForm form;
}

class ReactiveInvoiceForm extends StatelessWidget {
  const ReactiveInvoiceForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final InvoiceForm form;

  final WillPopCallback? onWillPop;

  static InvoiceForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<InvoiceFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        InvoiceFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as InvoiceFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return InvoiceFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

extension ReactiveReactiveInvoiceFormExt on BuildContext {
  InvoiceForm? invoiceFormWatch() => ReactiveInvoiceForm.of(this);

  InvoiceForm? invoiceFormRead() => ReactiveInvoiceForm.of(this, listen: false);
}

class InvoiceFormBuilder extends StatefulWidget {
  const InvoiceFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final Invoice? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, InvoiceForm formModel, Widget? child) builder;

  final void Function(BuildContext context, InvoiceForm formModel)? initState;

  @override
  _InvoiceFormBuilderState createState() => _InvoiceFormBuilderState();
}

class _InvoiceFormBuilderState extends State<InvoiceFormBuilder> {
  late InvoiceForm _formModel;

  @override
  void initState() {
    _formModel = InvoiceForm(InvoiceForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant InvoiceFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel.updateValue(widget.model);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveInvoiceForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class InvoiceForm implements FormModel<Invoice> {
  InvoiceForm(
    this.form,
    this.path,
  );

  static const String idControlName = "id";

  static const String billFromControlName = "billFrom";

  static const String billToControlName = "billTo";

  static const String invoiceDateControlName = "invoiceDate";

  static const String termsControlName = "terms";

  static const String projectDescriptionControlName = "projectDescription";

  static const String itemsControlName = "items";

  static const String statusControlName = "status";

  final FormGroup form;

  final String? path;

  String idControlPath() => pathBuilder(idControlName);

  String invoiceDateControlPath() => pathBuilder(invoiceDateControlName);

  String termsControlPath() => pathBuilder(termsControlName);

  String projectDescriptionControlPath() =>
      pathBuilder(projectDescriptionControlName);

  String statusControlPath() => pathBuilder(statusControlName);

  String billFromControlPath() => pathBuilder(billFromControlName);

  String billToControlPath() => pathBuilder(billToControlName);

  String itemsControlPath() => pathBuilder(itemsControlName);

  String get _idValue => idControl.value ?? "";

  DateTime? get _invoiceDateValue => invoiceDateControl?.value;

  String get _termsValue => termsControl.value ?? "";

  String get _projectDescriptionValue => projectDescriptionControl.value ?? "";

  String get _statusValue => statusControl.value ?? "";

  InvoiceBillFrom? get _billFromValue => billFromForm.model;

  InvoiceBillTo? get _billToValue => billToForm.model;

  List<InvoiceItem> get _itemsValue =>
      itemsInvoiceItemForm.map((e) => e.model).toList();

  bool get containsId {
    try {
      form.control(idControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsInvoiceDate {
    try {
      form.control(invoiceDateControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsTerms {
    try {
      form.control(termsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsProjectDescription {
    try {
      form.control(projectDescriptionControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsStatus {
    try {
      form.control(statusControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsBillFrom {
    try {
      form.control(billFromControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsBillTo {
    try {
      form.control(billToControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsItems {
    try {
      form.control(itemsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get idErrors => idControl.errors;

  Object? get invoiceDateErrors => invoiceDateControl?.errors;

  Object? get termsErrors => termsControl.errors;

  Object? get projectDescriptionErrors => projectDescriptionControl.errors;

  Object? get statusErrors => statusControl.errors;

  Object? get billFromErrors => billFromControl?.errors;

  Object? get billToErrors => billToControl?.errors;

  Object? get itemsErrors => itemsControl.errors;

  void get idFocus => form.focus(idControlPath());

  void get invoiceDateFocus => form.focus(invoiceDateControlPath());

  void get termsFocus => form.focus(termsControlPath());

  void get projectDescriptionFocus =>
      form.focus(projectDescriptionControlPath());

  void get statusFocus => form.focus(statusControlPath());

  void get billFromFocus => form.focus(billFromControlPath());

  void get billToFocus => form.focus(billToControlPath());

  void get itemsFocus => form.focus(itemsControlPath());

  void invoiceDateRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsInvoiceDate) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          invoiceDateControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            invoiceDateControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void billFromRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsBillFrom) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          billFromControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            billFromControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void billToRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsBillTo) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          billToControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            billToControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void idValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void invoiceDateValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    invoiceDateControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void termsValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    termsControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void projectDescriptionValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    projectDescriptionControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void statusValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    statusControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void billFromValueUpdate(
    InvoiceBillFrom? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    billFromControl?.updateValue(
        InvoiceBillFromForm.formElements(value).rawValue,
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void billToValueUpdate(
    InvoiceBillTo? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    billToControl?.updateValue(InvoiceBillToForm.formElements(value).rawValue,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void itemsValueUpdate(
    List<InvoiceItem> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final localValue = (value);
    if (localValue.isEmpty) {
      itemsClear(updateParent: updateParent, emitEvent: emitEvent);

      return;
    }

    final toUpdate = <InvoiceItem>[];
    final toAdd = <InvoiceItem>[];

    localValue.asMap().forEach((k, v) {
      final values = (itemsControl.controls).map((e) => e.value).toList();

      if (itemsInvoiceItemForm.asMap().containsKey(k) &&
          values.asMap().containsKey(k)) {
        toUpdate.add(v);
      } else {
        toAdd.add(v);
      }
    });

    if (toUpdate.isNotEmpty) {
      itemsControl.updateValue(
          toUpdate
              .map((e) => InvoiceItemForm.formElements(e).rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
    }

    if (toAdd.isNotEmpty) {
      toAdd.forEach((e) {
        itemsControl.add(InvoiceItemForm.formElements(e),
            updateParent: updateParent, emitEvent: emitEvent);
      });
    }
  }

  void itemsInsert(
    int i,
    InvoiceItem value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final values = (itemsControl.controls).map((e) => e.value).toList();
    if (values.length < i) {
      addItemsItem(value);
      return;
    }

    itemsControl.insert(
      i,
      InvoiceItemForm.formElements(value),
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void itemsClear({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    itemsInvoiceItemForm.clear();
    itemsControl.clear(updateParent: updateParent, emitEvent: emitEvent);
  }

  void idValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void invoiceDateValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    invoiceDateControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void termsValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    termsControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void projectDescriptionValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    projectDescriptionControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void statusValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    statusControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void billFromValuePatch(
    InvoiceBillFrom? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    billFromControl?.updateValue(
        InvoiceBillFromForm.formElements(value).rawValue,
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void billToValuePatch(
    InvoiceBillTo? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    billToControl?.updateValue(InvoiceBillToForm.formElements(value).rawValue,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void itemsValuePatch(
    List<InvoiceItem> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final keys = itemsInvoiceItemForm.asMap().keys;

    final toPatch = <InvoiceItem>[];
    (value).asMap().forEach(
      (k, v) {
        if (keys.contains(k)) {
          toPatch.add(v);
        }
      },
    );

    itemsControl.patchValue(
        toPatch.map((e) => InvoiceItemForm.formElements(e).rawValue).toList(),
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void idValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      idControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void invoiceDateValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      invoiceDateControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void termsValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      termsControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void projectDescriptionValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      projectDescriptionControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void statusValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      statusControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void billFromValueReset(
    InvoiceBillFrom? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      billFromControl?.reset(
          value: InvoiceBillFromForm.formElements(value).rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);

  void billToValueReset(
    InvoiceBillTo? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      billToControl?.reset(
          value: InvoiceBillToForm.formElements(value).rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);

  void itemsValueReset(
    List<InvoiceItem> value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      itemsControl.reset(
          value: value
              .map((e) => InvoiceItemForm.formElements(e).rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);

  FormControl<String> get idControl =>
      form.control(idControlPath()) as FormControl<String>;

  FormControl<DateTime>? get invoiceDateControl => containsInvoiceDate
      ? form.control(invoiceDateControlPath()) as FormControl<DateTime>?
      : null;

  FormControl<String> get termsControl =>
      form.control(termsControlPath()) as FormControl<String>;

  FormControl<String> get projectDescriptionControl =>
      form.control(projectDescriptionControlPath()) as FormControl<String>;

  FormControl<String> get statusControl =>
      form.control(statusControlPath()) as FormControl<String>;

  FormGroup? get billFromControl => containsBillFrom
      ? form.control(billFromControlPath()) as FormGroup?
      : null;

  FormGroup? get billToControl =>
      containsBillTo ? form.control(billToControlPath()) as FormGroup? : null;

  FormArray<Map<String, Object?>> get itemsControl =>
      form.control(itemsControlPath()) as FormArray<Map<String, Object?>>;

  InvoiceBillFromForm get billFromForm =>
      InvoiceBillFromForm(form, pathBuilder('billFrom'));

  InvoiceBillToForm get billToForm =>
      InvoiceBillToForm(form, pathBuilder('billTo'));

  List<InvoiceItemForm> get itemsInvoiceItemForm {
    final values = (itemsControl.controls).map((e) => e.value).toList();

    return values
        .asMap()
        .map((k, v) =>
            MapEntry(k, InvoiceItemForm(form, pathBuilder("items.$k"))))
        .values
        .toList();
  }

  void idSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      idControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      idControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void invoiceDateSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      invoiceDateControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      invoiceDateControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void termsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      termsControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      termsControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void projectDescriptionSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      projectDescriptionControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      projectDescriptionControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void statusSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      statusControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      statusControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void billFromSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      billFromControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      billFromControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void billToSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      billToControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      billToControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void itemsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      itemsControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      itemsControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  ExtendedControl<List<Map<String, Object?>?>, List<InvoiceItemForm>>
      get itemsExtendedControl =>
          ExtendedControl<List<Map<String, Object?>?>, List<InvoiceItemForm>>(
              form.control(itemsControlPath())
                  as FormArray<Map<String, Object?>>,
              () => itemsInvoiceItemForm);

  void addItemsItem(InvoiceItem value) {
    itemsControl.add(InvoiceItemForm.formElements(value));
  }

  void removeItemsItemAtIndex(int i) {
    if ((itemsControl.value ?? []).length > i) {
      itemsControl.removeAt(i);
    }
  }

  void addItemsItemList(List<InvoiceItem> value) {
    value.map((e) => addItemsItem(e));
  }

  @override
  Invoice get model {
    if (!currentForm.valid) {
      debugPrintStack(
          label:
              '[${path ?? 'InvoiceForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return Invoice(
        id: _idValue,
        billFrom: _billFromValue,
        billTo: _billToValue,
        invoiceDate: _invoiceDateValue,
        terms: _termsValue,
        projectDescription: _projectDescriptionValue,
        items: _itemsValue,
        status: _statusValue);
  }

  @override
  void submit({
    required void Function(Invoice model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  @override
  void updateValue(
    Invoice? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(InvoiceForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    Invoice? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(Invoice? invoice) => FormGroup({
        idControlName: FormControl<String>(
            value: invoice?.id,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        invoiceDateControlName: FormControl<DateTime>(
            value: invoice?.invoiceDate,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        termsControlName: FormControl<String>(
            value: invoice?.terms,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        projectDescriptionControlName: FormControl<String>(
            value: invoice?.projectDescription,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        itemsControlName: FormArray(
            (invoice?.items ?? [])
                .map((e) => InvoiceItemForm.formElements(e))
                .toList(),
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false),
        statusControlName: FormControl<String>(
            value: invoice?.status,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        billFromControlName:
            InvoiceBillFromForm.formElements(invoice?.billFrom),
        billToControlName: InvoiceBillToForm.formElements(invoice?.billTo)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class InvoiceBillFromForm implements FormModel<InvoiceBillFrom> {
  InvoiceBillFromForm(
    this.form,
    this.path,
  );

  static const String streetAddressControlName = "streetAddress";

  static const String cityControlName = "city";

  static const String postalCodeControlName = "postalCode";

  static const String countryControlName = "country";

  final FormGroup form;

  final String? path;

  String streetAddressControlPath() => pathBuilder(streetAddressControlName);

  String cityControlPath() => pathBuilder(cityControlName);

  String postalCodeControlPath() => pathBuilder(postalCodeControlName);

  String countryControlPath() => pathBuilder(countryControlName);

  String get _streetAddressValue => streetAddressControl.value ?? "";

  String get _cityValue => cityControl.value ?? "";

  String get _postalCodeValue => postalCodeControl.value ?? "";

  String get _countryValue => countryControl.value ?? "";

  bool get containsStreetAddress {
    try {
      form.control(streetAddressControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCity {
    try {
      form.control(cityControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPostalCode {
    try {
      form.control(postalCodeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCountry {
    try {
      form.control(countryControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get streetAddressErrors => streetAddressControl.errors;

  Object? get cityErrors => cityControl.errors;

  Object? get postalCodeErrors => postalCodeControl.errors;

  Object? get countryErrors => countryControl.errors;

  void get streetAddressFocus => form.focus(streetAddressControlPath());

  void get cityFocus => form.focus(cityControlPath());

  void get postalCodeFocus => form.focus(postalCodeControlPath());

  void get countryFocus => form.focus(countryControlPath());

  void streetAddressValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    streetAddressControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void cityValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    cityControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void postalCodeValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    postalCodeControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void countryValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    countryControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void streetAddressValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    streetAddressControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void cityValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    cityControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void postalCodeValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    postalCodeControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void countryValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    countryControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void streetAddressValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      streetAddressControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void cityValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      cityControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void postalCodeValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      postalCodeControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void countryValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      countryControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<String> get streetAddressControl =>
      form.control(streetAddressControlPath()) as FormControl<String>;

  FormControl<String> get cityControl =>
      form.control(cityControlPath()) as FormControl<String>;

  FormControl<String> get postalCodeControl =>
      form.control(postalCodeControlPath()) as FormControl<String>;

  FormControl<String> get countryControl =>
      form.control(countryControlPath()) as FormControl<String>;

  void streetAddressSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      streetAddressControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      streetAddressControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void citySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      cityControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      cityControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void postalCodeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      postalCodeControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      postalCodeControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void countrySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      countryControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      countryControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  InvoiceBillFrom get model {
    if (!currentForm.valid) {
      debugPrintStack(
          label:
              '[${path ?? 'InvoiceBillFromForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return InvoiceBillFrom(
        streetAddress: _streetAddressValue,
        city: _cityValue,
        postalCode: _postalCodeValue,
        country: _countryValue);
  }

  @override
  void submit({
    required void Function(InvoiceBillFrom model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  @override
  void updateValue(
    InvoiceBillFrom? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(InvoiceBillFromForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    InvoiceBillFrom? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(InvoiceBillFrom? invoiceBillFrom) => FormGroup({
        streetAddressControlName: FormControl<String>(
            value: invoiceBillFrom?.streetAddress,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        cityControlName: FormControl<String>(
            value: invoiceBillFrom?.city,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        postalCodeControlName: FormControl<String>(
            value: invoiceBillFrom?.postalCode,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        countryControlName: FormControl<String>(
            value: invoiceBillFrom?.country,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class InvoiceBillToForm implements FormModel<InvoiceBillTo> {
  InvoiceBillToForm(
    this.form,
    this.path,
  );

  static const String clientNameControlName = "clientName";

  static const String clientEmailControlName = "clientEmail";

  static const String streetAddressControlName = "streetAddress";

  static const String cityControlName = "city";

  static const String postalCodeControlName = "postalCode";

  static const String countryControlName = "country";

  final FormGroup form;

  final String? path;

  String clientNameControlPath() => pathBuilder(clientNameControlName);

  String clientEmailControlPath() => pathBuilder(clientEmailControlName);

  String streetAddressControlPath() => pathBuilder(streetAddressControlName);

  String cityControlPath() => pathBuilder(cityControlName);

  String postalCodeControlPath() => pathBuilder(postalCodeControlName);

  String countryControlPath() => pathBuilder(countryControlName);

  String get _clientNameValue => clientNameControl.value ?? "";

  String get _clientEmailValue => clientEmailControl.value ?? "";

  String get _streetAddressValue => streetAddressControl.value ?? "";

  String get _cityValue => cityControl.value ?? "";

  String get _postalCodeValue => postalCodeControl.value ?? "";

  String get _countryValue => countryControl.value ?? "";

  bool get containsClientName {
    try {
      form.control(clientNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsClientEmail {
    try {
      form.control(clientEmailControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsStreetAddress {
    try {
      form.control(streetAddressControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCity {
    try {
      form.control(cityControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPostalCode {
    try {
      form.control(postalCodeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCountry {
    try {
      form.control(countryControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get clientNameErrors => clientNameControl.errors;

  Object? get clientEmailErrors => clientEmailControl.errors;

  Object? get streetAddressErrors => streetAddressControl.errors;

  Object? get cityErrors => cityControl.errors;

  Object? get postalCodeErrors => postalCodeControl.errors;

  Object? get countryErrors => countryControl.errors;

  void get clientNameFocus => form.focus(clientNameControlPath());

  void get clientEmailFocus => form.focus(clientEmailControlPath());

  void get streetAddressFocus => form.focus(streetAddressControlPath());

  void get cityFocus => form.focus(cityControlPath());

  void get postalCodeFocus => form.focus(postalCodeControlPath());

  void get countryFocus => form.focus(countryControlPath());

  void clientNameValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    clientNameControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void clientEmailValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    clientEmailControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void streetAddressValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    streetAddressControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void cityValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    cityControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void postalCodeValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    postalCodeControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void countryValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    countryControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void clientNameValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    clientNameControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void clientEmailValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    clientEmailControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void streetAddressValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    streetAddressControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void cityValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    cityControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void postalCodeValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    postalCodeControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void countryValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    countryControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void clientNameValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      clientNameControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void clientEmailValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      clientEmailControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void streetAddressValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      streetAddressControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void cityValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      cityControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void postalCodeValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      postalCodeControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void countryValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      countryControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<String> get clientNameControl =>
      form.control(clientNameControlPath()) as FormControl<String>;

  FormControl<String> get clientEmailControl =>
      form.control(clientEmailControlPath()) as FormControl<String>;

  FormControl<String> get streetAddressControl =>
      form.control(streetAddressControlPath()) as FormControl<String>;

  FormControl<String> get cityControl =>
      form.control(cityControlPath()) as FormControl<String>;

  FormControl<String> get postalCodeControl =>
      form.control(postalCodeControlPath()) as FormControl<String>;

  FormControl<String> get countryControl =>
      form.control(countryControlPath()) as FormControl<String>;

  void clientNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      clientNameControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      clientNameControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void clientEmailSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      clientEmailControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      clientEmailControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void streetAddressSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      streetAddressControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      streetAddressControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void citySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      cityControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      cityControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void postalCodeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      postalCodeControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      postalCodeControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void countrySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      countryControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      countryControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  InvoiceBillTo get model {
    if (!currentForm.valid) {
      debugPrintStack(
          label:
              '[${path ?? 'InvoiceBillToForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return InvoiceBillTo(
        clientName: _clientNameValue,
        clientEmail: _clientEmailValue,
        streetAddress: _streetAddressValue,
        city: _cityValue,
        postalCode: _postalCodeValue,
        country: _countryValue);
  }

  @override
  void submit({
    required void Function(InvoiceBillTo model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  @override
  void updateValue(
    InvoiceBillTo? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(InvoiceBillToForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    InvoiceBillTo? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(InvoiceBillTo? invoiceBillTo) => FormGroup({
        clientNameControlName: FormControl<String>(
            value: invoiceBillTo?.clientName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        clientEmailControlName: FormControl<String>(
            value: invoiceBillTo?.clientEmail,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        streetAddressControlName: FormControl<String>(
            value: invoiceBillTo?.streetAddress,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        cityControlName: FormControl<String>(
            value: invoiceBillTo?.city,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        postalCodeControlName: FormControl<String>(
            value: invoiceBillTo?.postalCode,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        countryControlName: FormControl<String>(
            value: invoiceBillTo?.country,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class InvoiceItemForm implements FormModel<InvoiceItem> {
  InvoiceItemForm(
    this.form,
    this.path,
  );

  static const String itemNameControlName = "itemName";

  static const String quantityControlName = "quantity";

  static const String priceControlName = "price";

  final FormGroup form;

  final String? path;

  String itemNameControlPath() => pathBuilder(itemNameControlName);

  String quantityControlPath() => pathBuilder(quantityControlName);

  String priceControlPath() => pathBuilder(priceControlName);

  String? get _itemNameValue => itemNameControl?.value;

  int? get _quantityValue => quantityControl?.value;

  double? get _priceValue => priceControl?.value;

  bool get containsItemName {
    try {
      form.control(itemNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsQuantity {
    try {
      form.control(quantityControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPrice {
    try {
      form.control(priceControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get itemNameErrors => itemNameControl?.errors;

  Object? get quantityErrors => quantityControl?.errors;

  Object? get priceErrors => priceControl?.errors;

  void get itemNameFocus => form.focus(itemNameControlPath());

  void get quantityFocus => form.focus(quantityControlPath());

  void get priceFocus => form.focus(priceControlPath());

  void itemNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsItemName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          itemNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            itemNameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void quantityRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsQuantity) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          quantityControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            quantityControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void priceRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPrice) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          priceControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            priceControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void itemNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    itemNameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void quantityValueUpdate(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    quantityControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void priceValueUpdate(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    priceControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void itemNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    itemNameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void quantityValuePatch(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    quantityControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void priceValuePatch(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    priceControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void itemNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      itemNameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void quantityValueReset(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      quantityControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void priceValueReset(
    double? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      priceControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<String>? get itemNameControl => containsItemName
      ? form.control(itemNameControlPath()) as FormControl<String>?
      : null;

  FormControl<int>? get quantityControl => containsQuantity
      ? form.control(quantityControlPath()) as FormControl<int>?
      : null;

  FormControl<double>? get priceControl => containsPrice
      ? form.control(priceControlPath()) as FormControl<double>?
      : null;

  void itemNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      itemNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      itemNameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void quantitySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      quantityControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      quantityControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void priceSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      priceControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      priceControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  InvoiceItem get model {
    if (!currentForm.valid) {
      debugPrintStack(
          label:
              '[${path ?? 'InvoiceItemForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return InvoiceItem(
        itemName: _itemNameValue, quantity: _quantityValue, price: _priceValue);
  }

  @override
  void submit({
    required void Function(InvoiceItem model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  @override
  void updateValue(
    InvoiceItem? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(InvoiceItemForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    InvoiceItem? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(InvoiceItem? invoiceItem) => FormGroup({
        itemNameControlName: FormControl<String>(
            value: invoiceItem?.itemName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        quantityControlName: FormControl<int>(
            value: invoiceItem?.quantity,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        priceControlName: FormControl<double>(
            value: invoiceItem?.price,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveInvoiceFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveInvoiceFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(InvoiceForm formModel)? control;

  final Widget Function(
          BuildContext context, List<Widget> itemList, InvoiceForm formModel)?
      builder;

  final Widget Function(
      BuildContext context, int i, T? item, InvoiceForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final values = formArray.controls.map((e) => e.value).toList();
        final itemList = values
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveInvoiceFormFormGroupArrayBuilder<T> extends StatelessWidget {
  const ReactiveInvoiceFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<T>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<T>> Function(
      InvoiceForm formModel)? getExtended;

  final Widget Function(
          BuildContext context, List<Widget> itemList, InvoiceForm formModel)?
      builder;

  final Widget Function(
      BuildContext context, int i, T? item, InvoiceForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <T>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveInvoiceBillFromFormConsumer extends StatelessWidget {
  const ReactiveInvoiceBillFromFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, InvoiceBillFromForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceBillFromForm.of(context);

    if (formModel is! InvoiceBillFromForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class InvoiceBillFromFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const InvoiceBillFromFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final InvoiceBillFromForm form;
}

class ReactiveInvoiceBillFromForm extends StatelessWidget {
  const ReactiveInvoiceBillFromForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final InvoiceBillFromForm form;

  final WillPopCallback? onWillPop;

  static InvoiceBillFromForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              InvoiceBillFromFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        InvoiceBillFromFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as InvoiceBillFromFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return InvoiceBillFromFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

extension ReactiveReactiveInvoiceBillFromFormExt on BuildContext {
  InvoiceBillFromForm? invoiceBillFromFormWatch() =>
      ReactiveInvoiceBillFromForm.of(this);

  InvoiceBillFromForm? invoiceBillFromFormRead() =>
      ReactiveInvoiceBillFromForm.of(this, listen: false);
}

class InvoiceBillFromFormBuilder extends StatefulWidget {
  const InvoiceBillFromFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final InvoiceBillFrom? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
          BuildContext context, InvoiceBillFromForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, InvoiceBillFromForm formModel)?
      initState;

  @override
  _InvoiceBillFromFormBuilderState createState() =>
      _InvoiceBillFromFormBuilderState();
}

class _InvoiceBillFromFormBuilderState
    extends State<InvoiceBillFromFormBuilder> {
  late InvoiceBillFromForm _formModel;

  @override
  void initState() {
    _formModel = InvoiceBillFromForm(
        InvoiceBillFromForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant InvoiceBillFromFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel.updateValue(widget.model);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveInvoiceBillFromForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class ReactiveInvoiceBillFromFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveInvoiceBillFromFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(InvoiceBillFromForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      InvoiceBillFromForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, InvoiceBillFromForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceBillFromForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final values = formArray.controls.map((e) => e.value).toList();
        final itemList = values
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveInvoiceBillFromFormFormGroupArrayBuilder<T>
    extends StatelessWidget {
  const ReactiveInvoiceBillFromFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<T>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<T>> Function(
      InvoiceBillFromForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      InvoiceBillFromForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, InvoiceBillFromForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceBillFromForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <T>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveInvoiceBillToFormConsumer extends StatelessWidget {
  const ReactiveInvoiceBillToFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, InvoiceBillToForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceBillToForm.of(context);

    if (formModel is! InvoiceBillToForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class InvoiceBillToFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const InvoiceBillToFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final InvoiceBillToForm form;
}

class ReactiveInvoiceBillToForm extends StatelessWidget {
  const ReactiveInvoiceBillToForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final InvoiceBillToForm form;

  final WillPopCallback? onWillPop;

  static InvoiceBillToForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              InvoiceBillToFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        InvoiceBillToFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as InvoiceBillToFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return InvoiceBillToFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

extension ReactiveReactiveInvoiceBillToFormExt on BuildContext {
  InvoiceBillToForm? invoiceBillToFormWatch() =>
      ReactiveInvoiceBillToForm.of(this);

  InvoiceBillToForm? invoiceBillToFormRead() =>
      ReactiveInvoiceBillToForm.of(this, listen: false);
}

class InvoiceBillToFormBuilder extends StatefulWidget {
  const InvoiceBillToFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final InvoiceBillTo? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, InvoiceBillToForm formModel, Widget? child) builder;

  final void Function(BuildContext context, InvoiceBillToForm formModel)?
      initState;

  @override
  _InvoiceBillToFormBuilderState createState() =>
      _InvoiceBillToFormBuilderState();
}

class _InvoiceBillToFormBuilderState extends State<InvoiceBillToFormBuilder> {
  late InvoiceBillToForm _formModel;

  @override
  void initState() {
    _formModel =
        InvoiceBillToForm(InvoiceBillToForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant InvoiceBillToFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel.updateValue(widget.model);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveInvoiceBillToForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class ReactiveInvoiceBillToFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveInvoiceBillToFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(InvoiceBillToForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      InvoiceBillToForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, InvoiceBillToForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceBillToForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final values = formArray.controls.map((e) => e.value).toList();
        final itemList = values
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveInvoiceBillToFormFormGroupArrayBuilder<T>
    extends StatelessWidget {
  const ReactiveInvoiceBillToFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<T>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<T>> Function(
      InvoiceBillToForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      InvoiceBillToForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, InvoiceBillToForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceBillToForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <T>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveInvoiceItemFormConsumer extends StatelessWidget {
  const ReactiveInvoiceItemFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, InvoiceItemForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceItemForm.of(context);

    if (formModel is! InvoiceItemForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class InvoiceItemFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const InvoiceItemFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final InvoiceItemForm form;
}

class ReactiveInvoiceItemForm extends StatelessWidget {
  const ReactiveInvoiceItemForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final InvoiceItemForm form;

  final WillPopCallback? onWillPop;

  static InvoiceItemForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              InvoiceItemFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        InvoiceItemFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as InvoiceItemFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return InvoiceItemFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

extension ReactiveReactiveInvoiceItemFormExt on BuildContext {
  InvoiceItemForm? invoiceItemFormWatch() => ReactiveInvoiceItemForm.of(this);

  InvoiceItemForm? invoiceItemFormRead() =>
      ReactiveInvoiceItemForm.of(this, listen: false);
}

class InvoiceItemFormBuilder extends StatefulWidget {
  const InvoiceItemFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final InvoiceItem? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, InvoiceItemForm formModel, Widget? child) builder;

  final void Function(BuildContext context, InvoiceItemForm formModel)?
      initState;

  @override
  _InvoiceItemFormBuilderState createState() => _InvoiceItemFormBuilderState();
}

class _InvoiceItemFormBuilderState extends State<InvoiceItemFormBuilder> {
  late InvoiceItemForm _formModel;

  @override
  void initState() {
    _formModel =
        InvoiceItemForm(InvoiceItemForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant InvoiceItemFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel.updateValue(widget.model);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveInvoiceItemForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class ReactiveInvoiceItemFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveInvoiceItemFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(InvoiceItemForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      InvoiceItemForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, InvoiceItemForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceItemForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final values = formArray.controls.map((e) => e.value).toList();
        final itemList = values
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveInvoiceItemFormFormGroupArrayBuilder<T> extends StatelessWidget {
  const ReactiveInvoiceItemFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<T>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<T>> Function(
      InvoiceItemForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      InvoiceItemForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, InvoiceItemForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveInvoiceItemForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <T>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
