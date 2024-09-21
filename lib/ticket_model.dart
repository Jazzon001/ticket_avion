class TicketAvion {
  String id;
  String numeroVuelo;
  String aerolinea;
  String pasajero;
  String origen;
  String destino;
  String asiento;
  String clase;

  TicketAvion({
    required this.id,
    required this.numeroVuelo,
    required this.aerolinea,
    required this.pasajero,
    required this.origen,
    required this.destino,
    required this.asiento,
    required this.clase,
  });

  Map<String, dynamic> toMap() {
    return {
      'numeroVuelo': numeroVuelo,
      'aerolinea': aerolinea,
      'pasajero': pasajero,
      'origen': origen,
      'destino': destino,
      'asiento': asiento,
      'clase': clase,
    };
  }

  static TicketAvion fromMap(String id, Map<String, dynamic> data) {
    return TicketAvion(
      id: id,
      numeroVuelo: data['numeroVuelo'],
      aerolinea: data['aerolinea'],
      pasajero: data['pasajero'],
      origen: data['origen'],
      destino: data['destino'],
      asiento: data['asiento'],
      clase: data['clase'],
    );
  }
}
