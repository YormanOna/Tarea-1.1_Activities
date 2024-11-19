import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrdenarNumeros extends StatefulWidget {
  @override
  _OrdenarNumerosState createState() => _OrdenarNumerosState();
}

class _OrdenarNumerosState extends State<OrdenarNumeros> {
  final TextEditingController _numero1Controller = TextEditingController();
  final TextEditingController _numero2Controller = TextEditingController();
  final TextEditingController _numero3Controller = TextEditingController();

  List<double> _numeros = [];
  List<double> _numerosOrdenados = [];

  // Definición de colores variados
  static const Color colorVerde = Color(0xFF4CAF50);    // Verde suave
  static const Color colorRosa = Color(0xFFE91E63);     // Rosa claro
  static const Color colorNaranja = Color(0xFFFF9800);  // Naranja suave
  static const Color colorPrincipal = Colors.tealAccent;//

  void _ordenarNumeros() {
    setState(() {
      _numeros = [
        double.tryParse(_numero1Controller.text) ?? 0,
        double.tryParse(_numero2Controller.text) ?? 0,
        double.tryParse(_numero3Controller.text) ?? 0,
      ];
      _numerosOrdenados = List.from(_numeros);
      _ordenarMetodoBurbuja(_numerosOrdenados);
    });
  }

  void _ordenarMetodoBurbuja(List<double> arreglo) {
    int n = arreglo.length;
    for (int j = 0; j < n - 1; j++) {
      for (int k = 0; k < n - j - 1; k++) {
        if (arreglo[k] > arreglo[k + 1]) {
          double temp = arreglo[k];
          arreglo[k] = arreglo[k + 1];
          arreglo[k + 1] = temp;
        }
      }
    }
  }

  void _limpiarCampos() {
    setState(() {
      _numero1Controller.clear();
      _numero2Controller.clear();
      _numero3Controller.clear();
      _numeros = [];
      _numerosOrdenados = [];
    });
  }

  @override
  void dispose() {
    _numero1Controller.dispose();
    _numero2Controller.dispose();
    _numero3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Ordenamiento de Números',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: colorPrincipal,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '¡Ordena tus números!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildNumberInput(
              controller: _numero1Controller,
              label: "Primer número",
              icon: Icons.looks_one,
              color: colorVerde,
            ),
            _buildNumberInput(
              controller: _numero2Controller,
              label: "Segundo número",
              icon: Icons.looks_two,
              color: colorRosa,
            ),
            _buildNumberInput(
              controller: _numero3Controller,
              label: "Tercer número",
              icon: Icons.looks_3,
              color: colorNaranja,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    onPressed: _ordenarNumeros,
                    icon: const Icon(Icons.sort),
                    label: const Text(
                      "Ordenar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrincipal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _limpiarCampos,
                    icon: const Icon(Icons.refresh),
                    label: const Text(
                      "Limpiar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 1,
                    ),
                  ),
                ),
              ],
            ),
            if (_numeros.isNotEmpty) ...[
              const SizedBox(height: 32),
              _buildResultCard(
                title: "Números Ingresados",
                numeros: _numeros,
                icon: Icons.format_list_numbered,
                color: colorVerde,
              ),
              const SizedBox(height: 16),
              _buildResultCard(
                title: "Números Ordenados",
                numeros: _numerosOrdenados,
                icon: Icons.sort,
                color: colorRosa,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNumberInput({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        ],
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(
            icon,
            color: color,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: color.withOpacity(0.5), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: color.withOpacity(0.5), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: color, width: 2),
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildResultCard({
    required String title,
    required List<double> numeros,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: numeros.map((numero) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: color.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  numero.toString(),
                  style: TextStyle(
                    color: color.withAlpha(220),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}