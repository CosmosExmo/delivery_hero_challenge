import 'package:delivery_hero_challenge/app/app_defaults.dart';
import 'package:delivery_hero_challenge/widgets/box_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'searchable_field_viewmodel.dart';

class SearchableFieldView extends StatefulWidget {
  final SearchableFieldViewParams params;
  final bool showBoxContainer;
  const SearchableFieldView(
      {Key? key, required this.params, this.showBoxContainer = true})
      : super(key: key);

  @override
  SearchableFieldViewState createState() => SearchableFieldViewState();
}

class SearchableFieldViewState extends State<SearchableFieldView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchableFieldViewModel(widget.params),
      builder: (context, _) {
        return _SearchFieldWidget(showBoxContainer: widget.showBoxContainer);
      },
    );
  }
}

class _SearchFieldWidget extends StatelessWidget {
  final bool showBoxContainer;
  const _SearchFieldWidget({Key? key, this.showBoxContainer = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final params = context.read<SearchableFieldViewModel>().params;
    final child = Padding(
      padding:
          const EdgeInsets.only(top: AppDefaults.kStandartContentPaddingLow),
      child: TextField(
        controller: params.controller,
        focusNode: params.focusNode,
        autofocus: params.autoFocus,
        expands: params.expands,
        minLines: params.minLines,
        maxLines: params.maxLines,
        textAlignVertical: params.textAlignVertical,
        textAlign: TextAlign.start,
        textCapitalization:
            params.textCapitalization ?? TextCapitalization.none,
        keyboardType: params.textInputType,
        inputFormatters: params.inputFormatters,
        onChanged: context.read<SearchableFieldViewModel>().onChanged,
        onSubmitted: params.onSubmitted,
        maxLength: params.maxLenght,
        style: Theme.of(context).textTheme.subtitle1,
        decoration: InputDecoration(hintText: params.title),
      ),
    );
    return showBoxContainer
        ? BoxContainer(child: params.expanded ? Expanded(child: child) : child)
        : params.expanded
            ? Expanded(child: child)
            : child;
  }
}
