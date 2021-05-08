import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/constasce.dart';
import 'package:shoping/core/view_model/auth_view_model.dart';
import 'package:shoping/view/auth/register_view.dart';
import 'package:shoping/view/widgets/custom_button_social.dart';
import 'package:shoping/view/widgets/custom_text.dart';
import 'package:shoping/view/widgets/custom_text_form_field.dart';
import 'package:shoping/view/widgets/custum_button.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                    child: Image.asset('assets/images/logo.png'),),
                SizedBox(
                   height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    CustomText(
                      text: "Welcome",
                      fontSize: 30,
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                        text: "Sign Up",
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                 // height: 10,
                ),
               CustomText(
                  text: "Sign in to Continue",
                  color: Colors.grey,
                  fontSize: 14,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  text: "Email",
                  hint: 'joseph@gmail.com',

                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "Password",
                  hint: '**********',
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Forgot Password?',
                  color: Colors.black,
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPress: () {
                    _formkey.currentState.save();
                    if (_formkey.currentState.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                  text: 'SIGN IN',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  text: '-OR-',
                  color: Colors.black,
                  alignment: Alignment.center,
                  fontSize: 18,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButtonSocial(
                  text: 'Sign In with Facebook',
                  onPress: () {
                    controller.facebookSignInMethod();
                  },
                  imageName: 'assets/images/face.png',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButtonSocial(
                  text: 'Sign In with Google',
                  onPress: () {
                    controller.googleSignInMethod();
                  },
                  imageName: 'assets/images/Google.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
