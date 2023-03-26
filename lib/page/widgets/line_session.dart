import 'package:flutter/material.dart';
import 'package:vr_web_admin/models/sessions.dart';

class LineSession extends StatelessWidget {
  final List<Sessions> sessionList;
  final int id;
  const LineSession(this.sessionList, this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(sessionList.elementAt(id).mamager),
          ),
          Expanded(
            flex: 2,
            child: Text(sessionList.elementAt(id).nbPlayer.toString()),
          ),
        ],
      ),
    );
  }
}
