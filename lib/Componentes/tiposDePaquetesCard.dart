import 'package:flutter/material.dart';

class TiposDePaquetesCard extends StatelessWidget {
  const TiposDePaquetesCard({super.key});

  final List<Map<String, dynamic>> paquetesDeCampoSanto = const [
    {
      'title': 'Servicio Directo a Cementerio',
      'features': [
        'Féretro de madera',
        'Transporte al cementerio',
      ],
      'price': 'DESDE ₡245.000',
    },
    {
      'title': 'Servicio Plus con Velación',
      'features': [
        'Féretro de madera',
        'Transporte',
        'Preservación del cuerpo',
        'Decoración de vela',
        'Arreglos florales',
      ],
      'price': 'DESDE ₡395.000',
      'highlighted': true,
    },
    {
      'title': 'Servicio con Velación Delux',
      'features': [
        'Féretro de madera elegante y sobrio',
        'Transporte',
        'Preservación del cuerpo',
        'Decoración de vela',
        '4 Arreglos florales',
      ],
      'price': 'DESDE ₡490.000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
//  final double cardScaleFactor = 0.85;
    final double cardScaleFactor = 0.75; // Antes era 0.85

    final double cardWidth = (screenWidth / 3) * cardScaleFactor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1), // 👈 ESTE ES EL PADDING GENERAL
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 800;

          return isSmallScreen
              ? Column(
                  children: paquetesDeCampoSanto.map((paquete) {
                    return _buildCard(paquete, screenWidth - 32); // 16 + 16
                  }).toList(),
                )
              : Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: paquetesDeCampoSanto.asMap().entries.map((entry) {
                      final index = entry.key;
                      final paquete = entry.value;
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < paquetesDeCampoSanto.length - 1 ? 16 : 0, // 👈 ESTE ESPACIADO ENTRE CARTAS
                        ),
                        child: _buildCard(paquete, cardWidth),
                      );
                    }).toList(),
                  ),
                );
        },
      ),
    );
  }

  Widget _buildCard(Map<String, dynamic> paquete, double width) {
    final bool highlighted = paquete['highlighted'] ?? false;
    final Color backgroundColor = highlighted ? const Color(0xFF0A0F1F) : Colors.white;
    final Color textColor = highlighted ? Colors.white : Colors.black;
    final Color checkColor = highlighted ? Colors.blue.shade300 : Colors.blue;

    return Container(
      width: width,
      height: 480,
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            paquete['title'],
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 12),
          Divider(color: Colors.grey.shade400, thickness: 1),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: List<String>.from(paquete['features']).map(
                (feature) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle, size: 20, color: checkColor),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.9)),
                        ),
                      ),
                    ],
                  ),
                ),
              ).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF075DCE),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                paquete['price'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
