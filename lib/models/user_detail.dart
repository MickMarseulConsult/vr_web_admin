import 'package:directus_api_manager/directus_api_manager.dart';

//@DirectusCollection()
//@CollectionMetadata(endpointName: "users_details")
class UsersDetails extends DirectusUser {
  //class UsersDetails extends DirectusUsers { // retirer line 3 et 4
  UsersDetails(super.rawReceivedData);

  String get rs => getValue(forKey: "raison_sociale");
  bool get autorised => getValue(forKey: "is_autorised");
  set autorised(bool value) => setValue(value, forKey: "is_autorised");
  bool get isAdmin => getValue(forKey: "is_admin");
  DateTime get inscription => getDateTime(forKey: "date_inscription");

  @override
  String get email => getValue(forKey: "email");
  @override
  set email(String value) => setValue(value, forKey: "email");

  @override
  set password(String value) => setValue(value, forKey: "password");

  @override
  String? get firstname => getValue(forKey: "first_name");
  @override
  set firstname(String? value) => setValue(value, forKey: "first_name");

  @override
  String? get lastname => getValue(forKey: "last_name");
  @override
  set lastname(String? value) => setValue(value, forKey: "last_name");

  @override
  String? get description => getValue(forKey: "description");
  @override
  set description(String? value) => setValue(value, forKey: "description");

  @override
  String? get roleUUID => getValue(forKey: "role");
  @override
  set roleUUID(String? value) => setValue(value, forKey: "role");

  @override
  String? get avatar => getValue(forKey: "avatar");
  @override
  set avatar(String? value) => setValue(value, forKey: "avatar");
}
