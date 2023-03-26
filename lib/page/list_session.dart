import 'package:flutter/material.dart';
import 'package:vr_web_admin/models/sessions.dart';
import 'package:vr_web_admin/page/widgets/line_session.dart';
import '../generated/l10n.dart';

abstract class IListSessionViewModel {
  getAllSessions();
}

class ListSession extends StatelessWidget {
  final IListSessionViewModel _viewModel;
  const ListSession(this._viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).session)),
      body: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 500,
              child: FutureBuilder<List<Sessions>>(
                  future: _viewModel.getAllSessions(),
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
                          return LineSession(data, index);
                        },
                      ));
                    }
                  })),
        ],
      ),
    );
  }
}
