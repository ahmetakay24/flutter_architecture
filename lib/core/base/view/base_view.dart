import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T model) onPageBuilder;
  final T? viewModel;
  final Function(T model)? onModelReady;
  final VoidCallback? onModelDispose;

  const BaseView({
    super.key,
    this.viewModel,
    this.onModelReady,
    this.onModelDispose,
    required this.onPageBuilder,
  });

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null && widget.viewModel != null) {
      widget.onModelReady!(widget.viewModel!);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onModelDispose != null) {
      widget.onModelDispose!();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel == null) {
      return const Center(child: Text('ViewModel is not provided!'));
    }
    return widget.onPageBuilder(context, widget.viewModel!);
  }
}