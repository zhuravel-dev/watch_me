import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:watch_me/data/db/hive_adapter.dart';
import 'package:watch_me/domain/entities/movie.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, AsyncValue<List<Movie>>>((ref) {
  return FavoritesNotifier();
});


class FavoritesNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  FavoritesNotifier() : super(const AsyncValue.loading()) {
    _loadFavorites();
  }

  late Box<MovieHiveModel> _favoritesBox;

  void _loadFavorites() {
    _favoritesBox = Hive.box<MovieHiveModel>('favorites');
    state = AsyncValue.data(_favoritesBox.values.map((m) => m.toEntity()).toList());
  }

  void toggleFavorite(Movie movie) {
    if (_favoritesBox.values.any((m) => m.id == movie.id)) {
      final key = _favoritesBox.keys.firstWhere((k) => _favoritesBox.get(k)?.id == movie.id);
      _favoritesBox.delete(key);
    } else {
      _favoritesBox.add(MovieHiveModel.fromEntity(movie));
    }

    state = AsyncValue.data(_favoritesBox.values.map((m) => m.toEntity()).toList());
  }

  bool isFavorite(int id) {
    final movies = state.asData?.value ?? [];
    return movies.any((m) => m.id == id);
  }
}
