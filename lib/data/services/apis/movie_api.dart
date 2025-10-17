import 'package:dio/dio.dart';
import 'package:watch_me/data/entities/movie_api_model.dart';
import 'package:watch_me/domain/iservices/apis/imovie_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieApi implements IMovieApi {
  final Dio dio;
  final String apiKey;
  final String apiAccessKey;

  MovieApi({Dio? dio})
    : dio = dio ?? Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3')),
      apiKey = dotenv.env["API_KEY"] ?? '',
      apiAccessKey = dotenv.env["API_ACCESS_KEY"]?.trim() ?? '';

  @override
  Future<List<MovieApiModel>> getTopRatedMovies({int page = 1}) async {
    try {
      final response = await dio.get(
        '/movie/top_rated',
        queryParameters: {'api_key': apiKey, 'language': 'en-US', 'page': page},
        options: Options(headers: {'Authorization': 'Bearer $apiAccessKey'}),
      );

      final List results = response.data['results'];
      return results.map((json) => MovieApiModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load top rated movies: $e');
    }
  }

  @override
  Future<MovieApiModel> getMovieDetails(int id) async {
    try {
      final response = await dio.get(
        '/movie/$id',
        queryParameters: {'api_key': apiKey, 'language': 'en-US'},
        options: Options(headers: {'Authorization': 'Bearer $apiAccessKey'}),
      );

      return MovieApiModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }

  @override
  Future<List<MovieApiModel>> searchMovies(String query) async {
    try {
      final response = await dio.get(
        '/search/movie',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
          'query': query,
          'page': 1,
          'include_adult': false,
        },
        options: Options(headers: {'Authorization': 'Bearer $apiAccessKey'}),
      );

      final List results = response.data['results'];
      return results.map((json) => MovieApiModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }
}
