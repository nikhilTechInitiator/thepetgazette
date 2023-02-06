import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final BoxPainter _painter;

  CustomTabIndicator({required Color color, required Size size})
      : _painter = _CustomShapePainter(color, size);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CustomShapePainter extends BoxPainter {
  final Paint _paint;
  final Size size;

  _CustomShapePainter(Color color, this.size)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final path = Path();
    path.moveTo(offset.dx, 0);
    path.lineTo(offset.dx + size.width, 0);
    path.quadraticBezierTo(offset.dx + size.width - size.height * .4, 0,
        offset.dx + size.width - size.height * .4, size.height * .4);
    path.lineTo(offset.dx + size.width - size.height * .4, size.height * .6);
    path.quadraticBezierTo(offset.dx + size.width - size.height * .4,
        size.height, offset.dx + size.width - size.height * .8, size.height);
    path.lineTo(offset.dx + size.height * .8, size.height);
    path.quadraticBezierTo(offset.dx + size.height * .4, size.height,
        offset.dx + size.height * .4, size.height - size.height * .4);
    path.quadraticBezierTo(offset.dx + size.height * .4, 0, offset.dx + 0, 0);

    path.lineTo(offset.dx + size.height * .4, size.height * .4);
    //
    path.close();
    canvas.drawPath(path, _paint);
  }
}
