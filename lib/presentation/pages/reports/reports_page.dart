import 'package:fibble_app/presentation/widgets/navbar/navbar.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Halo'
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}