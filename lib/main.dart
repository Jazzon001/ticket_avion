import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ticket_list.dart';
import '/ticket_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TicketProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket Avión App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicketList(),  // Aquí se mostrará la lista de tickets
    );
  }
}
