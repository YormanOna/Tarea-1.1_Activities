import 'package:flutter/material.dart';
import 'dart:math';

class EcuacionSegundoGrado extends StatefulWidget {
  @override
  _EcuacionSegundoGradoState createState() => _EcuacionSegundoGradoState();
}

class _EcuacionSegundoGradoState extends State<EcuacionSegundoGrado> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  String _resultado = "";
  String _mensajeError = "";

  void _limpiarCampos() {
    setState(() {
      _aController.clear();
      _bController.clear();
      _cController.clear();
      _resultado = "";
      _mensajeError = "";
    });
  }

  void _calcularRaices() {
    setState(() {
      _mensajeError = "";
      _resultado = "";

      // Validar que los campos no estén vacíos
      if (_aController.text.isEmpty || _bController.text.isEmpty || _cController.text.isEmpty) {
        _mensajeError = "Por favor, complete todos los campos";
        return;
      }

      // Convertir y validar los valores
      double? a = double.tryParse(_aController.text);
      double? b = double.tryParse(_bController.text);
      double? c = double.tryParse(_cController.text);

      if (a == null || b == null || c == null) {
        _mensajeError = "Por favor, ingrese solo números válidos";
        return;
      }

      // Validar si es una ecuación de segundo grado
      if (a == 0) {
        _resultado = "El coeficiente A no puede ser cero.\nNo corresponde a una ecuación de segundo grado.";
        return;
      }

      // Calcular el discriminante
      double discriminante = (b * b) - (4 * a * c);

      // Verificar si hay soluciones imaginarias
      if (discriminante < 0) {
        _resultado = "La ecuación tiene soluciones imaginarias\nDiscriminante = $discriminante";
      } else {
        // Calcular las raíces
        double raiz1 = (-b + sqrt(discriminante)) / (2 * a);
        double raiz2 = (-b - sqrt(discriminante)) / (2 * a);

        _resultado = "Soluciones encontradas:\n\n"
            "X₁ = ${raiz1.toStringAsFixed(4)}\n"
            "X₂ = ${raiz2.toStringAsFixed(4)}";
      }
    });
  }

  @override
  void dispose() {
    _aController.dispose();
    _bController.dispose();
    _cController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Ecuación de Segundo Grado',
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
                color: Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Ingrese los coeficientes de la ecuación:\nAx² + Bx + C = 0',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1565C0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _aController,
              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
              decoration: InputDecoration(
                labelText: "Coeficiente A",
                hintText: "Ingrese el valor de A",
                prefixText: "A = ",
                labelStyle: TextStyle(color: Color(0xFF1565C0)),
                prefixIcon: Icon(Icons.calculate_outlined, color: Color(0xFF1565C0)),  // Icono agregado
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2196F3), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF1565C0), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _bController,
              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
              decoration: InputDecoration(
                labelText: "Coeficiente B",
                hintText: "Ingrese el valor de B",
                prefixText: "B = ",
                labelStyle: TextStyle(color: Color(0xFF1565C0)),
                prefixIcon: Icon(Icons.calculate, color: Color(0xFF1565C0)),  // Icono agregado
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2196F3), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF1565C0), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _cController,
              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
              decoration: InputDecoration(
                labelText: "Coeficiente C",
                hintText: "Ingrese el valor de C",
                prefixText: "C = ",
                labelStyle: TextStyle(color: Color(0xFF1565C0)),
                prefixIcon: Icon(Icons.functions, color: Color(0xFF1565C0)),  // Icono agregado
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2196F3), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF1565C0), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calcularRaices,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2196F3),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      'Calcular Raíces',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _limpiarCampos,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE57373),
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
                        color: Colors.white,
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
                    border: Border.all(color: Color(0xFFE57373)),
                  ),
                  child: Text(
                    _mensajeError,
                    style: TextStyle(
                      color: Color(0xFFD32F2F),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            if (_resultado.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFF81C784)),
                  ),
                  child: Text(
                    _resultado,
                    style: TextStyle(
                      color: Color(0xFF388E3C),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
