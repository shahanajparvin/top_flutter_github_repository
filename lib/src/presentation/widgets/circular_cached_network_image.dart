import 'package:flutter/material.dart';


class CircularNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final Color borderColor;
  final double borderWidth;

  CircularNetworkImage({
    required this.imageUrl,
     this.width = 40,
     this.height = 40,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width + borderWidth * 2,
        height: height + borderWidth * 2,
        decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
        color: borderColor,
        width: borderWidth,
    ),
    ),
    child: ClipOval(
      child: Image.network(
        height:height,
        width: width,
        imageUrl ?? '',
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return const Center(
            child: Text(
              '404\nNOT FOUND',
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    ));
  }
}
