import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../helper/local_storage_data.dart';
import '../model/user_model.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find<LocalStorageData>();

  UserModel? get userModel => _userModel;
  UserModel? _userModel;

  void getCurrentUser() async {
    _loading.value = true;
    _userModel = await localStorageData.getUser;
    _loading.value = false;

    update();
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FacebookLogin().logOut();
    await FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}
