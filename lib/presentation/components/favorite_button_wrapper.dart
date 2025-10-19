import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/domain/entities/movie.dart';
import 'package:watch_me/presentation/data_providers/favoritesProvider.dart';
import 'favorite_button.dart';

class FavoriteButtonWrapper extends ConsumerWidget {
  final Movie movie;

  const FavoriteButtonWrapper({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesProvider);
    final favoritesNotifier = ref.read(favoritesProvider.notifier);

    return favoritesAsync.when(
      data: (favoritesList) {
        final isFav = favoritesList.any((m) => m.id == movie.id);
        return FavoriteButton(
          isFavorite: isFav,
          onPressed: () => favoritesNotifier.toggleFavorite(movie),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (err, _) => Text('Error: $err'),
    );
  }
}
