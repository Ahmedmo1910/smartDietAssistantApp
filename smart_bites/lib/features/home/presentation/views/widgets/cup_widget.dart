import 'package:flutter/material.dart';

class CupWidget extends StatelessWidget {
  final bool filled;
  final bool addButton;

  const CupWidget({super.key, this.filled = false, this.addButton = false});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CupClipper(),
      child: Container(
        width: 40,
        height: 45,
        decoration: BoxDecoration(
          color: filled
              ? Colors.white
              : addButton
              ? Colors.white.withOpacity(0.3)
              : Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        child: addButton
            ? const Icon(Icons.add, color: Colors.white, size: 20)
            : null,
      ),
    );
  }
}

class CupClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from top-left (wide top)
    path.moveTo(0, 0);
    // Top edge (full width)
    path.lineTo(size.width, 0);
    // Right slant inwards
    path.lineTo(size.width * 0.8, size.height);
    // Bottom edge (narrow)
    path.lineTo(size.width * 0.2, size.height);
    // Left slant inwards back to start
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
