import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/domain/entities/movie.dart';
import 'movieRepositoryProvider.dart';

final movieDetailsProvider = FutureProvider.family<Movie, int>((ref, id) async {
  final repo = ref.read(movieRepositoryProvider);
  return repo.getMovieDetails(id);
});
