import 'package:flutter/material.dart';
import 'package:my_app/Componentes/auto_change_background.dart';
import 'package:my_app/Componentes/serviceCard.dart';
import 'package:my_app/Componentes/testimonios.dart';
import 'package:my_app/Componentes/tiposDePaquetesCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Titulo del material App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color azulCelesteDefault = Color(0xFF002F87);

    final List<String> ImagenesParaElSlider = [
      'assets/FOTO1.jpg',
      'assets/FOTO2.jpg',
      'assets/FOTO3.jpg'
    ];

    final List<Map<String, dynamic>> paquetesDeCampoSanto = [
      {
        'title': 'Paquete Básico',
        'features': ['1 GB de datos', '100 minutos', '30 días de duración'],
        'price': '\$5.99',
      },
      {
        'title': 'Paquete Estándar',
        'features': ['5 GB de datos', '500 minutos', '30 días de duración'],
        'price': '\$12.99',
      },
      {
        'title': 'Paquete Premium',
        'features': ['10 GB de datos', 'Llamadas ilimitadas', 'SMS ilimitados'],
        'price': '\$19.99',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,  // Centrado

          children: [
            // Encabezado personalizado (en lugar del AppBar)
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/pradosDeEsperanzaLogo.jpeg',
                height: 140,
                fit: BoxFit.contain,
              ),
            ),

            // Menú superior
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem('INICIO'),
                  _buildNavItem('NOSOTROS'),
                  _buildNavItem('ASESORÍA'),
                  _buildNavItem('CONTÁCTENOS'),
                  _buildNavItem('TIENDA'),
                ],
              ),
            ),

            // Slider con fondo cambiante
            AutoChangeBackground(images: ImagenesParaElSlider),

            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NUESTROS SERVICIOS',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF002F87),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Qué servicio ofrecemos',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Funerales Tradicionales y Cremación: Despidiendo a sus seres queridos con respeto y compasión',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(azulCelesteDefault.value),
                        ),
                        child: const Text(
                          'Ver Todos',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    children: [
                      Expanded(
                        child: ServiceCard(
                          title: 'Funerales',
                          imagePath: 'assets/funerales.jpg',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ServiceCard(
                          title: 'Cremación',
                          imagePath: 'assets/cremacion.jpg',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ServiceCard(
                          title: 'Arreglos Florales',
                          imagePath: 'assets/arreglosflores.jpg',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ServiceCard(
                          title: 'Otros',
                          imagePath: 'assets/otros.jpg',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            Center(
              child: TestimoniosWidget(),
            ),

            const SizedBox(height: 40),

            
               // Título principal
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Nuestros Paquetes',
                style: TextStyle(
                  fontSize: 32,  // Título más grande
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.2,  // Un poco de espaciado para hacerlo más elegante
                ),
              ),
            ),
            
            // Subtítulo
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Elige los mejores paquetes para tu familia',
                textAlign: TextAlign.center,  // Centrado
                style: TextStyle(
                  fontSize: 20,  // Subtítulo un poco más grande que la descripción
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            
            // Descripción
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text(
                'Profesionales dedicados listos para guiarlo en la planificación de servicios funerarios.',
                textAlign: TextAlign.center,  // Centrado
                style: TextStyle(
                  fontSize: 16,  // Texto más pequeño
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            TiposDePaquetesCard(), // Solo llamas esto 🧠

         
           
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF002F87),
      ),
    );
  }
}
