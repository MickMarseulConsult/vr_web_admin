import 'package:directus_api_manager/directus_api_manager.dart';

@DirectusCollection()
@CollectionMetadata(endpointName: "users_details")
class UsersDetails extends DirectusItem {
  UsersDetails(super.rawReceivedData);

  String get identification => getValue(forKey: "identification");
  //set title(String value) => setValue(value, forKey: "title");
  String get rs => getValue(forKey: "Raison_Sociale");
  bool get autorised => getValue(forKey: "autorised");
  set autorised(bool value) => setValue(value, forKey: "autorised");
  bool get isAdmin => getValue(forKey: "admin");
  DateTime get inscription => getDateTime(forKey: "inscription_date");
  //set album(String value) => setValue(value, forKey: "album");
}
