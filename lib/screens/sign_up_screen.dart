// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/components.dart';
import 'package:food_delivery_app/home.dart';
import 'package:food_delivery_app/screens/log_in_screen.dart';
import 'package:food_delivery_app/screens/log_in_with_phone_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final textStyle =
      TextStyle(color: Colors.grey.shade800, fontSize: 18, fontFamily: "SF");

  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  void signUp(String email, String passwrod) async {
    var formData = formGlobalKey.currentState;
    if (formData!.validate()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: passwrod);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    const double containerSize = 500;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formGlobalKey,
            child: Center(
              child: Container(
                width: containerSize,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 70),
                    const Icon(Icons.lock, size: 70),
                    const SizedBox(height: 20),
                    Text(
                      'Добро пожаловать в наше приложение. Пожалуйста, зарегистрируйтесь сейчас!',
                      textAlign: TextAlign.center,
                      style: textStyle,
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: email,
                      inputType: TextInputType.emailAddress,
                      label: "Электронная почта",
                      hintText: "example@gmail.com",
                      helperText: 'Пожалуйста введите почту',
                      isObscure: false,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'форма пуста';
                        } else if (!email.contains('@')) {
                          return 'Почта должна содержать символ \'@\'';
                        } else if (!email.contains('.')) {
                          return 'Почта должна содержать символ \'.\'';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: password,
                      inputType: TextInputType.visiblePassword,
                      label: "Пароль",
                      hintText: "",
                      helperText: 'Пароль должен быть не менее 8 символов ',
                      isObscure: true,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'форма пуста';
                        } else if (p0.length < 8) {
                          return 'пароль должен быть меньше 8 символов';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: confirmPassword,
                      inputType: TextInputType.visiblePassword,
                      label: "Пароль",
                      hintText: "",
                      helperText: 'Подтвердите ваш пароль',
                      isObscure: true,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'форма пуста';
                        } else if (p0.length < 8) {
                          return 'пароль должен быть меньше 8 символов';
                        } else if (password.text != confirmPassword.text) {
                          return 'пароль не совпадает';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      textButton: "Зарегистрироваться",
                      onPressed: () {
                        signUp(email.text, password.text);
                      },
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Или продолжить с',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CredentialButton(
                            onTap: () {}, imageAsset: 'google.png'),
                        const SizedBox(width: 30),
                        CredentialButton(onTap: () {}, imageAsset: 'apple.png'),
                        const SizedBox(width: 30),
                        CredentialButton(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginWithPhoneScreen(),
                            ));
                          },
                          imageAsset: 'phone.png',
                          color: Colors.greenAccent.shade700,
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Уже есть аккаунт?'),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const LogInScreen(),
                              ));
                            },
                            child: const Text('Авторизоваться')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
