import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoggedIn = false.obs; // Track if user is logged in
  var username = 'Guest'.obs; // Default username for guest

  void loadUserInfo({bool loggedIn = false, String? name}) {
    isLoggedIn.value = loggedIn;
    username.value = loggedIn && name != null ? name : 'Guest';
  }
}
