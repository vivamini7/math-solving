import 'package:flutter/material.dart';
import 'package:temu_qanda/screens/upload_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              // const Text(
              //   'Temu에서 산',
              //   style: TextStyle(
              //     fontSize: 50,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              // const Text(
              //   'QANDA',
              //   style: TextStyle(
              //     fontSize: 70,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UploadScreen(),
                    ),
                  );
                },
                child: const Text(
                  '시작!',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
