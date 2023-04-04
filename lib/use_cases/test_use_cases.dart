import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:vr_web_admin/page/testpage.dart';
import 'package:vr_web_admin/page/testpage_viewmodel.dart';

class TestUseCases extends DirectusItem implements IUseCasesTest {
  final DirectusApiManager _apiManager;
  //final DirectusUser _directusUser;

  TestUseCases(this._apiManager) : super.newItem();
}
