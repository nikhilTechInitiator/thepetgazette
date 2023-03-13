import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thepetgazette/constants/app_styles.dart';

import '../../../constants/app_drawables.dart';

class SelectAdSize extends StatefulWidget {
  final Function? onItemSelected;

  const SelectAdSize({Key? key, this.onItemSelected}) : super(key: key);

  @override
  State<SelectAdSize> createState() => _SelectAdSizeState();
}

class _SelectAdSizeState extends State<SelectAdSize> {
  final List<AdSizeModel> models = [
    AdSizeModel(text: 'Full page', image: AppDrawables.fullPage),
    AdSizeModel(text: 'Half page (H)', image: AppDrawables.halfPageHorizontal),
    AdSizeModel(text: 'Half page (V)', image: AppDrawables.halfPageVertical),
    AdSizeModel(text: 'Quarter page', image: AppDrawables.quarterPage),
    AdSizeModel(
        text: 'Something smaller', image: AppDrawables.somethingSmaller),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 10,
        children: models
            .map((e) => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  e.isSelected = !e.isSelected;
                  setState(() {});

                  widget.onItemSelected?.call(e);
                },
                child: AdSizeWidget(model: e)))
            .toList(),
      ),
    );
  }
}

class AdSizeWidget extends StatelessWidget {
  final AdSizeModel model;

  const AdSizeWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  model.image,
                  fit: BoxFit.fitWidth,
                  width: (AppStyles().logicalWidth - 72) / 3,
                ),
                if(model.isSelected)
                  SvgPicture.asset(
                    AppDrawables.selectedTick,
                    width: 24,
                  ),
              ],
            ),
            Text(
              model.text,
              style: model.isSelected
                  ? const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600)
                  : const TextStyle(
                      color: Colors.black
                  , fontWeight: FontWeight.normal),
            ),
          ],
        ),

      ],
    );
  }
}

class AdSizeModel {
  bool isSelected;
  String text;
  String image;
  String? id;

  AdSizeModel(
      {required this.text,
      required this.image,
      this.isSelected = false,
      this.id});
}
