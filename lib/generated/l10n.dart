// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Managers`
  String get pageUsers {
    return Intl.message(
      'Managers',
      name: 'pageUsers',
      desc: '',
      args: [],
    );
  }

  /// `Sessions`
  String get session {
    return Intl.message(
      'Sessions',
      name: 'session',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get login {
    return Intl.message(
      'Sign in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Start time : `
  String get start_session {
    return Intl.message(
      'Start time : ',
      name: 'start_session',
      desc: '',
      args: [],
    );
  }

  /// `validation time : `
  String get validation_session {
    return Intl.message(
      'validation time : ',
      name: 'validation_session',
      desc: '',
      args: [],
    );
  }

  /// `end time :`
  String get end_session {
    return Intl.message(
      'end time :',
      name: 'end_session',
      desc: '',
      args: [],
    );
  }

  /// `Players numbers : `
  String get nb_player {
    return Intl.message(
      'Players numbers : ',
      name: 'nb_player',
      desc: '',
      args: [],
    );
  }

  /// ` sessions numbers since : `
  String get nb_session {
    return Intl.message(
      ' sessions numbers since : ',
      name: 'nb_session',
      desc: '',
      args: [],
    );
  }

  /// `statistical version`
  String get simple_version {
    return Intl.message(
      'statistical version',
      name: 'simple_version',
      desc: '',
      args: [],
    );
  }

  /// `All sessions`
  String get complete_version {
    return Intl.message(
      'All sessions',
      name: 'complete_version',
      desc: '',
      args: [],
    );
  }

  /// `Number of sessions launched during the period : `
  String get stat_nb_session {
    return Intl.message(
      'Number of sessions launched during the period : ',
      name: 'stat_nb_session',
      desc: '',
      args: [],
    );
  }

  /// `Number of sessions launched and validated during the period : `
  String get stat_nb_validate_session {
    return Intl.message(
      'Number of sessions launched and validated during the period : ',
      name: 'stat_nb_validate_session',
      desc: '',
      args: [],
    );
  }

  /// `Number of players having played a session launched during the period : `
  String get stat_nb_player {
    return Intl.message(
      'Number of players having played a session launched during the period : ',
      name: 'stat_nb_player',
      desc: '',
      args: [],
    );
  }

  /// `Number of players having played a session launched and validated during the period : `
  String get stat_nb_player_validate {
    return Intl.message(
      'Number of players having played a session launched and validated during the period : ',
      name: 'stat_nb_player_validate',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
