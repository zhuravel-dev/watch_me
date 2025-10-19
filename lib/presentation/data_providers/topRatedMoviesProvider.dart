import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/domain/entities/movie.dart';
import 'movieRepositoryProvider.dart';

final topRatedMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  final repo = ref.read(movieRepositoryProvider);
  return repo.getTopRatedMovies();
});
