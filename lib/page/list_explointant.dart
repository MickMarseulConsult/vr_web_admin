import 'package:flutter/material.dart';
import 'package:vr_web_admin/generated/l10n.dart';
import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/page/widgets/line_exploitant.dart';
//import 'package:vr_web_admin/page/widgets/line_exploitant_viewmodel.dart';

abstract class IListExploitantViewModel {
  //String get email;
  getAllExploitant();
  getInfoById(String index);

  //void userTouchedSettingsButton();
  //void userTouchedLogoutButton();
}

class ListExploitant extends StatelessWidget {
  final IListExploitantViewModel viewModel;
  //final ILineExploitantViewModel lineViewModel;
  const ListExploitant(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).pageUsers)),
      body: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 500,
              child: FutureBuilder<List<DirectusUser>>(
                  future: viewModel.getAllExploitant(),
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
                              viewModel.getInfoById(
                                  snapshot.data![index].id.toString()));
                        },
                      ));
                    }
                  })),
        ],
      ),
    );
  }
}
