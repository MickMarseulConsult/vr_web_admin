import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:flutter/material.dart';
import 'package:vr_web_admin/generated/l10n.dart';

abstract class IMenuViewModel {
  void userTouchedManager();
  void userTouchedSession(DirectusUser? id);
  void userTouchedLogout();
}

class Menu extends StatelessWidget {
  final IMenuViewModel viewModel;
  const Menu(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: viewModel.userTouchedManager,
              child: Text(S.of(context).pageUsers),
            )),
        // Expanded(
        //     flex: 2,
        //     child: ElevatedButton(
        //       onPressed: viewModel.userTouchedSession,
        //       child: Text(S.of(context).session),
        //     )),
        Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: viewModel.userTouchedLogout,
              child: Text(S.of(context).logout),
            )),
      ],
    );
  }
}
