import 'package:get/get.dart';
import 'package:notesapp/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetXTheme extends GetxController {
  RxBool isLightMode = true.obs;

  changeTheme() async {
    isLightMode.value = !isLightMode.value;
    Get.changeTheme(isLightMode.value ? Themes.lightTheme : Themes.darkTheme);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("Theme", isLightMode.value);
  }
}
