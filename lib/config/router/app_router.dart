import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';
// import 'package:go_router/go_router.dart';

///No es privado porque lo tenemos en archivo externo y lo vamos a exportar
final appRouter = GoRouter(
  initialLocation: '/', //initial route
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);
