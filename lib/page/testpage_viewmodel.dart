import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/page/testpage.dart';

abstract class ITestViewModel {}

abstract class UserHomeRouter {
  //displaySettings();
  //void logoutCurrentUser();
}

class TestPageViewModel extends ITestViewModel {
  final IUseCasesTest _casesTest;

  TestPageViewModel(this._casesTest);
}
