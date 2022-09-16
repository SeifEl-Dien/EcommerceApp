import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../helper/local_storage_data.dart';
import '../model/user_model.dart';
import '../service/firestore_user.dart';
import '../view/control_All_Screens.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  String? email, password;
  String? name;
  final Rxn<User?> _user = Rxn<User>();
  String? get user => _user.value?.email;
  LocalStorageData localStorageData = Get.find<LocalStorageData>();
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser!.uid);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSigninMethod() async {
    final GoogleSignInAccount? googleuser = await _googleSignIn.signIn();
    print('#### googleuser data= ${googleuser}');

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleuser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(() => const ControlAllScreens());
    });
    print(
        '%%%%% userCredential data= ${_auth.signInWithCredential(credential)}');
  }

  void facebookSigninMethod() async {
    final result =
        await _facebookLogin.logIn(permissions: [FacebookPermission.email]);
    final accesstoken = result.accessToken!.token;
    if (result.status == FacebookLoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accesstoken);
      await _auth.signInWithCredential(faceCredential).then((user) async {
        saveUser(user);
        Get.offAll(() => const ControlAllScreens());
      });
    }
  }

  void signinwithemailandpassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        getCurrentUserData(value.user!.uid);
      });
      /*    .then((value) async {
        await FirestoreUser().getCurrentUser(value.user!.uid);
      }).then((value) {
        setUser(UserModel.fromJson(value as Map));
        print('#### email and password value = $value');
      }); */
      Get.offAll(() => const ControlAllScreens());
    } on FirebaseAuthException catch (e) {
      print('###### Error sign in email and password ${e.message}');
      Get.snackbar(
        'Error login message',
        e.message.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createaccountwithemailandpassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(() => const ControlAllScreens());
    } on FirebaseAuthException catch (e) {
      print('###### Error sign in email and password ${e.message}');
      Get.snackbar(
        'Error login message',
        e.message.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name == null ? user.user!.displayName : name,
      pic: '',
    );
    await FirestoreUser().addUserToFirestore(userModel);
    setUser(userModel);
  }

  void getCurrentUserData(String uid) async {
    await FirestoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data() as Map));
      print('#### email and password value = $value');
    });
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
