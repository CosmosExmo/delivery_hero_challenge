import 'package:delivery_hero_challenge/app/blueprints/base_viewmodel.dart';
import 'package:delivery_hero_challenge/widgets/box_container.dart';
import 'package:delivery_hero_challenge/widgets/custom_circular_progress_indicator.dart';
import 'package:delivery_hero_challenge/widgets/custom_transition_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePageView<T extends BaseViewModel> extends StatelessWidget {
  final AppBar? appBar;
  final Widget content;
  final bool haveScaffold;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool shouldWaitForGetData;

  const BasePageView({
    Key? key,
    this.appBar,
    this.content = const SizedBox.shrink(),
    this.haveScaffold = true,
    this.scaffoldKey,
    this.shouldWaitForGetData = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return haveScaffold
        ? Scaffold(
            key: scaffoldKey,
            appBar: appBar,
            body: _PageLoadingWidget<T>(
              content: content,
            ),
          )
        : _PageLoadingWidget<T>(
            content: content,
            shouldWaitForGetData: shouldWaitForGetData,
          );
  }
}

class _PageLoadingWidget<T extends BaseViewModel> extends StatefulWidget {
  final Widget content;
  final bool shouldWaitForGetData;
  const _PageLoadingWidget({
    Key? key,
    this.content = const SizedBox.shrink(),
    this.shouldWaitForGetData = true,
  }) : super(key: key);

  @override
  __PageLoadingWidgetState<T> createState() => __PageLoadingWidgetState<T>();
}

class __PageLoadingWidgetState<T extends BaseViewModel>
    extends State<_PageLoadingWidget> {
  late T _provider;

  @override
  void initState() {
    super.initState();
    _provider = context.read<T>();
    // ignore: invalid_use_of_protected_member
    _provider.getData();
  }

  @override
  void dispose() {
    // ignore: invalid_use_of_protected_member
    _provider.disposeModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewDidLoad = context.select<T, bool>((value) => value.viewDidLoad);

    return widget.shouldWaitForGetData
        ? CustomTransitionSwitcher(
            child: !viewDidLoad
                ? const BoxContainer(child: CustomCircularProgressIndicator())
                : widget.content,
          )
        : widget.content;
  }
}
