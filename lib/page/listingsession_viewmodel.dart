//import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/models/sessions.dart';
import 'package:vr_web_admin/page/listing_session.dart';

abstract class IUseCaseListingSession {
  igetAllSessionsById(DateTime startTimeSession, DateTime endTimeSession);
  igetManagerRS();
  igetPlayerSession(int id);
}

abstract class UserHomeRouter {
  //displaySettings();
  //void logoutCurrentUser();
}

class ListingSessionViewModel extends IListingSessionViewModel {
  final IUseCaseListingSession _useCaseListing;
  List<String> myStat = [];
  // String _rs = "";
  // String get rs => _rs;

  ListingSessionViewModel(this._useCaseListing);

  @override
  getAllSessionsById(DateTime startTimeSession, DateTime endTimeSession) {
    return _useCaseListing.igetAllSessionsById(
        startTimeSession, endTimeSession);
  }

  @override
  getManagerRS() {
    // _rs = _useCaseListing.igetManagerRS();
    return _useCaseListing.igetManagerRS();
  }

  @override
  getPlayerSession(int id) {
    return _useCaseListing.igetPlayerSession(id);
  }

  @override
  Future<List<String>> getSessionDetail(
      DateTime startTimeSession, DateTime endTimeSession) async {
    List<Sessions> sessionsToStat =
        await getAllSessionsById(startTimeSession, endTimeSession);

    myStat.insert(0, sessionsToStat.length.toString());

    int nbSessionValided = 0;
    int nbPlayer = 0;
    int nbPlayerValided = 0;
    myStat.insert(1, nbSessionValided.toString());
    myStat.insert(2, nbPlayer.toString());
    myStat.insert(3, nbPlayerValided.toString());
    if (sessionsToStat.isNotEmpty) {
      for (int i = 0; i < sessionsToStat.length; i++) {
        if (sessionsToStat.elementAt(i).validationDate.toString().isNotEmpty) {
          nbSessionValided++;
          nbPlayerValided += sessionsToStat.elementAt(i).nbPlayer;
        }
        nbPlayer += sessionsToStat.elementAt(i).nbPlayer;
      }
      myStat.insert(1, nbSessionValided.toString());
      myStat.insert(2, nbPlayer.toString());
      myStat.insert(3, nbPlayerValided.toString());
    }

    return myStat;
  }
}
