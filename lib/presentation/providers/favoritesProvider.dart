import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:watch_me/data/db/hive_adapter.dart';
import 'package:watch_me/domain/entities/movie.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Movie>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<List<Movie>> {
  FavoritesNotifier() : super([]) {
    _loadFavorites();
  }

  late Box<MovieHiveModel> _favoritesBox;

  Future<void> _loadFavorites() async {
    _favoritesBox = Hive.box<MovieHiveModel>('favorites');
    state = _favoritesBox.values.map((m) => m.toEntity()).toList();
  }

  void toggleFavorite(Movie movie) {
    final exists = _favoritesBox.values.any((m) => m.id == movie.id);

    if (exists) {
      final key = _favoritesBox.keys.firstWhere((k) => _favoritesBox.get(k)?.id == movie.id);
      _favoritesBox.delete(key);
    } else {
      _favoritesBox.add(MovieHiveModel.fromEntity(movie));
    }

    state = _favoritesBox.values.map((m) => m.toEntity()).toList();
  }

  bool isFavorite(int id) => _favoritesBox.values.any((movie) => movie.id == id);
}
