import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PosterItem extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const PosterItem({
    super.key,
    required this.imagePath,
    this.width = 150,
    this.height = 225,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: 'https://image.tmdb.org/t/p/w500$imagePath',
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
