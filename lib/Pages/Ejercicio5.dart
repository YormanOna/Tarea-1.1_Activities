import 'package:flutter/material.dart';

class ReajusteDeSueldo extends StatefulWidget {
  @override
  _ReajusteDeSueldoState createState() => _ReajusteDeSueldoState();
}

class _ReajusteDeSueldoState extends State<ReajusteDeSueldo> {
  final TextEditingController _sueldoController = TextEditingController();
  final TextEditingController _antiguedadController = TextEditingController();
  String _resultado = "";

  void _calcularReajuste() {
    setState(() {
      double sueldo = double.tryParse(_sueldoController.text) ?? 0;
      int antiguedad = int.tryParse(_antiguedadController.text) ?? 0;
      double reajuste = 0;
      String ajuste = "";

      if (sueldo <= 0) {
        _resultado = "El sueldo debe ser mayor que cero.";
        return;
      }

      if (antiguedad <= 0) {
        _resultado = "La antigüedad debe ser mayor que cero.";
        return;
      }

      if (antiguedad <= 10) {
        if (sueldo <= 300000) {
          ajuste = '12%';
          reajuste = sueldo * 0.12;
        } else if (sueldo > 300000 && sueldo <= 500000) {
          ajuste = '10%';
          reajuste = sueldo * 0.10;
        } else {
          ajuste = '8%';
          reajuste = sueldo * 0.08;
        }
      } else if (antiguedad > 10 && antiguedad < 20) {
        if (sueldo <= 300000) {
          ajuste = '14%';
          reajuste = sueldo * 0.14;
        } else if (sueldo > 300000 && sueldo <= 500000) {
          ajuste = '12%';
          reajuste = sueldo * 0.12;
        } else {
          ajuste = '10%';
          reajuste = sueldo * 0.10;
        }
      } else {
        ajuste = '15%';
        reajuste = sueldo * 0.15;
      }

      _resultado = "El porcentaje de ajuste es: $ajuste\n"
          "El reajuste es: \$${reajuste.toStringAsFixed(2)}\n"
          "El nuevo sueldo es: \$${(sueldo + reajuste).toStringAsFixed(2)}";
    });
  }

  void _limpiarCampos() {
    setState(() {
      _sueldoController.clear();
      _antiguedadController.clear();
      _resultado = "";
    });
  }

  @override
  void dispose() {
    _sueldoController.dispose();
    _antiguedadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reajuste de Sueldo'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _sueldoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingresar el sueldo",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                prefixIcon: Icon(Icons.attach_money, color: Colors.green),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _antiguedadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingresar años de antigüedad",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                prefixIcon: Icon(Icons.calendar_today, color: Colors.orange),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calcularReajuste,
                    child: Text('Calcular Reajuste'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7077A1),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _limpiarCampos,
                    child: Text('Limpiar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              _resultado,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
