import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_final/views/bienvenida.dart';
import 'package:proyecto_final/views/wcWidgets.dart';

class Location {
  String id;
  final String name;
  final int max;
  final int available;

  Location({
    this.id = '',
    required this.name,
    required this.max,
    required this.available,
  });

  Map<String, dynamic> ToJson() => {
        'id': id,
        'name': name,
        'max': max,
        'available': available,
      };
}

class Reserva {
  String id;
  final String time;
  final String day;
  final String location;

  Reserva({
    this.id = '',
    required this.time,
    required this.day,
    required this.location,
  });

  Map<String, dynamic> ToJson() => {
        'id': id,
        'time': time,
        'day': day,
        'location': location,
      };
}

class Reservas extends StatefulWidget {
  const Reservas({Key? key}) : super(key: key);

  @override
  State<Reservas> createState() => _Reservas();
}

class _Reservas extends State<Reservas> {
  String sed = "Seleccionar sede";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reservas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 18, 223, 230),
        body: Center(
          child: Column(
            children: [
              const Spacer(flex: 1),
              const Text(
                'Ingrese su nombre',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFD6F0CC),
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                child: const SizedBox(
                  width: 180,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Digite su nombre",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 3, 7, 14),
                        )),
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 7, 14),
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 1),

              const Text(
                'Seleccione la sede en la que desea reservar',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFD6F0CC),
                ),
                textAlign: TextAlign.center,
              ),
              // Aquí es donde se van a poner las sedes
              Container(
                color: Color.fromARGB(255, 18, 223,
                    230), //Este te da el color del fondo que necesitabas
                child: DropdownButton<String>(
                  value:
                      sed, //Aqui debes poner una variable que cambiará en la función
                  items: <String>[
                    'Seleccionar sede',
                    'Laureles',
                    'Poblado',
                    'Envigado',
                    'Sabaneta',
                    'Centro',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 3, 7, 14),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      sed = newValue ?? 'Poblado';
                    });
                  },
                  dropdownColor: const Color.fromARGB(255, 12, 88,
                      187), //Este te da color de fondo en la lista de selección
                ),
              ),

              const Spacer(flex: 1),

              //Aquí se ponen las horas
              const Text(
                'Ingrese la hora de su reserva',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFD6F0CC),
                ),
                textAlign: TextAlign.center,
              ),

              Container(
                child: const SizedBox(
                  width: 180,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Digite la hora",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 3, 7, 14),
                        )),
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 7, 14),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),

              button(
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        createLocation(sed);
                        return const Bienvenida();
                      },
                    ),
                  );
                },
                const Color(0xFF000000),
                "Realizar reserva",
                180,
                40,
              ),
              button(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void createLocation(String location) async {
    if (location == 'Poblado') {
      final list = await FirebaseFirestore.instance
          .collection('locations')
          .limit(1)
          .where('name', isEqualTo: 'Poblado')
          .get();
      int av = list.docs[0].get('available');
      av--;
      FirebaseFirestore.instance
          .collection('locations')
          .doc('001')
          .update({'available': av});
    }
  }
}
