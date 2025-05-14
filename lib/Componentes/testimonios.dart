import 'package:flutter/material.dart';

class TestimoniosWidget extends StatefulWidget {
  final bool isMobile;
  const TestimoniosWidget({required this.isMobile, super.key});

  @override
  _TestimoniosWidgetState createState() => _TestimoniosWidgetState();
}

class _TestimoniosWidgetState extends State<TestimoniosWidget> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> testimonios = [
    {
      "mensaje":
          "Excelente servicio, mi familia y yo estamos muy agradecidos por su pronta respuesta, puntualidad y seriedad. Nos acompañaron en los momentos más difíciles. ¡Muchas gracias!",
      "autor": "Marla Santamaria",
      "imagen": "https://cdn-icons-png.flaticon.com/512/2922/2922561.png"
    },
    {
      "mensaje":
          "El trato fue muy humano y empático, se notó que realmente les importa ayudar. Fue una experiencia reconfortante dentro de lo doloroso.",
      "autor": "Carlos Méndez",
      "imagen": "https://cdn-icons-png.flaticon.com/512/2922/2922510.png"
    },
    {
      "mensaje":
          "Nos guiaron paso a paso con mucha paciencia. Su profesionalismo y atención al detalle marcaron la diferencia. Los recomendaría sin dudarlo.",
      "autor": "Lucía Romero",
      "imagen": "https://cdn-icons-png.flaticon.com/512/2922/2922656.png"
    },
    {
      "mensaje":
          "Desde el primer contacto fueron muy atentos. Se encargaron de todo con mucho respeto y dedicación. Muy agradecido con todo el equipo.",
      "autor": "Andrés Salazar",
      "imagen": "https://cdn-icons-png.flaticon.com/512/2922/2922688.png"
    },
    {
      "mensaje":
          "Gracias por estar ahí cuando más los necesitábamos. Todo fue manejado con mucha delicadeza y profesionalismo.",
      "autor": "Rosa Guzmán",
      "imagen": "https://cdn-icons-png.flaticon.com/512/2922/2922561.png"
    },
    {
      "mensaje":
          "Un equipo maravilloso, hicieron que un momento tan doloroso fuera más llevadero. Todo fue organizado y con mucho respeto.",
      "autor": "José Rivas",
      "imagen": "https://cdn-icons-png.flaticon.com/512/2922/2922719.png"
    },
  ];

  int get totalPages {
    final testimoniosPorPagina = widget.isMobile ? 1 : 3;
    return (testimonios.length / testimoniosPorPagina).ceil();
  }

  List<Widget> _buildPage(int pageIndex, int testimoniosPorPagina) {
    final start = pageIndex * testimoniosPorPagina;
    final end = (start + testimoniosPorPagina <= testimonios.length)
        ? start + testimoniosPorPagina
        : testimonios.length;
    final items = testimonios.sublist(start, end);

    return items.map((testimonio) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                testimonio['mensaje']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 40),
              CircleAvatar(
                backgroundImage: NetworkImage(testimonio['imagen']!),
                radius: 20,
              ),
              const SizedBox(height: 15),
              Text(
                testimonio['autor']!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _controller.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _nextPage() {
    if (_currentIndex < totalPages - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Testimonios",
              style: TextStyle(
                  color: Colors.blue[300],
                  fontSize: 18,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w300)),
          const SizedBox(height: 10),
          const Text("¿Qué dicen de nosotros?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemCount: totalPages,
              itemBuilder: (_, pageIndex) {
                final testimoniosPorPagina = widget.isMobile ? 1 : 3;
                final items = _buildPage(pageIndex, testimoniosPorPagina);

                return widget.isMobile
                    ? Column(children: items)
                    : Row(children: items);
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalPages,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentIndex == index ? Colors.white : Colors.grey[600],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: _previousPage,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: _nextPage,
              ),
            ],
          )
        ],
      ),
    );
  }
}
