import 'package:fibble_app/presentation/widgets/navbar/navbar.dart';
import 'package:flutter/material.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({super.key});

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
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