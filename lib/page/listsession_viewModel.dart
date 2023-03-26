import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/page/list_session.dart';
import 'package:vr_web_admin/models/sessions.dart';

class ListSessionViewModel extends IListSessionViewModel {
  final DirectusUser? _user;
  final DirectusApiManager? _apiManager;

  ListSessionViewModel(this._user, this._apiManager);

  @override
  Future<List<Sessions>> getAllSessions() async {
    final list = await _apiManager!.findListOfItems<Sessions>();
    for (final item in list) {
      print("${item.mamager} - ${item.nbPlayer}");
    }
    return list.toList();
  }
}
