import 'package:flutter/material.dart';
import 'package:proyecto_final/views/carrito.dart';
import 'package:proyecto_final/views/menu.dart';
import 'package:proyecto_final/views/reservas.dart';
import 'package:proyecto_final/views/wcWidgets.dart';
import 'package:proyecto_final/views/login.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({Key? key}) : super(key: key);

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
        backgroundColor: Color(0xFFE66812),
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
                  'Nos alegra tenerte aquí',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Color(0xFF384BFF),
                  ),
                ),
                const Spacer(flex: 1),

                //Boton 1
                button(
                  //Menupage
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MenuPage();
                        },
                      ),
                    );
                  },
                  const Color(0xFF000000),
                  "Menu",
                  180,
                  40,
                ),

                const Spacer(flex: 1),
                //Boton 2
                button(
                  //Menupage
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Reservas();
                        },
                      ),
                    );
                  },
                  const Color(0xFF000000),
                  "Reserva",
                  180,
                  40,
                ),
                const Spacer(flex: 1),
                //Boton 3
                button(
                  //Menupage
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Carrito();
                        },
                      ),
                    );
                  },
                  const Color(0xFF000000),
                  "Carrito",
                  180,
                  40,
                ),
                const Spacer(flex: 1),
                //Boton 4
                button(
                  //Menupage
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Login();
                        },
                      ),
                    );
                  },
                  const Color(0xFF000000),
                  "Cerrar sesión",
                  180,
                  40,
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
