import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';  // Asegúrate de importar esto
import 'ticket_model.dart';

class TicketProvider extends ChangeNotifier {  // Cambiar "with" a "extends"
  final CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('TicketAvion');

  Future<void> addTicket(TicketAvion ticket) async {
    await ticketCollection.add(ticket.toMap());
    notifyListeners();  // Llamar a notifyListeners() para actualizar los listeners
  }

  Stream<List<TicketAvion>> getTickets() {
    return ticketCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TicketAvion.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<void> updateTicket(TicketAvion ticket) async {
    await ticketCollection.doc(ticket.id).update(ticket.toMap());
    notifyListeners();  // Notificar cambios después de la actualización
  }

  Future<void> deleteTicket(String id) async {
    await ticketCollection.doc(id).delete();
    notifyListeners();  // Notificar cambios después de eliminar el ticket
  }
}
