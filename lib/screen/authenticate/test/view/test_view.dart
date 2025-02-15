import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/base/state/base_state.dart';
import 'package:flutter_architecture/core/base/view/base_view.dart';
import 'package:flutter_architecture/screen/authenticate/test/viewmodel/test_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TestsView extends StatefulWidget {
  const TestsView({super.key});

  @override
  State<TestsView> createState() => _TestsViewState();
}

class _TestsViewState extends BaseState<TestsView> {
  TestViewModel viewModel = TestViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, viewModel) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [numberText, isEvenText])),
        floatingActionButton: incrementNumber,
      );

  Widget get isEvenText => Observer(
        builder: (context) => Text(
          viewModel.isEven ? "Number is even" : "Number is odd",
        ),
      );

  Widget get numberText => Observer(
        builder: (context) => Text(
          'Number: ${viewModel.number}',
        ),
      );

  FloatingActionButton get incrementNumber => FloatingActionButton(
        onPressed: () {
          viewModel.incrementNUmber();
        },
      );
}
