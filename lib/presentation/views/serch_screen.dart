import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_me/presentation/components/movie_list.dart';
import 'package:watch_me/presentation/search/search_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchMoviesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Search Movies')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Search', border: OutlineInputBorder()),
              onChanged: (value) {
                ref.read(searchMoviesProvider.notifier).search(value);
              },
            ),
          ),
          Expanded(
            child: searchState.when(
              data: (movies) => movies.isEmpty
                  ? const Center(child: Text('No results'))
                  : MovieList(movies: movies),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
