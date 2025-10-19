import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/data/repositories/movie_repository.dart';
import 'package:watch_me/domain/irepositories/imovie_repository.dart';
import 'movieApiProvider.dart';

final movieRepositoryProvider = Provider<IMovieRepository>((ref) {
  final api = ref.read(movieApiProvider);
  return MovieRepository(api);
});
