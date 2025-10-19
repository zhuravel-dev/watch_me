import 'package:watch_me/domain/entities/movie.dart';
import 'package:watch_me/domain/irepositories/imovie_repository.dart';
import 'package:watch_me/domain/iservices/apis/imovie_api.dart';

class MovieRepository implements IMovieRepository {
  final IMovieApi api;

  MovieRepository(this.api);

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final movieModels = await api.getTopRatedMovies(page: page);
    return movieModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Movie> getMovieDetails(int id) async {
    final model = await api.getMovieDetails(id);
    return model.toEntity();
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final movieModels = await api.searchMovies(query);
    return movieModels.map((model) => model.toEntity()).toList();
  }
}
