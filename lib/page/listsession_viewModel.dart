//import 'package:vr_web_admin/models/player.dart';
import 'package:directus_api_manager/directus_api_manager.dart';
//import 'package:vr_web_admin/models/sessions.dart';
//import 'package:vr_web_admin/models/sessions.dart';
//import 'package:vr_web_admin/models/user_detail.dart';
import 'package:vr_web_admin/page/list_session.dart';
//import 'package:vr_web_admin/page/listsession_viewmodel.dart';

abstract class ISessionUseCases {
  igetAllSessionsById();
  igetManagerRS();
  igetPlayerSession(int id);
}

abstract class UserHomeRouter {
  //displaySettings();
  //void logoutCurrentUser();
}

@DirectusCollection()
class ListSessionViewModel extends IListSessionViewModel {
  //final DirectusUser? _user;
  //final DirectusApiManager? _apiManager;
  //List<Sessions> listSession = [];
  //List<DirectusUser> listManager = [];
  final ISessionUseCases _useCasesSession;

  ListSessionViewModel(this._useCasesSession);

  @override
  igetAllSessionsById() {
    // TODO: implement igetAllSessionsById
    throw UnimplementedError();
  }

  @override
  igetManagerRS() {
    // TODO: implement igetManagerRS
    throw UnimplementedError();
  }

  @override
  igetPlayerSession(int id) {
    // TODO: implement igetPlayerSession
    throw UnimplementedError();
  }

  @override
  getAllSessionsById() {
    // TODO: implement getAllSessionsById
    throw UnimplementedError();
  }

  @override
  getManagerRS() {
    // TODO: implement getManagerRS
    throw UnimplementedError();
  }

  @override
  getPlayerSession(int id) {
    // TODO: implement getPlayerSession
    throw UnimplementedError();
  }

  // @override
  // Future<List<Sessions>> getAllSessionsById() async {
  //   final List<Sessions> listById;
  //   try {
  //     // listById =
  //     //     List<Sessions>.from(await _apiManager!.findListOfItems<Sessions>());
  //     // final Iterable<Sessions> filteredID =
  //     //     listById.where((listById) => listById.manager == _user!.id);

  //     listById = List<Sessions>.from(await _apiManager!
  //         .findListOfItems<Sessions>(
  //             filter: PropertyFilter(
  //                 field: "exploitant_session",
  //                 operator: FilterOperator.equals,
  //                 value: _user!.id)));

  //     return listById.toList();
  //   } catch (exe) {
  //     print(exe);
  //     throw false;
  //   }
  // }

  // @override
  // Future<String> getManagerRS() async {
  //   final List<UsersDetails> listUser;
  //   try {
  //     // listUser = List<UsersDetails>.from(
  //     //     await _apiManager!.findListOfItems<UsersDetails>());
  //     // final Iterable<UsersDetails> filteredID =
  //     //     listUser.where((listUser) => listUser.identification == _user!.id);

  //     listUser = List<UsersDetails>.from(await _apiManager!
  //         .findListOfItems<UsersDetails>(
  //             filter: PropertyFilter(
  //                 field: "identification",
  //                 operator: FilterOperator.equals,
  //                 value: _user!.id)));

  //     return listUser.first.rs;
  //   } catch (exe) {
  //     print(exe);
  //     throw false;
  //   }
  // }

  // @override
  // Future<List<String>> getPlayerSession(int id) async {
  //   print("Id player : ${id.toString()}");
  //   List<Players> playerList = [];
  //   try {
  //     playerList = List<Players>.from(await _apiManager!
  //         .findListOfItems<Players>(
  //             filter: PropertyFilter(
  //                 field: "session",
  //                 operator: FilterOperator.equals,
  //                 value: id)));

  //     List<String> playerName = [];
  //     for (int i = 0; i < playerList.length; i++) {
  //       print(playerList[i].name);
  //       playerName.insert(i, playerList[i].name);
  //     }

  //     return playerName;
  //   } catch (exe) {
  //     print(exe);
  //     throw false;
  //   }
  // }
}
