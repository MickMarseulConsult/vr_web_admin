import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:flutter/material.dart';
import 'package:vr_web_admin/navigation/navigation_path.dart';

class NavigationRouteParser extends RouteInformationParser<NavigationPath> {
  @override
  Future<NavigationPath> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? "/");
    // /users/23 /
    final String? userId;
    //final String? _directusUser;
    if (uri.pathSegments.length >= 2) {
      userId = uri.pathSegments[1];
      //_directusUser = uri.pathSegments[1];
    } else {
      userId = null;
    }
    return Future.value(NavigationPath(userId: userId));
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationPath configuration) {
    String location = "/";
    final userId = configuration.userId;
    if (userId != null) {
      location = "${location}user/$userId";
    }
    return RouteInformation(location: location);
  }
}
