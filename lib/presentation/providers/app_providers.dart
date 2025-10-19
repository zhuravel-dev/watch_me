import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/data/repositories/movie_repository.dart';
import 'package:watch_me/data/services/apis/movie_api.dart';
import 'package:watch_me/domain/irepositories/imovie_repository.dart';
import 'package:watch_me/domain/entities/movie.dart';

final movieApiProvider = Provider<MovieApi>((ref) {
  return MovieApi(
    apiKey: dotenv.env["API_KEY"] ?? '',
    accessToken: dotenv.env["API_ACCESS_KEY"]?.trim() ?? '',
  );
});

final movieRepositoryProvider = Provider<IMovieRepository>((ref) {
  final api = ref.read(movieApiProvider);
  return MovieRepository(api);
});

final topRatedMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  final repo = ref.read(movieRepositoryProvider);
  return repo.getTopRatedMovies();
});
