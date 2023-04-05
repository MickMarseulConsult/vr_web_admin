// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "complete_version":
            MessageLookupByLibrary.simpleMessage("Toutes les sessions"),
        "end_session": MessageLookupByLibrary.simpleMessage("Heure de fin :"),
        "login": MessageLookupByLibrary.simpleMessage("Identification"),
        "logout": MessageLookupByLibrary.simpleMessage("Déconnexion"),
        "nb_player": MessageLookupByLibrary.simpleMessage("Nb de joueurs : "),
        "nb_session":
            MessageLookupByLibrary.simpleMessage(" session depuis le : "),
        "pageUsers": MessageLookupByLibrary.simpleMessage("Exploitants"),
        "session": MessageLookupByLibrary.simpleMessage("Sessions"),
        "simple_version": MessageLookupByLibrary.simpleMessage("Statistiques"),
        "start_session":
            MessageLookupByLibrary.simpleMessage("Heure de départ : "),
        "stat_nb_player": MessageLookupByLibrary.simpleMessage(
            "Nombre de joueurs ayant effectué une session lancée pendant la période : "),
        "stat_nb_player_validate": MessageLookupByLibrary.simpleMessage(
            "Nombre de joueurs ayant effectué une session lancée et validée pendant la période : "),
        "stat_nb_session": MessageLookupByLibrary.simpleMessage(
            "Nombre de sessions lancées pendant la période : "),
        "stat_nb_validate_session": MessageLookupByLibrary.simpleMessage(
            "Nombre de sessions lancées et validées pendant la période : "),
        "validation_session":
            MessageLookupByLibrary.simpleMessage("Heure de validation : ")
      };
}
