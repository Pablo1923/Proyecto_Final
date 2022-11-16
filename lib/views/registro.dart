import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/views/wcWidgets.dart';
import 'package:proyecto_final/views/bienvenida.dart';

class User {
  String id;
  final String name;
  final String user;
  final String password;
  final int credits;

  User({
    this.id = '',
    required this.name,
    required this.user,
    required this.password,
    required this.credits,
  });

  Map<String, dynamic> ToJson() => {
        'id': id,
        'name': name,
        'username': user,
        'password': password,
        'credit': credits,
      };
}

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  final controllerName = TextEditingController();
  final controllerUser = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registrarse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFE66812),
        body: Center(
          child: Container(
            width: width * 0.95,
            height: height * 0.95,
            decoration: BoxDecoration(
              color: const Color(0xFF5AC8FF),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 10,
                color: const Color(0xFF5711E6),
              ),
            ),
            child: Column(
              children: [
                const Spacer(flex: 1),
                const Text(
                  'BIENVENIDO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Color(0xFF384BFF),
                  ),
                ),
                const Spacer(flex: 1),
                Image.asset(
                  "assets/beso3.jpg",
                  height: height * 0.3,
                  width: height * 0.3,
                ),
                const Spacer(flex: 1),
                const Text(
                  'Ingresa tus datos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF384BFF),
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                const Text(
                  'Nombre completo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFFF2F00),
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  child: SizedBox(
                    width: 180,
                    child: TextField(
                      controller: controllerName,
                      decoration: const InputDecoration(
                          hintText: "Digite su nombre",
                          hintStyle: TextStyle(
                            color: Color(0xFFFAED27),
                          )),
                      style: const TextStyle(
                        color: Color(0xFFFAED27),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                const Text(
                  'Nombre de usuario',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFFF2F00),
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  child: SizedBox(
                    width: 180,
                    child: TextField(
                      controller: controllerUser,
                      decoration: const InputDecoration(
                          hintText: "Digite su usuario",
                          hintStyle: TextStyle(
                            color: Color(0xFFFAED27),
                          )),
                      style: const TextStyle(
                        color: Color(0xFFFAED27),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                const Text(
                  'Contraseña',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFFF2F00),
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  child: SizedBox(
                    width: 180,
                    child: TextField(
                      controller: controllerPassword,
                      decoration: const InputDecoration(
                          hintText: "Digite su contraseña",
                          hintStyle: TextStyle(
                            color: Color(0xFFFAED27),
                          )),
                      style: const TextStyle(
                        color: Color(0xFFFAED27),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                button(
                  //Menupage
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          final user = User(
                            name: controllerName.text,
                            user: controllerUser.text,
                            password: controllerPassword.text,
                            credits: 0,
                          );
                          createUser(user);
                          return const Bienvenida();
                        },
                      ),
                    );
                  },
                  const Color(0xFF000000),
                  "Registrarse",
                  180,
                  40,
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createUser(User user) async {
    final doc = FirebaseFirestore.instance.collection('users').doc();
    user.id = doc.id;
    var json = user.ToJson();
    await doc.set(json);
  }
}
