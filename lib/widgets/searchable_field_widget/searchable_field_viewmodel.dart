import 'package:async/async.dart';
import 'package:delivery_hero_challenge/app/app_defaults.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchableFieldViewModel with ChangeNotifier {
  final SearchableFieldViewParams params;

  SearchableFieldViewModel(this.params) {
    init();
  }

  late CancelableOperation cancelableOperation;

  void init() {
    cancelableOperation = CancelableOperation.fromFuture(
        Future.delayed(params.haveDelay ? params.delay : Duration.zero));
  }

  void onChanged(String value) {
    cancelableOperation.cancel();
    init();
    cancelableOperation.value.whenComplete(() => params.onChanged(value));
  }
}

@immutable
class SearchableFieldViewParams {
  final String title;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final bool expanded;
  final bool expands;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines;
  final int? maxLines;
  final int? maxLenght;
  final TextEditingController? controller;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final Duration delay;
  final bool autoFocus;
  final FocusNode? focusNode;
  final bool haveDelay;

  const SearchableFieldViewParams({
    required this.title,
    required this.onChanged,
    required this.expanded,
    this.expands = false,
    this.onSubmitted,
    this.inputFormatters,
    this.minLines,
    this.maxLines,
    this.maxLenght,
    this.controller,
    this.textAlignVertical,
    this.textCapitalization,
    this.textInputType,
    this.delay = AppDefaults.kStandartLongDuration,
    this.autoFocus = false,
    this.focusNode,
    this.haveDelay = true,
  });
}
