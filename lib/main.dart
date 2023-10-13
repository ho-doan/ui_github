import 'package:flutter/material.dart';
import 'package:flutter_ui_common/flutter_ui_common.dart';

import '_define_text.dart';
import 'widget_review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            WidgetReview(
              text: textWidget,
              child: TextWidget(
                'hello word ' * 4,
              ),
            ),
            WidgetReview(
              text: textChildWidget,
              child: TextChildWidget(
                'hello word ' * 4,
                left: const Icon(Icons.add),
              ),
            ),
            WidgetReview(
              text: textChildWidget,
              child: TextChildWidget(
                'hello word ' * 4,
                autoShow: true,
                left: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
