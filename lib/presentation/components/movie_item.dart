import 'package:flutter/material.dart';
import 'package:watch_me/domain/entities/movie.dart';
import 'package:watch_me/presentation/components/poster_item.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;

  const MovieItem({super.key, required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PosterItem(
              imagePath: movie.posterPath,
              width: double.infinity,
              height: double.infinity,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('⭐ ${movie.voteAverage.toStringAsFixed(1).replaceFirst(RegExp(r'\.?0*$'), '')}'),
        ],
      ),
    );
  }
}
