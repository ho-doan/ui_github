import 'package:flutter/material.dart';
import 'package:github_flutter_ui/pages/error/error_page.dart';
import 'package:github_flutter_ui/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

import '../../pages/detail/detail_page.dart';

part 'routers.g.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: $appRoutes,
  errorBuilder: (context, state) => const ErrorPage(),
);

@TypedGoRoute<DetailRoute>(path: '/detail')
class DetailRoute extends GoRouteData {
  const DetailRoute({this.frame});
  final bool? frame;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DetailPage();
  }
}

@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData {
  const RootRoute({this.frame});
  final bool? frame;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage(isFrame: frame ?? false);
  }
}
