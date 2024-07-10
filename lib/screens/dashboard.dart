import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: Container(
        color: Colors.blueAccent,
        child: const Center(
          child: Text(
            'Acceso concedido 🎉🎉✨✨',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }


}