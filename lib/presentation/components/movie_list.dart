import 'package:flutter/material.dart';
import 'package:watch_me/domain/entities/movie.dart';
import 'package:go_router/go_router.dart';
import 'movie_item.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.6,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieItem(
          movie: movie,
          onTap: () {
            context.push('/movie/${movie.id}');
          },
        );
      },
    );
  }
}
