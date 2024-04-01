import 'package:desafio_flutter_ambisis/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  Future<void> signOut() async {
    await AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: signOut,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        textStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      child: const Text(
        'Sign out',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
