//import 'package:vr_web_admin/models/users.dart';
//import 'package:vr_web_admin/models/user_detail.dart';
import 'package:vr_web_admin/page/login_viewmodel.dart';
import 'package:directus_api_manager/directus_api_manager.dart';
//import 'package:http/http.dart';

class LoginUseCases implements ILoginUseCases {
  final DirectusApiManager _apiManager;
  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;

  LoginUseCases(this._apiManager);

  Future<DirectusUser?> restoreExistingUser() {
    return Future.value(null);
  }

  //Future<DirectusUser?> currentDirectusUser({String fields = "*"})

  @override
  Future<DirectusUser?> checkUserCredentials(
      String username, String password) async {
    final DirectusUser? connectedUser;
    final DirectusLoginResult loginResult =
        await _apiManager.loginDirectusUser(username, password);

    if (loginResult.type == DirectusLoginResultType.success) {
      connectedUser = await _apiManager.currentDirectusUser();
      if (connectedUser != null) {
        if (connectedUser.getValue(forKey: "is_admin") == true) {
          _isAdmin = true;
        }
        // final UsersDetails _userDetail =
        //     UsersDetails(connectedUser.getRawData());
      }

      //final user = User(connectedUser.toMap());
      return connectedUser;
    } else {
      return null;
    }
  }
}
