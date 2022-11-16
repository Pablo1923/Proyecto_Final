import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/views/wcWidgets.dart';
import 'package:proyecto_final/views/bienvenida.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neon foodies',
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
                  '¡Por favor inicia sesión!\nQuieremos saber quien eres',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF384BFF),
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                const Text(
                  'Usuario',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFFF2F00),
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  child: const SizedBox(
                    width: 180,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Digite su usuario",
                          hintStyle: TextStyle(
                            color: Color(0xFFFAED27),
                          )),
                      style: TextStyle(
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
                  child: const SizedBox(
                    width: 180,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Digite su contraseña",
                          hintStyle: TextStyle(
                            color: Color(0xFFFAED27),
                          )),
                      style: TextStyle(
                        color: Color(0xFFFAED27),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                button(
                  //Menupage
                  () {
                    getUsers();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Bienvenida();
                        },
                      ),
                    );
                  },
                  const Color(0xFF000000),
                  "Inicia sesión",
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

  void getUsers() async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection("users");
    QuerySnapshot users = await collection.get();

    if (users.docs.isNotEmpty) {
      for (var doc in users.docs) {
        print(doc.data());
      }
    }
  }
}
