import 'package:flutter/material.dart';

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pay")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Tambahkan logika pembayaran di sini
            print("Fitur pembayaran dipilih.");
          },
          child: const Text("Bayar Sekarang"),
        ),
      ),
    );
  }
}
