import 'package:flutter/material.dart';

class TicketForm extends StatefulWidget {
  @override
  _TicketFormState createState() => _TicketFormState();
}

class _TicketFormState extends State<TicketForm> {
  // Llave del formulario para validaciones
  final _formKey = GlobalKey<FormState>();

  // Controladores para obtener los valores ingresados
  final TextEditingController _numeroVueloController = TextEditingController();
  final TextEditingController _aerolineaController = TextEditingController();
  final TextEditingController _pasajeroController = TextEditingController();

  @override
  void dispose() {
    // Limpiar los controladores cuando el widget sea destruido
    _numeroVueloController.dispose();
    _aerolineaController.dispose();
    _pasajeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Ticket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // Asociar la llave al formulario
          key: _formKey,
          child: Column(
            children: [
              // Campo para Número de Vuelo
              TextFormField(
                controller: _numeroVueloController,
                decoration: InputDecoration(labelText: 'Número de Vuelo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el número de vuelo';
                  }
                  return null;
                },
              ),
              // Campo para Aerolínea
              TextFormField(
                controller: _aerolineaController,
                decoration: InputDecoration(labelText: 'Aerolínea'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la aerolínea';
                  }
                  return null;
                },
              ),
              // Campo para Pasajero
              TextFormField(
                controller: _pasajeroController,
                decoration: InputDecoration(labelText: 'Pasajero'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del pasajero';
                  }
                  return null;
                },
              ),
              // Botón para Guardar
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Si el formulario es válido, mostrar un mensaje
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Guardando Ticket...')),
                    );

                    // Aquí puedes agregar la lógica para guardar los datos
                    // en Firebase u otro lugar
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
