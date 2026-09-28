import 'package:flutter/material.dart';

/// Organic wave clipper for Profile & Edit Profile header cover image.
class HeaderWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double w = size.width;
    final double h = size.height;
    const double r = 60.0;

    final Path path = Path();
    path.moveTo(r, 0);
    path.lineTo(w - r, 0);
    path.quadraticBezierTo(w, 0, w, r);
    path.lineTo(w, h - r);
    path.quadraticBezierTo(w, h, w - r, h);
    path.lineTo(w * 0.55, h);
    path.cubicTo(w * 0.40, h, w * 0.32, h - 42, w * 0.20, h - 36);
    path.cubicTo(w * 0.001, h - 30, 0, h - 5, 0, h - r - 60);
    path.lineTo(0, r);
    path.quadraticBezierTo(0, 0, r, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
