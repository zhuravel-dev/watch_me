import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BackdropItem extends StatelessWidget {
  final String imagePath;
  final double height;

  const BackdropItem({super.key, required this.imagePath, this.height = 220});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w780$imagePath',
          width: double.infinity,
          height: height,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            ),
          ),
        ),
      ],
    );
  }
}
