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
      title: 'Practica Flutter',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _hoveredItem = '';
  String _clickedItem = '';  // Para el ítem clickeado
  //Prueba
  final Color azulCelesteDefault = const Color(0xFF002F87);

  final List<String> ImagenesParaElSlider = [
    'assets/FOTO1.jpg',
    'assets/FOTO2.jpg',
    'assets/FOTO3.jpg'
  ];

   Widget _buildDrawerItem(String title, Color colorDefault) {
    return Container(
      color: (_clickedItem == title) ? colorDefault.withOpacity(0.1) : null,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: (_clickedItem == title) ? colorDefault : Colors.black,  // Cambia el color del texto cuando es clickeado
          ),
        ),
        onTap: () {
          setState(() {
            _clickedItem = title;  // Marca el ítem como clickeado
          });
        },
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

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isMobile
          ? AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            )
          : null,
      drawer: isMobile
          ? Drawer(
              child: ListView(
                children: [
                  const SizedBox(height: 10), // Espacio entre el top y el primer ítem
                  _buildDrawerItem('INICIO', azulCelesteDefault),
                  _buildDrawerItem('NOSOTROS', azulCelesteDefault),
                  _buildDrawerItem('ASESORÍA', azulCelesteDefault),
                  _buildDrawerItem('CONTÁCTENOS', azulCelesteDefault),
                  _buildDrawerItem('TIENDA', azulCelesteDefault),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
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

            // Menú superior para Web
            if (!isMobile)
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

            // Slider
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
                          backgroundColor: azulCelesteDefault,
                        ),
                        child: const Text(
                          'Ver Todos',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Tarjetas de servicios
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: isMobile
                        ? const Column(
                            children: [
                              ServiceCard(title: 'Funerales', imagePath: 'assets/funerales.jpg'),
                              ServiceCard(title: 'Cremación', imagePath: 'assets/cremacion.jpg'),
                              ServiceCard(title: 'Arreglos Florales', imagePath: 'assets/arreglosflores.jpg'),
                              ServiceCard(title: 'Otros', imagePath: 'assets/otros.jpg'),
                            ],
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: ServiceCard(title: 'Funerales', imagePath: 'assets/funerales.jpg')),
                              SizedBox(width: 16),
                              Expanded(child: ServiceCard(title: 'Cremación', imagePath: 'assets/cremacion.jpg')),
                              SizedBox(width: 16),
                              Expanded(child: ServiceCard(title: 'Arreglos Florales', imagePath: 'assets/arreglosflores.jpg')),
                              SizedBox(width: 16),
                              Expanded(child: ServiceCard(title: 'Otros', imagePath: 'assets/otros.jpg')),
                            ],
                          ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Testimonios
            Center(
              child: TestimoniosWidget(isMobile: isMobile),
            ),

            const SizedBox(height: 40),

            // Paquetes
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Nuestros Paquetes',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Elige los mejores paquetes para tu familia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text(
                'Profesionales dedicados listos para guiarlo en la planificación de servicios funerarios.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            const TiposDePaquetesCard(),
          ],
        ),
      ),
    );
  }
}








