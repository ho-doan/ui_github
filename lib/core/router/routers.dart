import 'package:flutter/material.dart' hide Tab;
import 'package:github_flutter_ui/pages/error/error_page.dart';
import 'package:github_flutter_ui/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

import '../../pages/detail/detail_page.dart';

part 'routers.g.dart';

final router = GoRouter(
  initialLocation: '/',
  // debugLogDiagnostics: true,
  routes: $appRoutes,
  errorBuilder: (context, state) => const ErrorPage(),
);

class DetailRoute extends GoRouteData {
  const DetailRoute({
    this.frame,
    required this.tab,
  });
  final bool? frame;
  final String tab;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailPage(tab: tab.tab);
  }
}

@TypedGoRoute<DetailRouteNone>(path: '/detail', routes: [
  TypedGoRoute<DetailRoute>(path: 's/:tab'),
])
class DetailRouteNone extends GoRouteData {
  const DetailRouteNone({this.frame});
  final bool? frame;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DetailPage(tab: TabDetail.none);
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
