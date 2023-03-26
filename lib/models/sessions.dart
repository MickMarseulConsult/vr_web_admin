import 'package:directus_api_manager/directus_api_manager.dart';

@DirectusCollection()
@CollectionMetadata(endpointName: "session")
class Sessions extends DirectusItem {
  Sessions.newItem() : super.newItem();

  Sessions(Map<String, dynamic> rawReceivedData) : super(rawReceivedData);

  String get mamager => getValue(forKey: "idManager");
  int? get nbPlayer => getValue(forKey: "nb_player");
  set nbPlayer(int? newNbPlayer) => setValue(newNbPlayer, forKey: "nb_player");
}
