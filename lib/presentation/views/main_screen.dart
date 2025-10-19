import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/presentation/components/movie_list.dart';
import 'package:watch_me/presentation/components/custom_app_bar.dart';
import 'package:watch_me/presentation/data_providers/favoritesProvider.dart';
import 'package:watch_me/presentation/data_providers/topRatedMoviesProvider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allMoviesAsync = ref.watch(topRatedMoviesProvider);
    final favoritesAsync = ref.watch(favoritesProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(title: 'Movies', showThemeIcon: true, isShowSearch: true),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(icon: Icon(Icons.favorite, color: Colors.red)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  allMoviesAsync.when(
                    data: (movies) => MovieList(movies: movies),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (err, _) => Center(child: Text('Error: $err')),
                  ),
                  favoritesAsync.when(
                    data: (favorites) {
                      if (favorites.isEmpty) return const Center(child: Text('No favorites yet'));
                      return MovieList(movies: favorites);
                    },
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (err, _) => Center(child: Text('Error: $err')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
