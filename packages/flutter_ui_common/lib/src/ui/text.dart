part of 'ui.dart';

typedef TextOverflowCallback = void Function(bool);
typedef TextOverflowBuilder = Text Function(TextSpan, TextOverflow, int);

class _TextOverflowWidget extends StatefulWidget {
  final String data;
  final TextStyle? style;
  final int maxLines;
  final TextOverflowCallback? overflowCallback;
  final TextOverflowBuilder? builder;
  final bool hide;
  const _TextOverflowWidget(
    this.data, {
    super.key,
    this.overflowCallback,
    this.style,
    this.maxLines = 1,
    this.builder,
    this.hide = false,
  });

  @override
  State<_TextOverflowWidget> createState() => _TextOverflowWidgetState();
}

class _TextOverflowWidgetState extends State<_TextOverflowWidget> {
  TextSpan get span => TextSpan(
        text: widget.data,
        style: _style,
      );
  TextStyle get _style => widget.style ?? const TextStyle();
  TextSpan get spanPainter => TextSpan(
        text: widget.data,
        style: _style.copyWith(fontSize: (_style.fontSize ?? 14) + .58),
      );

  bool isOverflow = false;

  @override
  void didChangeDependencies() {
    widget.overflowCallback?.call(isOverflow);
    super.didChangeDependencies();
  }

  Widget get childDefault => Text.rich(
        span,
        overflow: TextOverflow.ellipsis,
        maxLines: widget.maxLines,
      );

  @override
  Widget build(BuildContext context) {
    if (widget.overflowCallback == null && !widget.hide) {
      return childDefault;
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final painter = TextPainter(
          maxLines: widget.maxLines,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          text: spanPainter,
        )..layout(maxWidth: constraints.maxWidth);

        final check = painter.didExceedMaxLines;

        if (check != isOverflow) {
          isOverflow = check;
          widget.overflowCallback?.call(isOverflow);
        }

        final child = widget.builder
                ?.call(span, TextOverflow.ellipsis, widget.maxLines) ??
            childDefault;

        if (!widget.hide) return child;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          child: check ? const SizedBox.shrink() : child,
        );
      },
    );
  }
}

class TextWidget extends _TextOverflowWidget {
  const TextWidget(
    super.data, {
    super.key,
    super.builder,
    super.maxLines,
    super.overflowCallback,
    super.style,
  });
}

class TextChildWidget extends StatefulWidget {
  const TextChildWidget(
    this.data, {
    super.key,
    this.style,
    this.maxLines = 1,
    this.builderText,
    this.left,
    this.right,
    this.autoShow = false,
  });

  final String data;
  final TextStyle? style;
  final int maxLines;
  final TextOverflowBuilder? builderText;
  final Widget? left;
  final Widget? right;
  final bool autoShow;

  @override
  State<TextChildWidget> createState() => _TextChildWidgetState();
}

class _TextChildWidgetState extends State<TextChildWidget> {
  final notifier = ValueNotifier(false);
  Widget get child => _TextOverflowWidget(
        widget.data,
        builder: widget.builderText,
        maxLines: widget.maxLines,
        hide: widget.autoShow,
        style: widget.style,
      );
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.left != null) widget.left!,
        Expanded(
          child: child,
        ),
        if (widget.right != null) widget.right!,
      ],
    );
  }
}
