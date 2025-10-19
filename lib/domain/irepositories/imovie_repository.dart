import 'package:watch_me/domain/entities/movie.dart';

abstract class IMovieRepository {
  Future<List<Movie>> getTopRatedMovies({int page = 1});
  Future<Movie> getMovieDetails(int id);
  Future<List<Movie>> searchMovies(String query);
}
