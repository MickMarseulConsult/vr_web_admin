import 'package:flutter/material.dart';
import 'package:vr_web_admin/models/sessions.dart';
import 'package:vr_web_admin/page/widgets/line_session.dart';
import 'package:vr_web_admin/generated/l10n.dart';
import 'package:vr_web_admin/page/menu.dart';
import 'package:vr_web_admin/page/menu_viewmodel.dart';

abstract class IListSessionViewModel {
  getAllSessionsById();
  getManagerRS();
  getPlayerSession(int id);
}

class ListSession extends StatelessWidget {
  final IListSessionViewModel _viewModel;
  final IMenuViewModel menuViewModel;
  final RouterGeneral routerGeneral;
  const ListSession(this._viewModel, this.menuViewModel, this.routerGeneral,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).session)),
      body: Column(
        children: [
          Menu(menuViewModel),
          SizedBox(
              width: double.infinity,
              height: 500,
              child: FutureBuilder<List<Sessions>>(
                  future: _viewModel.getAllSessionsById(),
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
                              _viewModel.getManagerRS(),
                              _viewModel.getPlayerSession(
                                  data.elementAt(index).idSession));
                        },
                      ));
                    }
                  })),
        ],
      ),
    );
  }
}
