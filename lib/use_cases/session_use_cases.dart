import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/models/player.dart';
import 'package:vr_web_admin/models/sessions.dart';
import 'package:vr_web_admin/page/listsession_viewmodel.dart';
import 'package:vr_web_admin/models/user_detail.dart';

class SessionUseCases extends DirectusItem implements ISessionUseCases {
  final DirectusApiManager _apiManager;
  List<UsersDetails> listManager = [];
  List<Sessions> listSession = [];
  List<dynamic> params = [];
  final DirectusUser _directusUser;

  SessionUseCases(this._apiManager, this._directusUser) : super.newItem();

  @override
  Future<List<Sessions>> igetAllSessionsById() async {
    final List<Sessions> listById;
    try {
      // listById =
      //     List<Sessions>.from(await _apiManager!.findListOfItems<Sessions>());
      // final Iterable<Sessions> filteredID =
      //     listById.where((listById) => listById.manager == _user!.id);

      listById = List<Sessions>.from(
          await _apiManager.findListOfItems<Sessions>(
              filter: PropertyFilter(
                  field: "exploitant_session",
                  operator: FilterOperator.equals,
                  value: _directusUser.id)));

      return listById.toList();
    } catch (exe) {
      print(exe);
      throw false;
    }
  }

  @override
  Future<String> igetManagerRS() async {
    final List<UsersDetails> listUser;
    try {
      listUser = List<UsersDetails>.from(await _apiManager.getDirectusUserList(
          filter: PropertyFilter(
              field: "id",
              operator: FilterOperator.equals,
              value: _directusUser.id)));

      // listUser = List<UsersDetails>.from(
      //     await _apiManager.findListOfItems<UsersDetails>(
      //         filter: PropertyFilter(
      //             field: "identification",
      //             operator: FilterOperator.equals,
      //             value: _directusUser.id)));

      return listUser.first.rs;
    } catch (exe) {
      print(exe);
      throw false;
    }
  }

  @override
  Future<List<String>> igetPlayerSession(int id) async {
    print("Id player : ${id.toString()}");
    List<Players> playerList = [];
    try {
      playerList = List<Players>.from(await _apiManager!
          .findListOfItems<Players>(
              filter: PropertyFilter(
                  field: "session",
                  operator: FilterOperator.equals,
                  value: id)));

      List<String> playerName = [];
      for (int i = 0; i < playerList.length; i++) {
        print(playerList[i].name);
        playerName.insert(i, playerList[i].name);
      }

      return playerName;
    } catch (exe) {
      print(exe);
      throw false;
    }
  }
}
