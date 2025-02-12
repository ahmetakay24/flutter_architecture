import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/state/base_state.dart';
import 'package:flutter_architecture/core/base/view/base_view.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends BaseState<Test> {
  @override
  Widget build(BuildContext context) {
    return BaseView(onPageBuilder: (context, model) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      );
    });
  }
}