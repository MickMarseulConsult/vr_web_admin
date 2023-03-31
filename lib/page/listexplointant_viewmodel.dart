import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/models/sessions.dart';
import 'package:vr_web_admin/page/list_explointant.dart';
import 'package:vr_web_admin/models/user_detail.dart';

abstract class IExploitantUseCases {
  //Future<List?> getInfo(String? index);
  getListExploitant();
  getNbSession(String? exploitant);
  updateSessionById(String manager, bool status);
}

abstract class UserHomeRouter {
  //displaySettings();
  //void logoutCurrentUser();
}

@DirectusCollection()
class ListExploitantViewModel extends IListExploitantViewModel {
  //final DirectusUser _user;
  //final UserHomeRouter _router;
  //final DirectusApiManager _apiManager;
  final IExploitantUseCases _useCases;
  List<Sessions> listSession = [];
  List<UsersDetails> listManager = [];

  ListExploitantViewModel(
      //this._apiManager, this._user, this._router, this._useCases);
      this._useCases);

  // @override
  // Future<List<DirectusUser>> getListExploitant() async {
  //   return List<DirectusUser>.from(await _apiManager.getDirectusUserList());
  // }

  // @override
  // Future<List?> getInfoById(String index) {
  //   return _useCases.getInfo(index);
  // }

  @override
  Future<List<UsersDetails>> getAllExploitant() {
    return _useCases.getListExploitant();
  }

  int getSession(String idExploitant) {
    return _useCases.getNbSession(idExploitant);
  }

  // @override
  // Future<UsersDetails> updateSession(String manager, bool status) {
  //   return _useCases.updateSessionById(manager, status);
  // }

  @override
  void userTouchedUpdateButton(String idExploitant, bool status) async {
    _useCases.updateSessionById(idExploitant, status);
  }

  // Future<int> getNbSession(String? id) async {
  //   listSession = List<Sessions>.from(
  //       await _apiManager.findListOfItems<Sessions>(
  //           filter: PropertyFilter(
  //               field: "exploitant_session",
  //               operator: FilterOperator.equals,
  //               value: id)));
  //   return listSession.length;
  // }
}
