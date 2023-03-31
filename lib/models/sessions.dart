import 'package:directus_api_manager/directus_api_manager.dart';

@DirectusCollection()
@CollectionMetadata(endpointName: "session")
class Sessions extends DirectusItem {
  Sessions.newItem() : super.newItem();

  Sessions(Map<String, dynamic> rawReceivedData) : super(rawReceivedData);

  int get idSession => getValue(forKey: "id");
  String get manager => getValue(forKey: "exploitant_session");
  //String get exploitant => getValue(forKey: "exploitant");
  DateTime get startDate => getDateTime(forKey: "start_time");
  DateTime get validationDate => getDateTime(forKey: "validation_time");
  DateTime get endDate => getDateTime(forKey: "end_time");
  int get nbPlayer => getValue(forKey: "nb_player");
  set nbPlayer(int newNbPlayer) => setValue(newNbPlayer, forKey: "nb_player");
}
