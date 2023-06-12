import 'package:flutter/material.dart';

class StackExample extends StatefulWidget {
  const StackExample({super.key});

  @override
  _StackExampleState createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  int currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Creative IndexedStack Example'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => changeIndex(0),
                  child: const Text('First'),
                ),
                ElevatedButton(
                  onPressed: () => changeIndex(1),
                  child: const Text('Second'),
                ),
                ElevatedButton(
                  onPressed: () => changeIndex(2),
                  child: const Text('Third'),
                ),
              ],
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: IndexedStack(
                  key: ValueKey<int>(currentIndex),
                  index: currentIndex,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      key: const ValueKey<int>(0),
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          'First Screen',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    Container(
                      key: const ValueKey<int>(1),
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'Second Screen',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    Container(
                      key: const ValueKey<int>(2),
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          'Third Screen',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
