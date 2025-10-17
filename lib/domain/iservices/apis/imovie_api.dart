import 'package:watch_me/data/entities/movie_api_model.dart';

abstract class IMovieApi {
  Future<List<MovieApiModel>> getTopRatedMovies({int page = 1});
  Future<MovieApiModel> getMovieDetails(int id);
  Future<List<MovieApiModel>> searchMovies(String query);
}