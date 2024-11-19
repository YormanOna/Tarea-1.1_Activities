import 'package:flutter/material.dart';

class TrianguloCalculator extends StatefulWidget {
  @override
  _TrianguloCalculatorState createState() => _TrianguloCalculatorState();
}

class _TrianguloCalculatorState extends State<TrianguloCalculator> {
  final TextEditingController _lado1Controller = TextEditingController();
  final TextEditingController _lado2Controller = TextEditingController();
  final TextEditingController _lado3Controller = TextEditingController();
  String _resultado = "";
  String _mensajeError = "";
  String _tipoTriangulo = "";
  String _imagenTriangulo = "";

  // Función para obtener la imagen según el tipo de triángulo
  String _obtenerImagenTriangulo() {
    if (_tipoTriangulo.contains('Equilátero')) {
      return 'lib/img/triangulo_equilatero.png';
    } else if (_tipoTriangulo.contains('Isósceles')) {
      return 'lib/img/triangulo_isosceles.png';
    } else if (_tipoTriangulo.contains('Escaleno')) {
      return 'lib/img/triangulo_escaleno.png';
    }
    return '';
  }

  void _limpiarCampos() {
    setState(() {
      _lado1Controller.clear();
      _lado2Controller.clear();
      _lado3Controller.clear();
      _resultado = "";
      _mensajeError = "";
      _tipoTriangulo = "";
      _imagenTriangulo = "";
    });
  }

  void _determinarTriangulo() {
    setState(() {
      _mensajeError = "";
      _resultado = "";
      _tipoTriangulo = "";
      _imagenTriangulo = "";

      // Validar campos vacíos
      if (_lado1Controller.text.isEmpty ||
          _lado2Controller.text.isEmpty ||
          _lado3Controller.text.isEmpty) {
        _mensajeError = "Por favor, complete todos los campos";
        return;
      }

      // Convertir y validar que sean números
      double? lado1 = double.tryParse(_lado1Controller.text);
      double? lado2 = double.tryParse(_lado2Controller.text);
      double? lado3 = double.tryParse(_lado3Controller.text);

      if (lado1 == null || lado2 == null || lado3 == null) {
        _mensajeError = "Por favor, ingrese solo números válidos";
        return;
      }

      // Validar valores positivos
      if (lado1 <= 0 || lado2 <= 0 || lado3 <= 0) {
        _mensajeError = "Los lados del triángulo deben ser mayores que cero";
        return;
      }

      // Verificar si pueden formar un triángulo
      if ((lado1 + lado2 > lado3) &&
          (lado1 + lado3 > lado2) &&
          (lado2 + lado3 > lado1)) {
        _resultado = "¡Se puede formar un triángulo!";

        // Determinar tipo de triángulo
        if (lado1 == lado2 && lado2 == lado3) {
          _tipoTriangulo = "Triángulo Equilátero\n(Todos sus lados son iguales)";
        } else if (lado1 == lado2 || lado1 == lado3 || lado2 == lado3) {
          _tipoTriangulo = "Triángulo Isósceles\n(Dos lados son iguales)";
        } else {
          _tipoTriangulo = "Triángulo Escaleno\n(Todos sus lados son diferentes)";
        }

        // Asignar la imagen correspondiente
        _imagenTriangulo = _obtenerImagenTriangulo();
      } else {
        _mensajeError = "No se puede formar un triángulo con estas medidas\n" +
            "La suma de dos lados debe ser mayor al tercero";
      }
    });
  }

  @override
  void dispose() {
    _lado1Controller.dispose();
    _lado2Controller.dispose();
    _lado3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Determinador de Triángulos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.tealAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Ingrese las medidas de los tres lados del triángulo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2E7D32),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _lado1Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Primer lado",
                hintText: "Ingrese la medida",
                prefixText: "L1 = ",
                prefixIcon: Icon(Icons.straighten),
                labelStyle: TextStyle(color: Color(0xFF2E7D32)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF4CAF50), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2E7D32), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _lado2Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Segundo lado",
                hintText: "Ingrese la medida",
                prefixText: "L2 = ",
                prefixIcon: Icon(Icons.straighten),
                labelStyle: TextStyle(color: Color(0xFF2E7D32)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF4CAF50), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2E7D32), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _lado3Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Tercer lado",
                hintText: "Ingrese la medida",
                prefixText: "L3 = ",
                prefixIcon: Icon(Icons.straighten),
                labelStyle: TextStyle(color: Color(0xFF2E7D32)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF4CAF50), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2E7D32), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _determinarTriangulo,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4CAF50),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      'Determinar Triángulo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _limpiarCampos,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEF5350),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      'Limpiar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (_mensajeError.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFEF5350)),
                  ),
                  child: Text(
                    _mensajeError,
                    style: TextStyle(
                      color: Color(0xFFD32F2F),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            if (_resultado.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFF4CAF50)),
                      ),
                      child: Text(
                        _resultado,
                        style: TextStyle(
                          color: Color(0xFF2E7D32),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFF4CAF50)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            _tipoTriangulo,
                            style: TextStyle(
                              color: Color(0xFF2E7D32),
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (_imagenTriangulo.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Image.asset(
                                _imagenTriangulo,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}