import 'package:flutter/material.dart';

class SliverViewport extends StatelessWidget {
  const SliverViewport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder Example'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              return Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Mobile Layout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                width: 400,
                height: 400,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Desktop Layout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
