import 'package:flutter/material.dart';
import 'package:vr_web_admin/page/listsession_viewModel.dart';
import 'package:vr_web_admin/page/menu_viewmodel.dart';
//import 'package:flutter_avance/data/controllers/remote_data_manager.dart';
//import 'package:flutter_avance/data/model/user.dart';
import 'package:vr_web_admin/use_cases/login_use_cases.dart';
import 'package:vr_web_admin/use_cases/exploitant_use_cases.dart';
import 'package:vr_web_admin/navigation/navigation_path.dart';
import 'package:vr_web_admin/page/login_screen.dart';
import 'package:vr_web_admin/page/login_viewmodel.dart';
import 'package:vr_web_admin/page/list_session.dart';
import 'package:vr_web_admin/page/list_explointant.dart';
import 'package:vr_web_admin/page/listexplointant_viewmodel.dart';
import 'package:vr_web_admin/page/menu.dart';
import 'package:vr_web_admin/page/menu_viewmodel.dart';
//import 'package:vr_web_admin/page/widgets/line_exploitant_viewmodel.dart';
//import 'package:vr_web_admin/models/users.dart';
//import 'package:blindtest_manager_web/ui/screens/settings_screen.dart';

import 'package:directus_api_manager/directus_api_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart';

class NavigationDelegate extends RouterDelegate<NavigationPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationPath>
    implements LoginRouter, RouterGeneral {
  //final RemoteDataManager _remoteDataManager = RemoteDataManager();
  DirectusUser? _currentUser;
  String? get currentUserID => _currentUser!.id;
  //final menuViewModel = IMenuViewModel;
  //final routerGeneral = RouterGeneral;
  bool _displaySettings = false;
  bool _idAdmin = false;
  bool _displayManager = false;
  bool _displaySession = false;

  final DirectusApiManager _apiManager = DirectusApiManager(
      baseURL: "http://127.0.0.1:8055", httpClient: Client());

  @override
  Widget build(BuildContext context) {
    final List<Page<dynamic>> pagesList = [];
    final DirectusUser? user = _currentUser;
    if (user == null) {
      final loginScreen =
          LoginScreen(LoginViewModel(LoginUseCases(_apiManager), this));
      pagesList.add(MaterialPage(child: loginScreen));
    } else {
      if (_idAdmin == false) {
        final listSessionPage = ListSession(
            ListSessionViewModel(_currentUser, _apiManager),
            MenuViewModel(this),
            this);
        pagesList.add(MaterialPage(child: listSessionPage));
      } else {
        final listExploitantPage = ListExploitant(
            ListExploitantViewModel(ExploitantUseCases(_apiManager)),
            MenuViewModel(this),
            this);
        pagesList.add(MaterialPage(child: listExploitantPage));
      }
    }

    return Navigator(
      pages: pagesList,
      onPopPage: (route, result) {
        if (route.didPop(result) == false) {
          return false;
        }
        return onBackButtonTouched(result);
      },
    );
  }

  bool onBackButtonTouched(dynamic result) {
    if (_displaySettings) {
      _displaySettings = false;
    }
    notifyListeners();
    return true;
  }

  @override
  NavigationPath? get currentConfiguration =>
      NavigationPath(userId: _currentUser?.id);

  @override
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(NavigationPath configuration) async {
    final userId = configuration.userId;
    if (userId != null && _currentUser == null) {
      final currentUser = await _apiManager.currentDirectusUser();
      if (currentUser != null && currentUser.id == configuration.userId) {
        _currentUser = currentUser;
      }
    }
  }

  @override
  logoutCurrentUser() {
    _currentUser = null;
    notifyListeners();
  }

  @override
  void displayUser(DirectusUser user) {
    _currentUser = user;
    if (_currentUser!.description == "admin") {
      _idAdmin = true;
    }
    notifyListeners();
  }

  @override
  displayManager() {
    _displayManager = true;
  }

  @override
  displaySession() {
    _displaySession = true;
  }
}
