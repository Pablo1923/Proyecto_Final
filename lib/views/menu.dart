import 'package:flutter/material.dart';
import 'package:proyecto_final/views/bienvenida.dart';
import 'package:proyecto_final/views/wcWidgets.dart';
import 'package:proyecto_final/views/login.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

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
                  'Menu',
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
                          return const Bienvenida();
                        },
                      ),
                    );
                  },
                  const Color(0xFF000000),
                  "Volver",
                  180,
                  40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
