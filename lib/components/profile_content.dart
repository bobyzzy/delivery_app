import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/components.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    super.key,
  });

  void logOut() async {
    final isSignedWithGoogle = await GoogleSignIn().isSignedIn();
    if (isSignedWithGoogle == true) {
      await GoogleSignIn().signOut();
    } else {
      await FirebaseAuth.instance.signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Профиль',
          style: TextStyle(fontFamily: 'SF', fontSize: 24),
        ),
        actions: const [
          CircleAvatar(
            radius: 30,
          ),
          SizedBox(width: 15)
        ],
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitle(title: 'Настройки', iconData: Icons.person),
            const Divider(),
            const SizedBox(height: 10),
            const ListTile(
              title: Text('Личные данные', style: TextStyle(fontSize: 18)),
              visualDensity: VisualDensity.standard,
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              title: Text('Изменить пароль', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              title: Text('Способы оплаты', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(height: 30),
            const CustomTitle(
                title: 'Уведомления', iconData: Icons.notifications),
            const Divider(),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Уведомления по почте',
                  style: TextStyle(fontSize: 18)),
              trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                  activeColor: Colors.indigo),
            ),
            ListTile(
              title: const Text('Push-уведомления и СМС',
                  style: TextStyle(fontSize: 18)),
              trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                  activeColor: Colors.indigo),
            ),
            const SizedBox(height: 30),
            const CustomTitle(title: 'Конфигурации', iconData: Icons.dashboard),
            const Divider(),
            const SizedBox(height: 10),
            const ListTile(
              title: Text('Способы оплаты', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: const Text('Ночная тема', style: TextStyle(fontSize: 18)),
              trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                  activeColor: Colors.indigo),
            ),
            ListTile(
              onTap: () {
                logOut();
              },
              title: const Text('Выйти',
                  style: TextStyle(fontSize: 18, color: Colors.red)),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
