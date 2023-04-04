import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/models/player.dart';
import 'package:vr_web_admin/models/sessions.dart';
import 'package:vr_web_admin/models/user_detail.dart';
import 'package:vr_web_admin/page/listingsession_viewmodel.dart';

class UseCaseListingSession extends DirectusItem
    implements IUseCaseListingSession {
  final DirectusApiManager _apiManager;
  final DirectusUser _directusUser;

  UseCaseListingSession(this._apiManager, this._directusUser) : super.newItem();

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

  // @override
  // Future<String> igetManagerRS() async {
  //   final List<DirectusUser> listUser;
  //   try {
  //     listUser = List<DirectusUser>.from(await _apiManager.getDirectusUserList(
  //         filter: PropertyFilter(
  //             field: "id",
  //             operator: FilterOperator.equals,
  //             value: _directusUser.id)));

  //     return listUser.first.rs;
  //   } catch (exe) {
  //     print(exe);
  //     throw false;
  //   }
  // }

  @override
  Future<String> igetManagerRS() async {
    DirectusUser? _user = await _apiManager.getDirectusUser(_directusUser.id!);
    String _myUser = _user!.getValue(forKey: "raison_sociale");
    return _myUser;
  }

  @override
  Future<List<String>> igetPlayerSession(int id) async {
    //print("Id player : ${id.toString()}");
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
        //print(playerList[i].name);
        playerName.insert(i, playerList[i].name);
      }

      return playerName;
    } catch (exe) {
      print(exe);
      throw false;
    }
  }

  @override
  igetListExploitant() {
    // TODO: implement igetListExploitant
    throw UnimplementedError();
  }

  @override
  Future<int> igetNbSession(String? exploitant) {
    // TODO: implement igetNbSession
    throw UnimplementedError();
  }

  @override
  iupdateSessionById(String manager, bool status) {
    // TODO: implement iupdateSessionById
    throw UnimplementedError();
  }
}
