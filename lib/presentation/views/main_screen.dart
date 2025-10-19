import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/presentation/components/movie_list.dart';
import 'package:watch_me/presentation/providers/app_providers.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAsync = ref.watch(topRatedMoviesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Top Rated Movies')),
      body: moviesAsync.when(
        data: (movies) => MovieList(movies: movies),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
