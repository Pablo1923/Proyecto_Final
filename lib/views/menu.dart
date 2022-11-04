import 'package:flutter/material.dart';
import 'package:proyecto_final/views/bienvenida.dart';
import 'package:proyecto_final/views/wcWidgets.dart';
import 'package:proyecto_final/views/login.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _Menu();
}

class _Menu extends State<MenuPage> {
  String? pf = 'Seleccionar';
  String? ent = 'Seleccionar';
  String? beb = 'Seleccionar';
  String? pos = 'Seleccionar';

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

                const Text(
                  'Ingrese entrada',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFD6F0CC),
                  ),
                  textAlign: TextAlign.center,
                ),

                Container(
                  color: Colors.blue,
                  child: DropdownButton<String>(
                      value: ent,
                      items: <String>[
                        'Seleccionar',
                        'Papas toci-queso',
                        'Patacones guacamólicos',
                        'Yuquitas chongo',
                        'Quesuditos',
                        'Pan ajudos'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(
                            value,
                            style: TextStyle(
                              color: Color(0xFF37FA0F),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          ent = newValue;
                        });
                      },
                      dropdownColor: Colors.blue),
                ),
                const Spacer(flex: 1),
                const Text(
                  'Ingrese plato fuerte',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFD6F0CC),
                  ),
                  textAlign: TextAlign.center,
                ),

                Container(
                  color: Colors.blue,
                  child: DropdownButton<String>(
                    value: pf,
                    items: <String>[
                      'Seleccionar',
                      'Delirio burguer',
                      'Tacoticos',
                      'Perritosky',
                      'Pizzorinny',
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(
                          value,
                          style: TextStyle(
                            color: Color(0xFFFF02B0),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        pf = newValue;
                      });
                    },
                    dropdownColor: Colors.blue,
                  ),
                ),

                const Spacer(flex: 1),
                const Text(
                  'Ingrese bebida',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFD6F0CC),
                  ),
                  textAlign: TextAlign.center,
                ),

                Container(
                  color: Colors
                      .blue, //Este te da el color del fondo que necesitabas
                  child: DropdownButton<String>(
                    value:
                        beb, //Aqui debes poner una variable que cambiará en la función
                    items: <String>[
                      'Seleccionar',
                      'Gaseosa',
                      'Jugo en agua',
                      'Jugo en leche',
                      'Malteada',
                      'Bebida caliente'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(
                          value,
                          style: TextStyle(
                            color: Color(0xFFFFE919),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        beb = newValue;
                      });
                    },
                    dropdownColor: Colors.blue,
                  ),
                ),

                const Spacer(flex: 1),
                const Text(
                  'Ingrese postre',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFD6F0CC),
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  color: Colors
                      .blue, //Este te da el color del fondo que necesitabas
                  child: DropdownButton<String>(
                      value:
                          pos, //Aqui debes poner una variable que cambiará en la función
                      items: <String>[
                        'Seleccionar',
                        'Postre milongo',
                        'Flan de leche',
                        'Chocovolvcán',
                        'Frambuesito',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(
                            value,
                            style: TextStyle(
                              color: Color(0xFF0009E8),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          pos = newValue;
                        });
                      },
                      dropdownColor: Colors.blue),
                ),

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
