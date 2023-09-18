// ignore_for_file: file_names, inference_failure_on_instance_creation

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/components.dart';
import 'package:food_delivery_app/home.dart';
import 'package:food_delivery_app/screens/sign_up_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'log_in_with_phone_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final textStyle = TextStyle(color: Colors.grey.shade800, fontSize: 18);

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();

  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  void login(String email, String passwrod) async {
    var formData = formGlobalKey.currentState;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passwrod);
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (error) {
      if (error.code == 'INVALID_LOGIN_CREDENTIALS') {
        Navigator.of(context).pop();

        wrongEmailMessage();
      } else if (error.code == 'The email address is badly formatted.') {
        print('error');
      }
    }

    // if (formData!.validate()) {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const Home(),
    //       ));
    // } else {
    //   return null;
    // }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Вы ввели не правильные данные '),
        );
      },
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    const double containerSize = 500;
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return SingleChildScrollView(
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
                          const SizedBox(height: 100),
                          Text(
                            'Добро пожаловать в наше приложение. Пожалуйста, войдите в систему сейчас!',
                            textAlign: TextAlign.center,
                            style: textStyle,
                          ),
                          const SizedBox(height: 30),
                          CustomTextField(
                            controller: email,
                            inputType: TextInputType.emailAddress,
                            label: "Электронная почта",
                            hintText: "example@gmail.com",
                            helperText:
                                'Пожалуйста, введите свой адрес электронной почты',
                            isObscure: false,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return 'Форма пуста';
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
                            helperText:
                                'пароль должен быть не менее 8 символов ',
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
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Placeholder();
                                }));
                              },
                              child: const Text('Забыли пароль?'),
                            ),
                          ),
                          const SizedBox(height: 50),
                          CustomButton(
                            textButton: "Авторизоваться",
                            onPressed: () {
                              login(email.text, password.text);
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
                                onTap: () async {
                                  await signInWithGoogle();
                                  // .then((value) =>
                                  //     Navigator.of(context)
                                  //         .pushReplacement(MaterialPageRoute(
                                  //       builder: (context) => const Home(),
                                  //     )));
                                },
                                imageAsset: 'google.png',
                              ),
                              const SizedBox(width: 30),
                              CredentialButton(
                                onTap: () {},
                                imageAsset: 'apple.png',
                              ),
                              const SizedBox(width: 30),
                              CredentialButton(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginWithPhoneScreen(),
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
                              const Text('нет аккаунта?'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen(),
                                        ));
                                  },
                                  child: const Text('Зарегистрироваться')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
