import 'package:directus_api_manager/directus_api_manager.dart';

@DirectusCollection()
@CollectionMetadata(endpointName: "users_details")
class UsersDetails extends DirectusItem {
  UsersDetails(super.rawReceivedData);

  // TODO: implement endpointName
  //String get endpointName => 'users_details';

  String get identification => getValue(forKey: "identification");
  //set title(String value) => setValue(value, forKey: "title");
  String get rs => getValue(forKey: "Raison_Sociale");
  bool get autorised => getValue(forKey: "autorised");
  DateTime get inscription => getDateTime(forKey: "inscription_date");
  //set album(String value) => setValue(value, forKey: "album");
}
