// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "complete_version":
            MessageLookupByLibrary.simpleMessage("All sessions"),
        "end_session": MessageLookupByLibrary.simpleMessage("end time :"),
        "login": MessageLookupByLibrary.simpleMessage("Sign in"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "nb_player": MessageLookupByLibrary.simpleMessage("Players numbers : "),
        "nb_session":
            MessageLookupByLibrary.simpleMessage(" sessions numbers since : "),
        "pageUsers": MessageLookupByLibrary.simpleMessage("Managers"),
        "session": MessageLookupByLibrary.simpleMessage("Sessions"),
        "simple_version":
            MessageLookupByLibrary.simpleMessage("statistical version"),
        "start_session": MessageLookupByLibrary.simpleMessage("Start time : "),
        "stat_nb_player": MessageLookupByLibrary.simpleMessage(
            "Number of players having played a session launched during the period : "),
        "stat_nb_player_validate": MessageLookupByLibrary.simpleMessage(
            "Number of players having played a session launched and validated during the period : "),
        "stat_nb_session": MessageLookupByLibrary.simpleMessage(
            "Number of sessions launched during the period : "),
        "stat_nb_validate_session": MessageLookupByLibrary.simpleMessage(
            "Number of sessions launched and validated during the period : "),
        "validation_session":
            MessageLookupByLibrary.simpleMessage("validation time : ")
      };
}
