const String textWidget = '''
TextWidget(
  'hello word ' * 4,
)''';
const String textChildWidget = '''
TextChildWidget(
  'hello word ' * 4,
  autoShow: true,
  left: const Icon(Icons.add),
)''';
const String elevatedButtonWidget = '''
ButtonWidget.elevated(
  style: const TextStyle(
    color: Colors.white,
  ),
  text: 'hello word ' * 2,
  icon: const Icon(Icons.add),
  callback: () {},
)''';
const String outlinedButtonWidget = '''
ButtonWidget.outlined(
  style: const TextStyle(
    color: Colors.white,
  ),
  borderColor: Colors.red,
  borderSize: 2,
  text: 'hello word ' * 2,
  icon: const Icon(Icons.add),
  callback: () {},
)''';
const String filledButtonWidget = '''
ButtonWidget.filled(
  style: const TextStyle(
    color: Colors.white,
  ),
  text: 'hello word ' * 2,
  icon: const Icon(Icons.add),
  callback: () {},
)''';

const String filledTonalButtonWidget = '''
ButtonWidget.filledTonal(
  style: const TextStyle(
    color: Colors.white,
  ),
  text: 'hello word ' * 2,
  icon: const Icon(Icons.add),
  callback: () {},
)''';
const String textButtonWidget = '''
ButtonWidget.text(
  style: const TextStyle(
    color: Colors.white,
  ),
  text: 'hello word ' * 2,
  icon: const Icon(Icons.add),
  callback: () {},
)''';
const String iconButtonWidget = '''
ButtonWidget.icon(
  style: const TextStyle(
    color: Colors.white,
  ),
  text: 'hello word ' * 2,
  icon: const Icon(Icons.add),
  callback: () {},
)''';
const String iconOutlinedButtonWidget = '''
ButtonWidget.iconOutlined(
  style: const TextStyle(
    color: Colors.white,
  ),
  text: 'hello word ' * 2,
  icon: const Icon(Icons.add),
  callback: () {},
)''';
const String iconFilledButtonWidget = '''
ButtonWidget.iconFilled(
  style: const TextStyle(
    color: Colors.white,
  ),
  text: 'hello word ' * 2,
  icon: const Icon(Icons.add),
  callback: () {},
)''';
const String iconFilledTonalButtonWidget = '''
ButtonWidget.iconFilledTonal(
  style: const TextStyle(
    color: Colors.white,
  ),
  text: 'hello word ' * 2,
  icon: const Icon(Icons.add),
  callback: () {},
)''';
const String segmentedButtonWidget = '''
Builder(builder: (context) {
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
})''';
const String segmentedMultiButtonWidget = '''
Builder(builder: (context) {
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
})''';
