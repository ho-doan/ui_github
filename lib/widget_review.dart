import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:universal_html/html.dart' as html;

class WidgetReview extends StatelessWidget {
  const WidgetReview({
    super.key,
    required this.text,
    required this.child,
    required this.isFrame,
  });

  final String text;
  final Widget child;
  final bool isFrame;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
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
                try {
                  if (isFrame) {
                    html.window.parent?.postMessage({
                      'type': 'copy-to-clipboard',
                      'data': text,
                    }, '*');
                    return;
                  }
                  Clipboard.setData(ClipboardData(text: text)).then(
                    (_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("copied to clipboard."),
                        ),
                      );
                    },
                  );
                } catch (_) {
                  log('error: $_');
                }
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
