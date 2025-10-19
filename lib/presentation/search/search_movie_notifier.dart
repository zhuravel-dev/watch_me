import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/domain/entities/movie.dart';
import 'package:watch_me/domain/irepositories/imovie_repository.dart';

class SearchMoviesNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final IMovieRepository repository;
  Timer? _debounce;

  SearchMoviesNotifier(this.repository) : super(const AsyncValue.data([]));

  void search(String query) {
    if (query.length < 3) {
      state = const AsyncValue.data([]);
      return;
    }
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      state = const AsyncValue.loading();
      try {
        final movies = await repository.searchMovies(query);
        state = AsyncValue.data(movies);
      } catch (e, st) {
        state = AsyncValue.error(e, st);
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
