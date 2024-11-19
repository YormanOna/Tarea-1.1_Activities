import 'package:flutter/material.dart';

class CamisasPage extends StatefulWidget {
  @override
  _CamisasPageState createState() => _CamisasPageState();
}

class _CamisasPageState extends State<CamisasPage> {
  final TextEditingController _camisasController = TextEditingController();
  double _costoTotal = 0.0;
  String _mensajeError = '';

  void _calcularCostoTotal() {
    setState(() {
      // Limpiar mensaje de error previo
      _mensajeError = '';

      // Validar que el campo no esté vacío
      if (_camisasController.text.isEmpty) {
        _mensajeError = 'Por favor, ingrese un número de camisas';
        _costoTotal = 0.0;
        return;
      }

      // Intentar convertir el texto a número
      int? numeroCamisas = int.tryParse(_camisasController.text);

      // Validar que sea un número válido
      if (numeroCamisas == null) {
        _mensajeError = 'Por favor, ingrese solo números';
        _costoTotal = 0.0;
        return;
      }

      // Validar que no sea número negativo
      if (numeroCamisas <= 0) {
        _mensajeError = 'El número de camisas debe ser mayor a 0';
        _costoTotal = 0.0;
        return;
      }

      // Cálculo del costo según la cantidad de camisas
      if (numeroCamisas > 3) {
        _costoTotal = numeroCamisas * 4000.0;
      } else {
        _costoTotal = numeroCamisas * 4800.0;
      }
    });
  }

  void _limpiarCampos() {
    setState(() {
      _camisasController.clear();
      _costoTotal = 0.0;
      _mensajeError = '';
    });
  }

  @override
  void dispose() {
    _camisasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Costo de Camisas'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _camisasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingrese el número de camisas",
                labelStyle: TextStyle(color: Color(0xFF4ECDC4)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF4ECDC4), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFFF6B6B), width: 2),
                ),
                errorText: _mensajeError.isNotEmpty ? _mensajeError : null,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                prefixIcon: Icon(
                  Icons.add_shopping_cart,
                  color: Color(0xFF4ECDC4),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calcularCostoTotal,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4ECDC4),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      "Calcular Costo Total",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
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
                      backgroundColor: Color(0xFFFF6B6B),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      "Limpiar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            if (_costoTotal > 0)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4ECDC4), Color(0xFF2AB7CA)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "El costo total de la compra es:",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$${_costoTotal.toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
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