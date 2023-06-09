import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RawKeyboardListenerExample extends StatefulWidget {
  const RawKeyboardListenerExample({super.key});

  @override
  _RawKeyboardListenerExampleState createState() =>
      _RawKeyboardListenerExampleState();
}

class _RawKeyboardListenerExampleState
    extends State<RawKeyboardListenerExample> {
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RawKeyboardListener Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Type Something:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                _inputText,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 16),
            RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (event) {
                if (event is RawKeyUpEvent) {
                  if (event.logicalKey == LogicalKeyboardKey.backspace) {
                    setState(() {
                      _inputText = _inputText.isNotEmpty
                          ? _inputText.substring(0, _inputText.length - 1)
                          : '';
                    });
                  }
                } else if (event is RawKeyDownEvent) {
                  final typedKey = event.data.logicalKey.keyLabel;
                  setState(() {
                    _inputText += typedKey;
                  });
                }
              },
              child: Container(
                width: 200,
                height: 40,
                color: Colors.grey[200],
                alignment: Alignment.center,
                child: const Text(
                  'Click tab to Type',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
