import 'package:get/get.dart';

import 'local_storage_data.dart';
import '../viewmodel/auth_view_model.dart';
import '../viewmodel/cart_view_model.dart';
import '../viewmodel/home_view_model.dart';
import '../viewmodel/navbar_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => NavBarViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.put(CartViewModel());
    Get.lazyPut(() => LocalStorageData());
  }
}
