import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/data/services/apis/movie_api.dart';

final movieApiProvider = Provider<MovieApi>((ref) {
  return MovieApi(
    apiKey: dotenv.env["API_KEY"] ?? '',
    accessToken: dotenv.env["API_ACCESS_KEY"]?.trim() ?? '',
  );
});
