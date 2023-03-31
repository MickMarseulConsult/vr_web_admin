import 'package:directus_api_manager/directus_api_manager.dart';

@DirectusCollection()
@CollectionMetadata(endpointName: "players")
class Players extends DirectusItem {
  Players(super.rawReceivedData);

  int get sessionID => getValue(forKey: "session");
  String get name => getValue(forKey: "name");
}
