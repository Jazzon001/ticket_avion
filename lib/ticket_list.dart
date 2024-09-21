import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ticket_provider.dart';  // Importa el provider adecuado
import '/ticket_model.dart';  // Importa tu modelo de datos

class TicketList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tickets de Avión'),
      ),
      body: StreamBuilder<List<TicketAvion>>(
        stream: Provider.of<TicketProvider>(context).getTickets(),
        builder: (context, snapshot) {
          // Si hay datos, construir la lista
          if (snapshot.hasData) {
            final tickets = snapshot.data!;

            return ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return ListTile(
                  title: Text('Vuelo: ${ticket.numeroVuelo}'),
                  subtitle: Text('Aerolínea: ${ticket.aerolinea}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<TicketProvider>(context, listen: false)
                          .deleteTicket(ticket.id);
                    },
                  ),
                  onTap: () {
                    // Puedes agregar funcionalidad para editar el ticket aquí
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar tickets.'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
