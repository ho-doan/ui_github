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
