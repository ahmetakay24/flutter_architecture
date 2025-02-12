import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T model) onPageBuilder;
  final T? viewModel;
  final Function(T model)? onModelReady;
  final VoidCallback? onModelDispose;

  const BaseView({super.key, this.viewModel, this.onModelReady, this.onModelDispose, required this.onPageBuilder});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModel);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onModelDispose != null) widget.onModelDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewModel);
  }
}
