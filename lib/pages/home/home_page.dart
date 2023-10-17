import 'package:flutter/material.dart';
import 'package:flutter_ui_common/flutter_ui_common.dart';

import '../../_define_text.dart';
import '../../widget_review.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.isFrame});

  final bool isFrame;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('UI Sample'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              WidgetReview(
                isFrame: widget.isFrame,
                text: textWidget,
                child: TextWidget(
                  'hello word ' * 4,
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: textChildWidget,
                child: TextChildWidget(
                  'hello word ' * 4,
                  left: const Icon(Icons.add),
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: textChildWidget,
                child: TextChildWidget(
                  'hello word ' * 4,
                  autoShow: true,
                  left: const Icon(Icons.add),
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: elevatedButtonWidget,
                child: ButtonWidget.elevated(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  text: 'hello word ' * 2,
                  icon: const Icon(Icons.add),
                  callback: () {},
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: outlinedButtonWidget,
                child: ButtonWidget.outlined(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  borderColor: Colors.red,
                  borderSize: 2,
                  text: 'hello word ' * 2,
                  icon: const Icon(Icons.add),
                  callback: () {},
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: filledButtonWidget,
                child: ButtonWidget.filled(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  text: 'hello word ' * 2,
                  icon: const Icon(Icons.add),
                  callback: () {},
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: filledTonalButtonWidget,
                child: ButtonWidget.filledTonal(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  text: 'hello word ' * 2,
                  icon: const Icon(Icons.add),
                  callback: () {},
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: textButtonWidget,
                child: ButtonWidget.text(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  text: 'hello word ' * 2,
                  icon: const Icon(Icons.add),
                  callback: () {},
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: iconButtonWidget,
                child: ButtonWidget.icon(
                  icon: const Icon(Icons.add),
                  callback: () {},
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: iconOutlinedButtonWidget,
                child: ButtonWidget.iconOutlined(
                  icon: const Icon(Icons.add),
                  callback: () {},
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: iconFilledButtonWidget,
                child: ButtonWidget.iconFilled(
                  icon: const Icon(Icons.add),
                  callback: () {},
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: iconFilledTonalButtonWidget,
                child: ButtonWidget.iconFilledTonal(
                  icon: const Icon(Icons.add),
                  callback: () {},
                ),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: segmentedButtonWidget,
                child: Builder(builder: (context) {
                  final notifier = ValueNotifier('a');
                  return ValueListenableBuilder<String>(
                      valueListenable: notifier,
                      builder: (context, v, _) {
                        return ButtonWidget<String>.segmented(
                          callback: (t) {
                            notifier.value = t;
                          },
                          values: const ['a', 'b', 'c'],
                          selected: v,
                        );
                      });
                }),
              ),
              WidgetReview(
                isFrame: widget.isFrame,
                text: segmentedMultiButtonWidget,
                child: Builder(builder: (context) {
                  final notifier = ValueNotifier(['a']);
                  return ValueListenableBuilder<List<String>>(
                      valueListenable: notifier,
                      builder: (context, v, _) {
                        return ButtonWidget<String>.segmentedMulti(
                          callback: (t) {
                            notifier.value = t.toList().cast<String>();
                          },
                          values: const ['a', 'b', 'c'],
                          selected: v.toSet(),
                        );
                      });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
