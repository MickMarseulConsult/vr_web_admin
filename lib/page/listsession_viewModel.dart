import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/page/list_session.dart';
import 'package:vr_web_admin/models/sessions.dart';
import 'package:vr_web_admin/models/user_detail.dart';

class ListSessionViewModel extends IListSessionViewModel {
  final DirectusUser? _user;
  final DirectusApiManager? _apiManager;

  ListSessionViewModel(this._user, this._apiManager);

  @override
  Future<List<Sessions>> getAllSessions() async {
    final List<Sessions> listById;
    try {
      listById =
          List<Sessions>.from(await _apiManager!.findListOfItems<Sessions>());
      final Iterable<Sessions> filteredID =
          listById.where((listById) => listById.manager == _user!.id);
      return filteredID.toList();
    } catch (exe) {
      print(exe);
      throw false;
    }
  }

  @override
  Future<String> getManagerRS() async {
    final List<UsersDetails> listUser;
    try {
      listUser = List<UsersDetails>.from(
          await _apiManager!.findListOfItems<UsersDetails>());
      final Iterable<UsersDetails> filteredID =
          listUser.where((listUser) => listUser.identification == _user!.id);
      return filteredID.first.rs;
    } catch (exe) {
      print(exe);
      throw false;
    }
  }
}
