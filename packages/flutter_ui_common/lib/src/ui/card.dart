part of 'ui.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    this.borderSide = const BorderSide(width: 1, color: Colors.white),
    this.backgroundColor = Colors.purpleAccent,
    this.shadowColor = Colors.grey,
    this.opacity = 0,
    this.icon,
    this.radius = const Radius.circular(8),
    required this.child,
  });

  factory CardWidget.elevated({
    Key? key,
    Color backgroundColor = Colors.purpleAccent,
    Widget? icon,
    Radius radius = const Radius.circular(8),
    required Widget child,
  }) =>
      _ElevatedCard(
        backgroundColor: backgroundColor,
        icon: icon,
        key: key,
        radius: radius,
        child: child,
      );
  factory CardWidget.filled({
    Key? key,
    Color backgroundColor = Colors.purpleAccent,
    Widget? icon,
    Radius radius = const Radius.circular(8),
    required Widget child,
    double opacity = 0,
    Color shadowColor = Colors.grey,
  }) =>
      _FilledCard(
        opacity: opacity,
        shadowColor: shadowColor,
        backgroundColor: backgroundColor,
        icon: icon,
        key: key,
        radius: radius,
        child: child,
      );
  factory CardWidget.outlined({
    Key? key,
    BorderSide borderSide = const BorderSide(width: 1, color: Colors.black),
    Widget? icon,
    Radius radius = const Radius.circular(8),
    required Widget child,
    double opacity = 0,
    Color shadowColor = Colors.grey,
  }) =>
      _OutlinedCard(
        opacity: opacity,
        shadowColor: shadowColor,
        icon: icon,
        key: key,
        radius: radius,
        borderSide: borderSide,
        child: child,
      );

  final BorderSide borderSide;
  final Color backgroundColor;
  final Color shadowColor;
  final double opacity;
  final Widget? icon;
  final Radius radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _ElevatedCard extends CardWidget {
  const _ElevatedCard({
    required super.child,
    super.backgroundColor,
    super.icon,
    super.key,
    super.radius,
    super.opacity,
    super.shadowColor,
  });

  bool get hasIcon => icon != null;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.zero,
          elevation: 2,
          shadowColor: shadowColor.withOpacity(opacity),
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(radius),
          ),
          child: child,
        ),
        if (hasIcon)
          Positioned(
            top: 0,
            right: 4,
            child: icon!,
          )
      ],
    );
  }
}

class _FilledCard extends CardWidget {
  const _FilledCard({
    required super.child,
    super.backgroundColor,
    super.icon,
    super.key,
    super.radius,
    super.opacity,
    super.shadowColor,
  });

  bool get hasIcon => icon != null;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.zero,
          elevation: 2,
          shadowColor: shadowColor.withOpacity(opacity),
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(radius),
          ),
          child: child,
        ),
        if (hasIcon)
          Positioned(
            top: 0,
            right: 4,
            child: icon!,
          )
      ],
    );
  }
}

class _OutlinedCard extends CardWidget {
  const _OutlinedCard({
    required super.child,
    super.borderSide,
    super.icon,
    super.key,
    super.radius,
    super.opacity,
    super.shadowColor,
  });

  bool get hasIcon => icon != null;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.zero,
          elevation: 2,
          shadowColor: shadowColor.withOpacity(opacity),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(radius),
            side: borderSide,
          ),
          child: child,
        ),
        if (hasIcon)
          Positioned(
            top: 0,
            right: 4,
            child: icon!,
          )
      ],
    );
  }
}
