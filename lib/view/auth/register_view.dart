import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/view_model/auth_view_model.dart';
import 'package:shoping/view/widgets/custom_text.dart';
import 'package:shoping/view/widgets/custom_text_form_field.dart';
import 'package:shoping/view/widgets/custum_button.dart';

import 'login_view.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(

          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
              Container(
                height: 200,
                  child: Image.asset('assets/images/logo.png')),
                SizedBox(
                  height: 20,
                ),
              CustomText(
                  text: "Sign Up,",
                  fontSize: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Name',
                  hint: 'joseph',
                  onSave: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Email',
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
                  text: 'Password',
                  hint: '**********',
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onPress: () {
                    _formKey.currentState.save();

                    if (_formKey.currentState.validate()) {
                     controller.createAccountWithEmailAndPassword();
                    }
                  },
                  text: 'SIGN Up',
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
