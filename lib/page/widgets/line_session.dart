import 'package:flutter/material.dart';
//import 'package:vr_web_admin/models/player.dart';
import 'package:vr_web_admin/models/sessions.dart';
import 'package:intl/intl.dart';
import 'package:vr_web_admin/generated/l10n.dart';

class LineSession extends StatelessWidget {
  final List<Sessions> sessionList;
  final int id;
  final Future<String> managerFuture;
  final Future<List<String>> playerList;
  const LineSession(
      this.sessionList, this.id, this.managerFuture, this.playerList,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(sessionList.elementAt(id).id.toString()),
          ),
          Expanded(
              flex: 4,
              child: FutureBuilder<String>(
                  future: managerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })),
          Expanded(
            flex: 3,
            child: Text(
                '${S.of(context).start_session} ${sessionList.elementAt(id).startDate.toString()}'),
          ),
          Expanded(
            flex: 3,
            child: Text(
                '${S.of(context).validation_session} ${sessionList.elementAt(id).validationDate.toString()}'),
          ),
          Expanded(
            flex: 3,
            child: Text(
                '${S.of(context).end_session} ${sessionList.elementAt(id).endDate.toString()}'),
          ),
          Expanded(
            flex: 1,
            child: Text(
                '${S.of(context).nb_player} ${sessionList.elementAt(id).nbPlayer.toString()}'),
          ),
          Expanded(
              flex: 2,
              child: FutureBuilder<List<String>>(
                  future: playerList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      return Center(
                          child: ListView.builder(
                              itemCount: data!.length,
                              itemBuilder: (context, index) {
                                return Text(data.first);
                              }));
                    } else if (snapshot.hasError) {
                      return Text('Error name: ${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }))
        ],
      ),
    );
  }
}
