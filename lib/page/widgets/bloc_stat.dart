import 'package:flutter/material.dart';
import 'package:vr_web_admin/generated/l10n.dart';

class BLocStat extends StatelessWidget {
  final Future<List<String>> getSession;
  const BLocStat({super.key, required this.getSession});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 800,
        height: 300,
        child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder<List<String>>(
                  future: getSession,
                  initialData: const [],
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('An error has occurred!'),
                      );
                    } else if (snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('An error has occurred!'));
                    } else {
                      final data = snapshot.data!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${S.of(context).stat_nb_session} ${data.elementAt(0)}"),
                          Text(
                              "${S.of(context).stat_nb_validate_session} ${data.elementAt(1)}"),
                          Text(
                              "${S.of(context).stat_nb_player} ${data.elementAt(2)}"),
                          Text(
                              "${S.of(context).stat_nb_player_validate} ${data.elementAt(3)} "),
                        ],
                      );
                    }
                  }),
            )));
  }
}
