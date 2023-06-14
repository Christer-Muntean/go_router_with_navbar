import 'package:fablo/global/providers/auth_state_router.dart';
import 'package:fablo/main/account_page/account_page.dart';
import 'package:fablo/main/navbar_pages/discover_page.dart';
import 'package:fablo/main/navbar_pages/home/home_page.dart';
import 'package:fablo/main/navbar_pages/home/read_story_page.dart';
import 'package:fablo/main/navbar_pages/shop_page.dart';
import 'package:fablo/main/scaffold_with_navbar.dart';
import 'package:fablo/onboarding/onboarding_page.dart';
import 'package:fablo/sign_in/sign_in_page.dart';
import 'package:fablo/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthStateRouter>(create: (_) => AuthStateRouter()),
    ],
    child: const MyApp(),
  ));
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

List<String> _navBarRoutes = [
  '/discover',
  '/shop',
  '/account',
  '/home/read_story',
];

GoRouter router(BuildContext mainContext) {
  String? location = mainContext.watch<AuthStateRouter>().currentPage?.name;
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    redirect: (BuildContext context, GoRouterState state) {
      print(state.location);
      if (_navBarRoutes.contains(state.location)) {
        return state.location;
      }
      return location;
    },
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: UniqueKey(),
            child: const SplashPage(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/on_boarding',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: UniqueKey(),
            child: const OnBoardingPage(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/sign_in',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: UniqueKey(),
            child: const SignInPage(),
          );
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
              child: ScaffoldWithNavBar(
            location: state.location,
            child: child,
          ));
        },
        routes: [
          GoRoute(
            path: '/home',
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: HomePage(),
              );
            },
            routes: [
              GoRoute(
                path: 'read_story',
                name: 'read_story_page',
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: ReadStoryPage(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/discover',
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: DiscoverPage(),
              );
            },
          ),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: '/shop',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: ShopPage(),
                );
              }),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/account',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: UniqueKey(),
            child: const AccountPage(),
          );
        },
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router(context),
    );
  }
}
