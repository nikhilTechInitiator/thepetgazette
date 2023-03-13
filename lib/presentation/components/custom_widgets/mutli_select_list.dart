import 'package:flutter/material.dart';


class MultiSelectList extends StatefulWidget {
  final List<MultiSelectItemModel> multiSelectItemModels;
  final bool isMultiSelect;
  final Function? onItemSelected;

  const MultiSelectList(
      {Key? key,
      required this.multiSelectItemModels,
      this.isMultiSelect = true,
      this.onItemSelected})
      : super(key: key);

  @override
  State<MultiSelectList> createState() => _MultiSelectListState();
}

class _MultiSelectListState extends State<MultiSelectList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        children: widget.multiSelectItemModels
            .map((e) => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (widget.isMultiSelect) {
                    e.isSelected = !e.isSelected;

                    setState(() {});
                  } else {
                    for (var element in widget.multiSelectItemModels) {
                      element.isSelected = false;
                    }
                    e.isSelected = true;
                    setState(() {});
                  }
                  widget.onItemSelected?.call(e);
                },
                child: MultiSelectItem(multiSelectItemModel: e)))
            .toList(),
      ),
    );
  }
}

class MultiSelectItem extends StatelessWidget {
  final MultiSelectItemModel multiSelectItemModel;

  const MultiSelectItem({Key? key, required this.multiSelectItemModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: multiSelectItemModel.isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface),
          borderRadius: BorderRadius.circular(6),
          color: multiSelectItemModel.isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.only(right: 6, bottom: 4),
      child: Text(
        multiSelectItemModel.text,
        style: TextStyle(
            color: multiSelectItemModel.isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Colors.black),
      ),
    );
  }
}

class MultiSelectItemModel {
  bool isSelected;
  String text;
  String? id;

  MultiSelectItemModel({required this.text, this.isSelected = false, this.id});
}
