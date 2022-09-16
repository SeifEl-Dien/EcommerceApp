import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/auth_view_model.dart';
import 'auth/login_screen.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';
import 'widgets/custom_textformfield.dart';

class SignupScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => LoginScreen());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomText(
                  text: 'Sign Up,',
                  fontsize: 30,
                ),
                const SizedBox(height: 30),
                CustomTextformfield(
                  text: 'Name',
                  hint: 'Jalen',
                  onsave: (value) {
                    controller.name = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('#### Error in name validator');
                    }
                  },
                ),
                const SizedBox(height: 30),
                CustomTextformfield(
                  text: 'Email',
                  hint: 'iamgroot@email.com',
                  onsave: (value) {
                    controller.email = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('#### Error in email validator');
                    }
                  },
                ),
                const SizedBox(height: 40),
                CustomTextformfield(
                  text: 'Password',
                  hint: '********',
                  onsave: (value) {
                    controller.password = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('#### Error in password validator');
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.createaccountwithemailandpassword();
                    }
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
