import 'package:flutter/widgets.dart';

typedef ViewModelWidgetBuilder<T extends ChangeNotifier> = Widget Function(
  BuildContext context,
  T viewModel,
  Widget? child,
);

class ViewModelBuilder<T extends ChangeNotifier> extends StatefulWidget {
  const ViewModelBuilder({
    super.key,
    required this.viewModelBuilder,
    required this.builder,
    this.onViewModelReady,
    this.child,
  });

  final T Function() viewModelBuilder;
  final ViewModelWidgetBuilder<T> builder;
  final void Function(T viewModel)? onViewModelReady;
  final Widget? child;

  @override
  State<ViewModelBuilder<T>> createState() => _ViewModelBuilderState<T>();
}

class _ViewModelBuilderState<T extends ChangeNotifier>
    extends State<ViewModelBuilder<T>> {
  late final T _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModelBuilder();
    widget.onViewModelReady?.call(_viewModel);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      child: widget.child,
      builder: (context, child) => widget.builder(context, _viewModel, child),
    );
  }
}

