import 'package:flutter/material.dart';
import 'package:vr_web_admin/models/sessions.dart';
//import 'package:vr_web_admin/page/listingsession_viewmodel.dart';
import 'package:vr_web_admin/generated/l10n.dart';
import 'package:vr_web_admin/page/menu.dart';
import 'package:vr_web_admin/page/menu_viewmodel.dart';
import 'package:vr_web_admin/page/widgets/line_session.dart';

abstract class IListingSessionViewModel {
  getAllSessionsById(DateTime startTimeSession, DateTime endTimeSession);
  getManagerRS();
  getPlayerSession(int id);
}

class ListingSession extends StatefulWidget {
  final IListingSessionViewModel _viewmodel;
  final IMenuViewModel menuViewModel;
  final RouterGeneral routerGeneral;

  const ListingSession(this._viewmodel, this.menuViewModel, this.routerGeneral,
      {super.key, this.restorationId});

  final String? restorationId;

  @override
  State<ListingSession> createState() => _ListingSessionState();
}

class _ListingSessionState extends State<ListingSession> with RestorationMixin {
  bool _stateSession = false;
  DateTime newDate = DateTime.now();

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  // @override
  // void initState() {
  //   super.initState();
  //   var date = DateTime.now();
  //   newDate = DateTime(date.year, date.month - 1, date.day);
  //   print(newDate);
  //   // set initial value of _active to autorised
  //   //_active = widget.usersList.elementAt(widget.id).autorised;
  // }

  @override
  String? get restorationId => widget.restorationId;
  DateTime endingDate = DateTime.now();
  DateTime startingDate = DateTime(
      DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);

  final RestorableDateTimeN _startDate = RestorableDateTimeN(DateTime(2023));
  final RestorableDateTimeN _endDate = RestorableDateTimeN(DateTime.now());
  late final RestorableRouteFuture<DateTimeRange?>
      _restorableDateRangePickerRouteFuture =
      RestorableRouteFuture<DateTimeRange?>(
    onComplete: _selectDateRange,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator
          .restorablePush(_dateRangePickerRoute, arguments: <String, dynamic>{
        'initialStartDate': _startDate.value?.millisecondsSinceEpoch,
        'initialEndDate': _endDate.value?.millisecondsSinceEpoch,
      });
    },
  );

  void _selectDateRange(DateTimeRange? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _startDate.value = newSelectedDate.start;
        _endDate.value = newSelectedDate.end;
        startingDate = newSelectedDate.start;
        endingDate = newSelectedDate.end;
        //print("range : ${_startDate.value} - ${_endDate.value}");
      });
    }
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_startDate, 'start_date');
    registerForRestoration(_endDate, 'end_date');
    registerForRestoration(
        _restorableDateRangePickerRouteFuture, 'date_picker_route_future');
  }

  static Route<DateTimeRange?> _dateRangePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTimeRange?>(
      context: context,
      builder: (BuildContext context) {
        return DateRangePickerDialog(
          restorationId: 'date_picker_dialog',
          initialDateRange:
              _initialDateTimeRange(arguments! as Map<dynamic, dynamic>),
          firstDate: DateTime(2023),
          currentDate: DateTime.now(),
          lastDate: DateTime.parse(DateTime.now().toString()),
        );
      },
    );
  }

  static DateTimeRange? _initialDateTimeRange(Map<dynamic, dynamic> arguments) {
    if (arguments['initialStartDate'] != null &&
        arguments['initialEndDate'] != null) {
      return DateTimeRange(
        start: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialStartDate'] as int),
        end: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialEndDate'] as int),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).session)),
      body: Column(
        children: [
          Menu(widget.menuViewModel),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(S.of(context).simple_version),
            Switch(
              //thumbIcon: thumbIcon,
              value: _stateSession,
              onChanged: (bool value) {
                setState(() {
                  _stateSession = value;
                });
              },
            ),
            Text(S.of(context).complete_version),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  _restorableDateRangePickerRouteFuture.present();
                },
                child: Text(S.of(context).datepicker),
              ),
            ),
          ]),
          _stateSession
              ? SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: FutureBuilder<List<Sessions>>(
                      future: widget._viewmodel
                          .getAllSessionsById(startingDate, endingDate),
                      initialData: const [],
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text('An error has occurred!'),
                          );
                        } else {
                          final data = snapshot.data;
                          return Center(
                              child: ListView.builder(
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              return LineSession(
                                  data,
                                  index,
                                  widget._viewmodel.getManagerRS(),
                                  widget._viewmodel.getPlayerSession(
                                      data.elementAt(index).idSession));
                            },
                          ));
                        }
                      }))
              : SizedBox(
                  width: 800,
                  height: 300,
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).stat_nb_session),
                          Text(S.of(context).stat_nb_validate_session),
                          Text(S.of(context).stat_nb_player),
                          Text(S.of(context).stat_nb_player_validate),
                        ],
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
