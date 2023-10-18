// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routers.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $detailRoute,
      $rootRoute,
    ];

RouteBase get $detailRoute => GoRouteData.$route(
      path: '/detail',
      factory: $DetailRouteExtension._fromState,
    );

extension $DetailRouteExtension on DetailRoute {
  static DetailRoute _fromState(GoRouterState state) => DetailRoute(
        frame: _$convertMapValue(
            'frame', state.uri.queryParameters, _$boolConverter),
      );

  String get location => GoRouteData.$location(
        '/detail',
        queryParams: {
          if (frame != null) 'frame': frame!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $rootRoute => GoRouteData.$route(
      path: '/',
      factory: $RootRouteExtension._fromState,
    );

extension $RootRouteExtension on RootRoute {
  static RootRoute _fromState(GoRouterState state) => RootRoute(
        frame: _$convertMapValue(
            'frame', state.uri.queryParameters, _$boolConverter),
      );

  String get location => GoRouteData.$location(
        '/',
        queryParams: {
          if (frame != null) 'frame': frame!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
