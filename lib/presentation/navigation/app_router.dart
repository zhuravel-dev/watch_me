import 'package:go_router/go_router.dart';
import 'package:watch_me/presentation/views/details_screen.dart';
import 'package:watch_me/presentation/views/main_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MainScreen()),
      GoRoute(
        path: '/movie/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return MovieDetailsScreen(movieId: id);
        },
      ),
    ],
  );
}
