// ignore_for_file: file_names, inference_failure_on_instance_creation, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/components.dart';
import 'package:food_delivery_app/home.dart';

import '../service/services.dart';

class LoginWithPhoneScreen extends StatefulWidget {
  const LoginWithPhoneScreen({super.key});

  @override
  State<LoginWithPhoneScreen> createState() => _LoginWithPhoneScreenState();
}

class _LoginWithPhoneScreenState extends State<LoginWithPhoneScreen> {
  final textStyle = TextStyle(color: Colors.grey.shade800, fontSize: 18);

  TextEditingController phoneController = TextEditingController();
  TextEditingController smsCodeController = TextEditingController();
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  late final String verificationID;

  void showSMSDialog(String phone) async {
    final formData = formGlobalKey.currentState;
    FirebaseAuth auth = FirebaseAuth.instance;
    if (formData!.validate()) {
      await auth.verifyPhoneNumber(
        phoneNumber: '+$phone',
        timeout: const Duration(seconds: 120),
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (error) {
          if (error.code == 'invalid-phone-number') {
            print('error verification');
          }
        },
        codeSent: (verificationId, forceResendingToken) {
          verificationID = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
      showDialog(
        context: context,
        builder: (context) {
          final width = MediaQuery.of(context).size.width;
          final height = MediaQuery.of(context).size.height;
          return Dialog(
            shape: const RoundedRectangleBorder(),
            child: Container(
              padding: const EdgeInsets.all(16),
              height: height * 0.32,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.password,
                    size: 50,
                  ),
                  const SizedBox(height: 10),
                  const Text('Введите СМС-Код', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: smsCodeController,
                    label: '',
                    hintText: '',
                    helperText: '',
                    isObscure: false,
                    maxLength: 6,
                    inputType: TextInputType.number,
                    validator: (p0) {},
                  ),
                  CustomButton(
                    textButton: 'Отправить',
                    onPressed: () {
                      confirmCode();
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
    } else {
      return null;
    }
  }

  Future<void> confirmCode() async {
    await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationID, smsCode: smsCodeController.text));

    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //   builder: (context) => const Home(),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    const double containerSize = 500;
    return Scaffold(
      appBar: AppBar(),
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
                    const SizedBox(height: 150),
                    const Icon(Icons.phone_iphone_rounded, size: 70),
                    const SizedBox(height: 70),
                    Text(
                      'Добро пожаловать в наше приложение. Пожалуйста, Введите свой номер телефона!',
                      textAlign: TextAlign.center,
                      style: textStyle,
                    ),
                    const SizedBox(height: 30),
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: phoneController,
                      maxLength: 16,
                      label: '+123456789',
                      hintText: '375259412499',
                      helperText: 'Введите свой номер телефона',
                      isObscure: false,
                      inputType: TextInputType.number,
                      prefixWidget: const Text("+"),
                      inputformatter: [PhoneInputFormatter()],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Форма пуста";
                        } else if (value.length < 12) {
                          return 'Номер введен не корректно';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      textButton: "Отправить код",
                      onPressed: () {
                        final result = phoneController.text.split('-').join();
                        showSMSDialog(result);
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
                          onTap: () {},
                          imageAsset: 'google.png',
                        ),
                        const SizedBox(width: 30),
                        CredentialButton(
                          onTap: () {},
                          imageAsset: 'apple.png',
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                    const SizedBox(height: 50),
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
