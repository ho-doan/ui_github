part of 'ui.dart';

typedef ButtonBuild<T> = Widget Function(T);
typedef ButtonCallback<T> = void Function(T);
typedef ButtonListCallback<T> = void Function(Set<T>);

class ButtonWidget<T> extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.text = '',
    this.callback,
    this.backgroundColor = Colors.deepPurple,
    this.borderColor = Colors.white,
    this.disableColor = Colors.grey,
    this.style = const TextStyle(),
    this.icon,
    this.radius = 8,
    this.borderSize = 1,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.enable = true,
    this.child,
    this.selected,
    this.lstSelected = const {},
    this.values = const [],
    this.iconSeg,
    this.textSeg,
    this.callbackLstSeg,
    this.callbackSeg,
  });
  final String text;
  final VoidCallback? callback;
  final ButtonCallback<T>? callbackSeg;
  final ButtonListCallback<T>? callbackLstSeg;
  final Color backgroundColor;
  final Color borderColor;
  final Color disableColor;
  final TextStyle style;
  final Widget? icon;
  final double radius;
  final double borderSize;
  final EdgeInsetsGeometry padding;
  final Widget? child;
  final bool enable;
  final T? selected;
  final Set<T>? lstSelected;
  final List<T> values;
  final ButtonBuild<T>? textSeg;
  final ButtonBuild<T>? iconSeg;

  factory ButtonWidget.elevated({
    Key? key,
    String text = '',
    bool enable = true,
    required VoidCallback callback,
    Color backgroundColor = Colors.deepPurple,
    Color borderColor = Colors.white,
    Color disableColor = Colors.grey,
    TextStyle style = const TextStyle(),
    Widget? icon,
    Widget? child,
    double radius = 8,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    ),
  }) =>
      _ElevatedBtn(
        key: key,
        backgroundColor: backgroundColor,
        callback: callback,
        disableColor: disableColor,
        radius: radius,
        style: style,
        text: text,
        icon: icon,
        padding: padding,
        enable: enable,
        child: child,
      );
  factory ButtonWidget.filled({
    Key? key,
    String text = '',
    bool enable = true,
    required VoidCallback callback,
    Color backgroundColor = Colors.deepPurple,
    Color disableColor = Colors.grey,
    TextStyle style = const TextStyle(),
    Widget? icon,
    Widget? child,
    double radius = 8,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    ),
  }) =>
      _FilledBtn(
        key: key,
        callback: callback,
        radius: radius,
        style: style,
        text: text,
        icon: icon,
        padding: padding,
        enable: enable,
        backgroundColor: backgroundColor,
        disableColor: disableColor,
        child: child,
      );
  factory ButtonWidget.filledTonal({
    Key? key,
    String text = '',
    bool enable = true,
    required VoidCallback callback,
    Color backgroundColor = Colors.deepPurple,
    Color disableColor = Colors.grey,
    TextStyle style = const TextStyle(),
    Widget? icon,
    Widget? child,
    double radius = 8,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    ),
  }) =>
      _FilledTonalBtn(
        key: key,
        callback: callback,
        radius: radius,
        style: style,
        text: text,
        icon: icon,
        padding: padding,
        enable: enable,
        backgroundColor: backgroundColor,
        disableColor: disableColor,
        child: child,
      );
  factory ButtonWidget.text({
    Key? key,
    String text = '',
    bool enable = true,
    required VoidCallback callback,
    Color backgroundColor = Colors.deepPurple,
    Color disableColor = Colors.grey,
    TextStyle style = const TextStyle(),
    Widget? icon,
    Widget? child,
    double radius = 8,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    ),
  }) =>
      _TextBtn(
        key: key,
        callback: callback,
        radius: radius,
        style: style,
        text: text,
        icon: icon,
        padding: padding,
        enable: enable,
        backgroundColor: backgroundColor,
        disableColor: disableColor,
        child: child,
      );
  factory ButtonWidget.icon({
    Key? key,
    bool enable = true,
    required VoidCallback callback,
    Color backgroundColor = Colors.deepPurple,
    Color disableColor = Colors.grey,
    Widget? icon,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
  }) =>
      _IconBtn(
        key: key,
        callback: callback,
        icon: icon,
        padding: padding,
        enable: enable,
        backgroundColor: backgroundColor,
        disableColor: disableColor,
      );
  factory ButtonWidget.iconOutlined({
    Key? key,
    bool enable = true,
    required VoidCallback callback,
    Color disableColor = Colors.grey,
    Color borderColor = Colors.white,
    Widget? icon,
    double borderSize = 1,
    double radius = 8,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
  }) =>
      _IconOutlinedBtn(
        key: key,
        callback: callback,
        icon: icon,
        padding: padding,
        enable: enable,
        disableColor: disableColor,
        borderColor: borderColor,
        borderSize: borderSize,
        radius: radius,
      );
  factory ButtonWidget.iconFilled({
    Key? key,
    bool enable = true,
    required VoidCallback callback,
    Color backgroundColor = Colors.deepPurple,
    Color disableColor = Colors.grey,
    Widget? icon,
    double radius = 8,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
  }) =>
      _IconFilledBtn(
        key: key,
        callback: callback,
        icon: icon,
        padding: padding,
        enable: enable,
        disableColor: disableColor,
        radius: radius,
        backgroundColor: backgroundColor,
      );
  factory ButtonWidget.iconFilledTonal({
    Key? key,
    bool enable = true,
    required VoidCallback callback,
    Color backgroundColor = Colors.deepPurple,
    Color disableColor = Colors.grey,
    Widget? icon,
    double radius = 8,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
  }) =>
      _IconFillerTonalBtn(
        key: key,
        callback: callback,
        icon: icon,
        padding: padding,
        enable: enable,
        disableColor: disableColor,
        radius: radius,
        backgroundColor: backgroundColor,
      );
  factory ButtonWidget.outlined({
    Key? key,
    String text = '',
    bool enable = true,
    required VoidCallback callback,
    Color borderColor = Colors.white,
    TextStyle style = const TextStyle(),
    Widget? icon,
    Widget? child,
    double radius = 8,
    double borderSize = 1,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    ),
  }) =>
      _OutlineBtn(
        key: key,
        callback: callback,
        radius: radius,
        style: style,
        text: text,
        icon: icon,
        padding: padding,
        enable: enable,
        borderColor: borderColor,
        borderSize: borderSize,
        child: child,
      );
  factory ButtonWidget.segmented({
    Key? key,
    bool enable = true,
    required ButtonCallback<T> callback,
    Color backgroundColor = Colors.blueGrey,
    double radius = 8,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    ),
    T? selected,
    required List<T> values,
    ButtonBuild<T>? iconSeg,
    ButtonBuild<T>? textSeg,
  }) =>
      _SegmentedSingleBtn(
        key: key,
        callbackSeg: callback,
        radius: radius,
        padding: padding,
        enable: enable,
        backgroundColor: backgroundColor,
        selected: selected,
        values: values,
        iconSeg: iconSeg,
        textSeg: textSeg,
      );
  factory ButtonWidget.segmentedMulti({
    Key? key,
    bool enable = true,
    required ButtonListCallback<T> callback,
    Color backgroundColor = Colors.blueGrey,
    double radius = 8,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    ),
    Set<T>? selected,
    required List<T> values,
    ButtonBuild<T>? iconSeg,
    ButtonBuild<T>? textSeg,
  }) =>
      _SegmentedMultiBtn(
        key: key,
        callbackLstSeg: callback,
        radius: radius,
        padding: padding,
        enable: enable,
        backgroundColor: backgroundColor,
        lstSelected: selected,
        values: values,
        iconSeg: iconSeg,
        textSeg: textSeg,
      );

  @override
  Widget build(BuildContext context) {
    return _ElevatedBtn(
      backgroundColor: backgroundColor,
      callback: callback,
      disableColor: disableColor,
      radius: radius,
      style: style,
      text: text,
      icon: icon,
    );
  }
}

class _ElevatedBtn<T> extends ButtonWidget<T> {
  const _ElevatedBtn({
    super.key,
    required super.text,
    required super.callback,
    required super.backgroundColor,
    required super.disableColor,
    required super.style,
    super.icon,
    required super.radius,
    super.padding,
    super.enable,
    super.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enable ? callback : null,
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disableColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [if (icon != null) icon!, child ?? Text(text, style: style)],
      ),
    );
  }
}

class _OutlineBtn<T> extends ButtonWidget<T> {
  const _OutlineBtn({
    super.key,
    super.radius,
    super.icon,
    super.borderColor,
    super.borderSize,
    required super.callback,
    super.child,
    super.text,
    super.style,
    super.padding,
    super.enable,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: enable ? callback : null,
      style: OutlinedButton.styleFrom(
        padding: padding,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: borderSize, color: borderColor),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [if (icon != null) icon!, child ?? Text(text, style: style)],
      ),
    );
  }
}

class _FilledBtn<T> extends ButtonWidget<T> {
  const _FilledBtn({
    super.key,
    required super.callback,
    super.padding,
    super.backgroundColor,
    super.enable,
    super.icon,
    super.text,
    super.style,
    super.disableColor,
    super.radius,
    super.child,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: enable ? callback : null,
      style: FilledButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disableColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [if (icon != null) icon!, child ?? Text(text, style: style)],
      ),
    );
  }
}

class _FilledTonalBtn<T> extends ButtonWidget<T> {
  const _FilledTonalBtn({
    super.key,
    required super.callback,
    super.padding,
    super.backgroundColor,
    super.enable,
    super.icon,
    super.text,
    super.style,
    super.disableColor,
    super.radius,
    super.child,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: enable ? callback : null,
      style: FilledButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disableColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [if (icon != null) icon!, child ?? Text(text, style: style)],
      ),
    );
  }
}

class _TextBtn<T> extends ButtonWidget<T> {
  const _TextBtn({
    super.key,
    required super.callback,
    super.padding,
    super.backgroundColor,
    super.enable,
    super.icon,
    super.text,
    super.style,
    super.disableColor,
    super.radius,
    super.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enable ? callback : null,
      style: FilledButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disableColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [if (icon != null) icon!, child ?? Text(text, style: style)],
      ),
    );
  }
}

class _IconBtn<T> extends ButtonWidget<T> {
  const _IconBtn({
    super.key,
    required super.callback,
    super.padding,
    super.backgroundColor,
    super.enable,
    super.icon,
    super.disableColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enable ? callback : null,
      style: IconButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disableColor,
      ),
      icon: icon ?? Container(),
    );
  }
}

class _IconOutlinedBtn<T> extends ButtonWidget<T> {
  const _IconOutlinedBtn({
    super.key,
    super.radius,
    super.icon,
    super.borderColor,
    super.borderSize,
    required super.callback,
    super.disableColor,
    super.padding,
    super.enable,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: enable ? callback : null,
      style: IconButton.styleFrom(
        padding: padding,
        disabledBackgroundColor: disableColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: borderSize, color: borderColor),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      icon: icon ?? Container(),
    );
  }
}

class _IconFilledBtn<T> extends ButtonWidget<T> {
  const _IconFilledBtn({
    super.key,
    super.radius,
    super.icon,
    required super.callback,
    super.disableColor,
    super.backgroundColor,
    super.padding,
    super.enable,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: enable ? callback : null,
      style: IconButton.styleFrom(
        padding: padding,
        disabledBackgroundColor: disableColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      icon: icon ?? Container(),
    );
  }
}

class _IconFillerTonalBtn<T> extends ButtonWidget<T> {
  const _IconFillerTonalBtn({
    super.key,
    super.radius,
    super.icon,
    required super.callback,
    super.disableColor,
    super.backgroundColor,
    super.padding,
    super.enable,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: enable ? callback : null,
      style: IconButton.styleFrom(
        padding: padding,
        disabledBackgroundColor: disableColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      icon: icon ?? Container(),
    );
  }
}

class _SegmentedSingleBtn<T> extends ButtonWidget<T> {
  _SegmentedSingleBtn({
    super.key,
    super.radius,
    required super.callbackSeg,
    super.backgroundColor,
    super.padding,
    super.enable,
    super.values,
    super.selected,
    super.textSeg,
    super.iconSeg,
  }) : assert(values.isNotEmpty, 'values is empty');

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<T>(
      style: SegmentedButtonTheme.of(context).style?.copyWith(
            padding: MaterialStateProperty.all(padding),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
      segments: <ButtonSegment<T>>[
        for (final item in values)
          ButtonSegment<T>(
            value: item,
            label: textSeg?.call(item) ?? Text(item.toString()),
            icon: iconSeg?.call(item),
          ),
      ],
      selected: <T>{selected ?? values.first},
      onSelectionChanged: enable
          ? (Set<T> v) {
              callbackSeg?.call(v.first);
            }
          : null,
      showSelectedIcon: iconSeg != null,
    );
  }
}

class _SegmentedMultiBtn<T> extends ButtonWidget<T> {
  _SegmentedMultiBtn({
    super.key,
    super.radius,
    required super.callbackLstSeg,
    super.backgroundColor,
    super.padding,
    super.enable,
    super.values,
    super.lstSelected,
    super.textSeg,
    super.iconSeg,
  }) : assert(values.isNotEmpty, 'values is empty');

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<T>(
      style: SegmentedButtonTheme.of(context).style?.copyWith(
            padding: MaterialStateProperty.all(padding),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
      segments: <ButtonSegment<T>>[
        for (final item in values)
          ButtonSegment<T>(
            value: item,
            label: textSeg?.call(item) ?? Text(item.toString()),
            icon: iconSeg?.call(item),
          ),
      ],
      selected: lstSelected ?? {values.first},
      onSelectionChanged: enable
          ? (Set<T> v) {
              callbackLstSeg?.call(v);
            }
          : null,
      showSelectedIcon: iconSeg != null,
      multiSelectionEnabled: true,
    );
  }
}
