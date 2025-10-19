import 'package:flutter/cupertino.dart';
import 'package:watch_me/presentation/components/poster_item.dart';
import 'backdrop_item.dart';

class MovieHeader extends StatelessWidget {
  final String backdropPath;
  final String posterPath;

  const MovieHeader({super.key, required this.backdropPath, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    if (backdropPath.isEmpty) return const SizedBox.shrink();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        BackdropItem(imagePath: backdropPath),
        if (posterPath.isNotEmpty)
          Positioned(
            top: 150,
            left: MediaQuery.of(context).size.width / 2 - 125,
            child: PosterItem(
              imagePath: posterPath,
              width: 250,
              height: 350,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
      ],
    );
  }
}
