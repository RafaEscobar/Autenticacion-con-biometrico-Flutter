import 'package:finger_auth/screens/dashboard.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  //* Creamos una instancia de LocalAuthentication con la cual realizaremos 2 verificaciones.
  final LocalAuthentication localAuth = LocalAuthentication();

  //? Función de verificación
  void verify() async {
    /*
    * EL metodo canCheckBiometrics verifica si la autenticación con datos
    * biometricos esta habilitada/disponible en este momento
    ! Devuelve true si lo esta, y false si no lo esta
    */
    bool biometricAuthAvalible = await localAuth.canCheckBiometrics;
    if (biometricAuthAvalible) {
      /*
      * Lanzamos la verificación de datos viometricos agregando un mensaje
      * breve que nosotros consideremos
      */
      bool access = await localAuth.authenticate(
        localizedReason: 'Necesitamos verificar tu identidad'
      );
      /*
      * Si la verificación culmino satisfacoriamente nos redirige a otra screen
      * SI NO se logro autenticar al usuario, lanzara una excepción
      */
      if (access) {
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard(),)
          );
        }
      } else {
        throw 'Error, datos de acceso incorrectos';
      }
    } else {
      /*
      * Si no se tiene habilitada la verificación con datos biometricos
      * lanzara esta excepción
      */
      throw 'La autenticación con datos biometricos esta deshabilitada';
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: ElevatedButton.icon(
            onPressed: () => verify(),
            label: const Text('Autenticarme'),
            icon: const Icon(Icons.fingerprint),
          )
        ),
      ),
    );
  }
}