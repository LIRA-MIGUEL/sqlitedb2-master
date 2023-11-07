import 'package:flutter/material.dart';
import 'package:sqlitedb2/convert_utility.dart';

class imageInfo extends StatefulWidget {
  const imageInfo({
    Key? key,
    required this.photo,
    required this.name,
    required this.apepa,
    required this.apema,
    required this.email,
    required this.tel,
  }) : super(key: key);

  final String? photo;
  final String? name;
  final String? apepa;
  final String? apema;
  final String? email;
  final String? tel;

  @override
  State<imageInfo> createState() => _imageInfoState();
}

class _imageInfoState extends State<imageInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Datos personales", style: TextStyle(color: Colors.red)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        // Agrega un color de fondo
        color: Colors.pink, // Puedes cambiar "Colors.grey" al color que desees
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                "Página de datos",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 170,
                    height: 170,
                    child: Utility.ImageFromBase64String(widget.photo!),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildFieldAndResponse("Nombre:", widget.name, Colors.green, Colors.black),
                  _buildFieldAndResponse("Apellido Paterno:", widget.apepa, Colors.green, Colors.black),
                  _buildFieldAndResponse("Apellido Materno:", widget.apema, Colors.green, Colors.black),
                  _buildFieldAndResponse("Teléfono:", widget.tel, Colors.green, Colors.black),
                  _buildFieldAndResponse("Email:", widget.email, Colors.green, Colors.black),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Cambiar el color de fondo del botón
                  onPrimary: Colors.white, // Cambiar el color del texto del botón
                  minimumSize: const Size(150, 40), // Tamaño mínimo del botón
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Regresar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldAndResponse(String field, String? response, Color fieldColor, Color responseColor) {
    return Row(
      children: [
        Text(
          "$field",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: fieldColor,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          response ?? "",
          style: TextStyle(
            fontSize: 20,
            color: responseColor,
          ),
        ),
      ],
    );
  }
}

