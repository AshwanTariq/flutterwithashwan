import 'package:flutter/material.dart';

class SemanticsExample extends StatefulWidget {
  const SemanticsExample({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SemanticsExampleState();
  }
}

class _SemanticsExampleState extends State<SemanticsExample> {
  static const TextStyle textStyle = TextStyle(color: Colors.white);

  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Semantic Example"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
                value: flag,
                onChanged: (value) => setState(() => flag = value)),
            const SizedBox(
              height: 20,
            ),
            ExcludeSemantics(
              excluding: flag, // Exclude semantics for the text widget
              child: const Text(
                'This is Text Widget',
                style: textStyle,
              ),
            ),
            SizedBox(
              width: 400,
              height: 160,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    bottom: 0,
                    child: ExcludeSemantics(
                      excluding: false, // Exclude semantics for the button
                      child: OutlinedButton(
                        child: const Text('Demo Button'),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
