//import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/page/listing_session.dart';

abstract class IUseCaseListingSession {
  igetAllSessionsById();
  igetManagerRS();
  igetPlayerSession(int id);
}

abstract class UserHomeRouter {
  //displaySettings();
  //void logoutCurrentUser();
}

class ListingSessionViewModel extends IListingSessionViewModel {
  final IUseCaseListingSession _useCaseListing;
  String rs = "";

  ListingSessionViewModel(this._useCaseListing);

  @override
  getAllSessionsById() {
    return _useCaseListing.igetAllSessionsById();
  }

  @override
  getManagerRS() {
    return _useCaseListing.igetManagerRS();
  }

  @override
  getPlayerSession(int id) {
    return _useCaseListing.igetPlayerSession(id);
  }
}
