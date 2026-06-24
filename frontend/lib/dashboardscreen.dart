import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// Importamos el mapa solo si no es web, para evitar errores de compilación
import 'package:google_maps_flutter/google_maps_flutter.dart'
    if (dart.library.io) 'package:google_maps_flutter/google_maps_flutter.dart';

class DashboardScreen extends StatelessWidget {
  final bool isDriver;
  const DashboardScreen({super.key, required this.isDriver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isDriver ? "Modo Conductor" : "Modo Cliente")),
      body: Column(
        children: [
          Expanded(
            // Si estamos en web, mostramos un Placeholder decorado. Si es móvil, cargamos el mapa.
            child: kIsWeb
                ? Container(
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        "Mapa (Simulado en Web)",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  )
                : const GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(-12.0464, -77.0428),
                      zoom: 14,
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isDriver
                          ? "Buscando pasajeros..."
                          : "Solicitando taxi...",
                    ),
                  ),
                );
              },
              child: Text(isDriver ? "Activar Disponibilidad" : "Pedir Taxi"),
            ),
          ),
        ],
      ),
    );
  }
}
