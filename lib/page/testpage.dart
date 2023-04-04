import 'package:flutter/material.dart';
import 'package:vr_web_admin/page/testpage_viewmodel.dart';

abstract class IUseCasesTest {}

class TestPage extends StatelessWidget {
  final ITestViewModel _viewModel;
  const TestPage(this._viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text("n'importe quoi"),
        ],
      ),
    );
  }
}
