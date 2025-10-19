import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/domain/entities/movie.dart';
import 'package:watch_me/presentation/data_providers/movieRepositoryProvider.dart';
import 'package:watch_me/presentation/search/search_movie_notifier.dart';

final searchMoviesProvider = StateNotifierProvider<SearchMoviesNotifier, AsyncValue<List<Movie>>>(
  (ref) => SearchMoviesNotifier(ref.read(movieRepositoryProvider)),
);
