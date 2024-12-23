import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';
// import 'package:go_router/go_router.dart';

///No es privado porque lo tenemos en archivo externo y lo vamos a exportar
final appRouter = GoRouter(
  initialLocation: '/', //initial route
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);
