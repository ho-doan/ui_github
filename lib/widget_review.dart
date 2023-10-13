import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetReview extends StatelessWidget {
  const WidgetReview({
    super.key,
    required this.text,
    required this.child,
  });

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 300),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Card(
              child: Center(
                child: child,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: text)).then(
                  (_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("copied to clipboard."),
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                child: const Text('Copy'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
