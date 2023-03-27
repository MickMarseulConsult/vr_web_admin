import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/page/list_explointant.dart';
import 'package:vr_web_admin/models/user_detail.dart';

abstract class IExploitantUseCases {
  Future<String?> getRS(DirectusUser? user);
}

abstract class UserHomeRouter {
  //displaySettings();
  //void logoutCurrentUser();
}

@DirectusCollection()
class ListExploitantViewModel extends IListExploitantViewModel {
  final DirectusUser _user;
  final UserHomeRouter _router;
  final DirectusApiManager _apiManager;
  final IExploitantUseCases _useCases;

  ListExploitantViewModel(
      this._apiManager, this._user, this._router, this._useCases);

  @override
  Future<List<DirectusUser>> getListExploitant() async {
    return List<DirectusUser>.from(await _apiManager.getDirectusUserList());
  }

  @override
  getIdManager() {
    _useCases.getRS(_user);
  }
}
