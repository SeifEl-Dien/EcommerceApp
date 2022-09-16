import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../signup_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_button_social.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textformfield.dart';
import '../../viewmodel/auth_view_model.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: 'Welcome,',
                      fontsize: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => SignupScreen());
                      },
                      child: const CustomText(
                        text: 'Sign Up',
                        color: primarycolor,
                        fontsize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const CustomText(
                  text: 'Sign in to continue',
                  color: Colors.grey,
                  fontsize: 14,
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
                const CustomText(
                  text: 'Forgot Password?',
                  fontsize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'SIGN IN',
                  onPressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.signinwithemailandpassword();
                    }
                  },
                ),
                const SizedBox(height: 20),
                const CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 40),
                CustomButtonSocial(
                  text: 'Sign In With Facebook',
                  imageasset: 'assets/images/facebook.png',
                  onPressed: () {
                    controller.facebookSigninMethod();
                  },
                ),
                const SizedBox(height: 10),
                CustomButtonSocial(
                  text: 'Sign In With Google',
                  imageasset: 'assets/images/google.png',
                  onPressed: () {
                    controller.googleSigninMethod();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
