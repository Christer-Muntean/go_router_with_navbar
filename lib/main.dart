import 'package:fablo/global/cubits/auth_state_router.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthStateRouter>(
        create: (BuildContext context) => AuthStateRouter(MainPages.onBoarding),
      ),
    ],
    child: const MyApp(),
  ));
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router(BuildContext mainContext) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: UniqueKey(),
            child: const SplashPage(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/on_boarding',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: UniqueKey(),
            child: const OnBoardingPage(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/sign_in',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: UniqueKey(),
            child: const SignInPage(),
          );
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return MaterialPage(
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
                  return const MaterialPage(
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
          return MaterialPage(
            key: UniqueKey(),
            child: const AccountPage(),
          );
        },
      ),
    ],
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late final goRouter = router(context);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthStateRouter, MainPages>(
      listener: (context, state) {
        goRouter.go(state.name);
      },
      child: MaterialApp.router(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        routerConfig: goRouter,
      ),
    );
  }
}
