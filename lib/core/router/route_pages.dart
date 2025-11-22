import 'package:easacc/features/auth/presentation/view/screens/login_screen.dart';
import 'package:easacc/features/home/presentation/view/screens/home_screen.dart';
import 'package:easacc/features/settings/presentation/view/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';



final List<GoRoute> appRoutes = [
GoRoute(
    path: AppRoutes.login,
    name: 'login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.home,
    name: 'home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: AppRoutes.settings,
    name: 'settings',
    builder: (context, state) => const SettingsScreen(),
  ),
];
