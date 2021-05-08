import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoping/core/services/firestore_user.dart';
import 'package:shoping/helper/local_storage_data.dart';
import 'package:shoping/model/user_model.dart';
import 'package:shoping/view/control_view.dart';
import 'package:shoping/view/home_view.dart';

class AuthViewModel extends GetxController{
GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
FirebaseAuth _auth = FirebaseAuth.instance;
FacebookLogin _facebookLogin = FacebookLogin();
String email, password,name;
Rx<User> _user = Rx<User>();
String get user=>_user.value?.email;
final LocalStorageData localStorageData = Get.find();
@override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null){
      getCurrentUserData(_auth.currentUser.uid);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
  @override
  void onReady() {
    super.onReady();
  }



void googleSignInMethod() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  print(googleUser);
  GoogleSignInAuthentication googleSignInAuthentication =
  await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    idToken: googleSignInAuthentication.idToken,
    accessToken: googleSignInAuthentication.accessToken,
  );
  await _auth.signInWithCredential(credential).then((user)async{
    saveUser(user);
    Get.offAll(ControlView());

  });
  }


void facebookSignInMethod() async {
  FacebookLoginResult result = await _facebookLogin.logIn(['email']);
  final accessToken = result.accessToken.token;
  if(result.status==FacebookLoginStatus.loggedIn){
  final faceCedential=FacebookAuthProvider.credential(accessToken);

  await _auth.signInWithCredential(faceCedential).then((user)async{
    saveUser(user);
  });
}
}
void signInWithEmailAndPassword() async {

  try {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value)async{
      getCurrentUserData(value.user.uid);
      });
    Get.offAll(ControlView());
  } catch (e) {
    print(e.message);
    Get.snackbar(
      'Error login account',
      e.message,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
void createAccountWithEmailAndPassword() async {
  try {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) async {

         saveUser(user);
    });


    Get.offAll(ControlView());
  } catch (e) {
    print(e.message);
    Get.snackbar(
      'Error login account',
      e.message,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

void saveUser(UserCredential user) async {
  UserModel userModel = UserModel(
        userId: user.user.uid,
        email: user.user.email,
        name: name == null ? user.user.displayName : name,
        pic: '',
  );
  await FireStoreUser().addUserToFireStore(userModel);
  setUser(userModel);
}
void getCurrentUserData(String uid)async{
  await FireStoreUser().getCurrentUser(uid).then((value){
    setUser(UserModel.fromJson(value.data()));
  });
}

      void setUser(UserModel userModel)async{
      await localStorageData.setUser(userModel);
}
}
