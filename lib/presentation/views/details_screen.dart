import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/presentation/components/custom_app_bar.dart';
import 'package:watch_me/presentation/components/favorite_button_wrapper.dart';
import 'package:watch_me/presentation/components/movie_header.dart';
import 'package:watch_me/presentation/components/movie_info.dart';
import 'package:watch_me/presentation/data_providers/movieDetailsProvider.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsync = ref.watch(movieDetailsProvider(movieId));
    return Scaffold(
      appBar: CustomAppBar(title: 'Movie details'),
      body: movieAsync.when(
        data: (movie) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MovieHeader(backdropPath: movie.backdropPath, posterPath: movie.posterPath),
                const SizedBox(height: 150 + 300 / 2),
                MovieInfo(
                  title: movie.title,
                  voteAverage: movie.voteAverage,
                  releaseDate: movie.releaseDate,
                  overview: movie.overview,
                ),
                const SizedBox(height: 24),
                FavoriteButtonWrapper(movie: movie),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
