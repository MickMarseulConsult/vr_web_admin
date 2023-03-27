import 'package:flutter/material.dart';
import 'package:vr_web_admin/models/sessions.dart';
import 'package:intl/intl.dart';

class LineSession extends StatelessWidget {
  final List<Sessions> sessionList;
  final int id;
  final Future<String> managerFuture;
  const LineSession(this.sessionList, this.id, this.managerFuture, {super.key});

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
            child: Text(sessionList.elementAt(id).startDate.toString()),
          ),
          Expanded(
            flex: 3,
            child: Text(sessionList.elementAt(id).validationDate.toString()),
          ),
          Expanded(
            flex: 3,
            child: Text(sessionList.elementAt(id).endDate.toString()),
          ),
          Expanded(
            flex: 1,
            child: Text(sessionList.elementAt(id).nbPlayer.toString()),
          ),
        ],
      ),
    );
  }
}
