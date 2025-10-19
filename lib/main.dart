import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:watch_me/data/repositories/movie_repository.dart';
import 'data/services/apis/movie_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  final api = MovieApi(apiKey: dotenv.env["API_KEY"]!, accessToken: dotenv.env["API_ACCESS_KEY"]!);

  final repository = MovieRepository(api);

  final movies = await repository.getTopRatedMovies(page: 1);
  print('Total movies fetched: ${movies.length}');
  print('First movie: ${movies.first.title}');
}
