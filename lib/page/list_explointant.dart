import 'package:flutter/material.dart';
import 'package:vr_web_admin/generated/l10n.dart';
//import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/models/user_detail.dart';
import 'package:vr_web_admin/page/widgets/line_exploitant.dart';
import 'package:vr_web_admin/page/menu.dart';
import 'package:vr_web_admin/page/menu_viewmodel.dart';
//import 'package:vr_web_admin/page/widgets/line_exploitant_viewmodel.dart';

abstract class IListExploitantViewModel extends ChangeNotifier {
  //String get email;
  getAllExploitant();
  //getInfoById(String index);
  getSession(String idExploitant);
  //final DirectusApiManager apiManager;
  //updateSession(String manager, bool status);

  void userTouchedUpdateButton(String idExploitant, bool status);
  //void userTouchedLogoutButton();
}

class ListExploitant extends StatefulWidget {
  final IListExploitantViewModel viewModel;
  final IMenuViewModel menuViewModel;
  final RouterGeneral routerGeneral;
  //final ILineExploitantViewModel lineViewModel;
  const ListExploitant(this.viewModel, this.menuViewModel, this.routerGeneral,
      {super.key});

  @override
  State<ListExploitant> createState() => _ListExploitantState();
}

class _ListExploitantState extends State<ListExploitant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).pageUsers)),
      body: Column(
        children: [
          Menu(widget.menuViewModel),
          SizedBox(
              width: double.infinity,
              height: 500,
              child: FutureBuilder<List<UsersDetails>>(
                  future: widget.viewModel.getAllExploitant(),
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
                          return LineExploitant(
                            snapshot.data!,
                            index,
                            widget.viewModel.getSession(
                              snapshot.data!.elementAt(index).id!,
                            ),
                            widget.viewModel.userTouchedUpdateButton,
                          );
                        },
                      ));
                    }
                  })),
        ],
      ),
    );
  }
}
