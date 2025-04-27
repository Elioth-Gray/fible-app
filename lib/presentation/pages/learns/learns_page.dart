import 'package:fibble_app/presentation/widgets/navbar/navbar.dart';
import 'package:flutter/material.dart';

class LearnsPage extends StatefulWidget {
  const LearnsPage({super.key});

  @override
  State<LearnsPage> createState() => _LearnsPageState();
}

class _LearnsPageState extends State<LearnsPage> {
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