part of 'ui.dart';

enum ButtonType {
  elevated,
  outline,
  text,
  filled,
  filledTonal,
  float,
  icon,
  segmented
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.buttonType = ButtonType.elevated,
    this.text = '',
    required this.callback,
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
  });
  final ButtonType buttonType;
  final String text;
  final VoidCallback callback;
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

class _ElevatedBtn extends ButtonWidget {
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

class _OutlineBtn extends ButtonWidget {
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

class _FilledBtn extends ButtonWidget {
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
      onPressed: callback,
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
