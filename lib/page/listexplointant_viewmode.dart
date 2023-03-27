import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/page/list_explointant.dart';
import 'package:vr_web_admin/models/user_detail.dart';

abstract class IExploitantUseCases {
  Future<List?> getInfo(String? index);
  getListExploitant();
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

  // @override
  // Future<List<DirectusUser>> getListExploitant() async {
  //   return List<DirectusUser>.from(await _apiManager.getDirectusUserList());
  // }

  @override
  Future<List?> getInfoById(String index) {
    print(index);
    return _useCases.getInfo(index);
  }

  @override
  Future<List<DirectusUser>> getAllExploitant() {
    return _useCases.getListExploitant();
  }
}
