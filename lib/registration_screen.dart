import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen>  createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends  State<RegistrationScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 231, 109),
        title: const Text('Hab1t 4eak', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,),
      ),
      backgroundColor: const Color.fromARGB(255, 247, 245, 245),
    );
  }
}