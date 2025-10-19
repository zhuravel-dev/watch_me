import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:watch_me/presentation/providers/favoritesProvider.dart';
import 'package:watch_me/presentation/providers/movieDetailsProvider.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsync = ref.watch(movieDetailsProvider(movieId));
    final favorites = ref.watch(favoritesProvider);
    final favoritesNotifier = ref.read(favoritesProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: movieAsync.when(
        data: (movie) {
          final isFav = favorites.any((m) => m.id == movie.id);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (movie.backdropPath.isNotEmpty)
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: 'https://image.tmdb.org/t/p/w780${movie.backdropPath}',
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      Container(
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                          ),
                        ),
                      ),
                    ],
                  ),

                const SizedBox(height: 16),

                if (movie.posterPath.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      width: 180,
                      height: 270,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),

                const SizedBox(height: 16),

                Text(
                  movie.title,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                Text(
                  '⭐ ${movie.voteAverage.toStringAsFixed(1)}',
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 8),

                Text(
                  'Release: ${movie.releaseDate}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    movie.overview,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),

                const SizedBox(height: 24),

                ElevatedButton.icon(
                  icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                  label: Text(isFav ? 'Remove from favorite' : 'Add to favorite'),
                  onPressed: () => favoritesNotifier.toggleFavorite(movie),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),

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
