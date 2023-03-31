import 'package:vr_web_admin/page/menu.dart';

abstract class RouterGeneral {
  displaySession();
  displayManager();
  logoutCurrentUser();
}

class MenuViewModel extends IMenuViewModel {
  final RouterGeneral router;

  MenuViewModel(this.router);

  @override
  void userTouchedManager() {
    router.displayManager();
  }

  @override
  void userTouchedLogout() {
    router.logoutCurrentUser();
  }

  @override
  void userTouchedSession() {
    router.displaySession();
  }
}
