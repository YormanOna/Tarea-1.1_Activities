import 'package:flutter/material.dart';
import 'Pages/Ejercicio1.dart';
import 'Pages/Ejercicio2.dart';
import 'Pages/Ejercicio3.dart';
import 'Pages/Ejercicio4.dart';
import 'Pages/Ejercicio5.dart';
import 'Pages/Ejercicio6.dart';

class NavigationPage extends StatelessWidget {
  final String title;

  const NavigationPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF6B48FF),
                      Color(0xFF553BDB),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -50,
                      top: -50,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -30,
                      bottom: -30,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Nuestros Ejercicios 😎😍',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: 40,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFB647),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),

          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildWelcomeSection(),
                  SizedBox(height: 24),
                  ExerciseCard(
                    title: 'Ejercicio 1',
                    description: 'Algoritmo para ordenar tres números en orden ascendente.',
                    icon: Icons.sort,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Exercise1Page()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  ExerciseCard(
                    title: 'Ejercicio 2',
                    description: 'Programa para categorizar camisetas por talla y color.',
                    icon: Icons.shopping_bag,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Exercise2Page()),
                      );
                    },
                  ),
                  ExerciseCard(
                    title: 'Ejercicio 3',
                    description: 'Algoritmo que permite calcular y mostrar las raíces que son solución de una ecuación de segundo grado.',
                    icon: Icons.functions,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Exercise3Page()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  ExerciseCard(
                    title: 'Ejercicio 4',
                    description: 'Algoritmo que permite determinar si un conjunto de tres magnitudes de lados ingresados, pueden forman un triángulo',
                    icon: Icons.change_history,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Exercise4Page()),
                      );
                    },
                  ),
                  ExerciseCard(
                    title: 'Ejercicio 5',
                    description: 'Programa de reajuste de sueldos a sus empleados.',
                    icon: Icons.monetization_on,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Exercise5Page()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  ExerciseCard(
                    title: 'Ejercicio 6',
                    description: 'Programa de calculo de sueldo base.',
                    icon: Icons.attach_money,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Exercise6Page()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Color(0xFFF0F3FF),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDD),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.emoji_objects_outlined,
                  color: Color(0xFFFFB647),
                  size: 30,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '¡Bienvenido, Usuario!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2A2A54),
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Explora nuestros ejercicios',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF7C7C8A),
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFF5F3FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xFF6B48FF).withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.tips_and_updates_outlined,
                  color: Color(0xFF6B48FF),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Visita nuestros ejercicios prácticos.',
                    style: TextStyle(
                      color: Color(0xFF4A4A6A),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ExerciseCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  ExerciseCard({
    required this.title,
    required this.description,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFF6B48FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 28,
                  color: Color(0xFF6B48FF),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2A2A54),
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7C7C8A),
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xFF6B48FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Exercise1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ejercicio 1',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.tealAccent,
      ),
      body: OrdenarNumeros(),
    );
  }
}

class Exercise2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ejercicio 2',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        automaticallyImplyLeading: false, // Quita la flecha de volver
        backgroundColor: Colors.tealAccent,
      ),
      body: CamisasPage(),
    );
  }
}

class Exercise3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ejercicio 3',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        automaticallyImplyLeading: false, // Quita la flecha de volver
        elevation: 0,
        backgroundColor: Colors.tealAccent,
      ),
      body: EcuacionSegundoGrado(),
    );
  }
}

class Exercise4Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ejercicio 4',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        automaticallyImplyLeading: false, // Quita la flecha de volver
        elevation: 0,
        backgroundColor: Colors.tealAccent,
      ),
      body: TrianguloCalculator(),
    );
  }
}

class Exercise5Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ejercicio 5',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        automaticallyImplyLeading: false, // Quita la flecha de volver
        elevation: 0,
        backgroundColor: Colors.tealAccent,
      ),
      body: ReajusteDeSueldo(),
    );
  }
}

class Exercise6Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ejercicio 6',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        automaticallyImplyLeading: false, // Quita la flecha de volver
        elevation: 0,
        backgroundColor: Colors.tealAccent,
      ),
      body: CalculadorSueldo(),
    );
  }
}

