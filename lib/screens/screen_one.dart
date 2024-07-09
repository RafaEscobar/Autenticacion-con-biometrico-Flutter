import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: () => (),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Autenticar'),
                Icon(
                  Icons.fingerprint
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}