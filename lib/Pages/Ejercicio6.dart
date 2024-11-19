import 'package:flutter/material.dart';

class CalculadorSueldo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculadorSueldoState();
}

class CalculadorSueldoState extends State<CalculadorSueldo> {
  final TextEditingController _sueldoBaseController = TextEditingController();
  final TextEditingController _horasExtraNormalController = TextEditingController();
  final TextEditingController _horasExtraNocturnosController = TextEditingController();

  double _sueldoTotal = 0.0;

  // Función para calcular el sueldo total
  void _calcularSueldo() {
    setState(() {
      double sueldoBase = double.tryParse(_sueldoBaseController.text) ?? 0;
      double horasExtraNormal = double.tryParse(_horasExtraNormalController.text) ?? 0;
      double horasExtraNocturno = double.tryParse(_horasExtraNocturnosController.text) ?? 0;

      if (horasExtraNormal > 24 || horasExtraNocturno > 24) {
        _mostrarError(context, "Las horas no pueden ser mayores a 24");
        return;
      }
      if (horasExtraNormal < 0 || horasExtraNocturno < 0) {
        _mostrarError(context, "Las horas no pueden ser menores a 0");
        return;
      }
      double valorNormal = horasExtraNormal * 2000;
      double valorNocturno = horasExtraNocturno * 2000 * 1.3;

      _sueldoTotal = sueldoBase + valorNocturno + valorNormal;
    });
  }

  void _limpiarCampos() {
    setState(() {
      _sueldoBaseController.clear();
      _horasExtraNormalController.clear();
      _horasExtraNocturnosController.clear();
      _sueldoTotal = 0.0;
    });
  }

  void _mostrarError(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: const Text(
          'Error',
          style: TextStyle(color: Colors.red),
        ),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cerrar',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  // Diseño de los inputs
  Widget _designInput({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF7077A1)),
          prefixIcon: Icon(
            icon,
            color: const Color(0xFF7077A1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF7077A1), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo de Sueldo Semanal"),
        backgroundColor: Colors.tealAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              _designInput(
                controller: _sueldoBaseController,
                label: "Ingrese su sueldo base",
                icon: Icons.attach_money,
              ),
              _designInput(
                controller: _horasExtraNormalController,
                label: "Ingrese su cantidad de horas extraordinarias normales",
                icon: Icons.access_time,
              ),
              _designInput(
                controller: _horasExtraNocturnosController,
                label: "Ingrese su cantidad de horas extraordinarias nocturnas",
                icon: Icons.nightlight_round,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _calcularSueldo,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CAF50),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        "Calcular Sueldo",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _limpiarCampos,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF7043),
                        foregroundColor: Colors.white,
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFE1F5FE),
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
                    const Text(
                      "Sueldo Total Semanal",
                      style: TextStyle(
                        color: Color(0xFF0277BD),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$${_sueldoTotal.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Color(0xFF01579B),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sueldoBaseController.dispose();
    _horasExtraNormalController.dispose();
    _horasExtraNocturnosController.dispose();
    super.dispose();
  }
}
