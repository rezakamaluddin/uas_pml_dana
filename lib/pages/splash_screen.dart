import 'package:flutter/material.dart';
import 'dart:async'; // Untuk `Future.delayed`

import 'login_page.dart'; // Import halaman login

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigasi ke halaman login setelah 5 detik
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF004AAD), // Warna latar belakang biru gelap
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo di tengah
          Expanded(
            flex: 7,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey[700],
                radius: 50, // Ukuran lingkaran
                child: const Icon(
                  Icons.waves, // Ganti dengan ikon/logo lain jika diperlukan
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
          // Teks kecil di bawah layar
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "DANA Indonesia terdaftar dan diawasi\noleh Bank Indonesia dan Kominfo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                // Logo Bank Indonesia dan Kominfo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/bank_indonesia_logo.jpeg', // Tambahkan logo Bank Indonesia
                      height: 25,
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/kominfo_logo.jpeg', // Tambahkan logo Kominfo
                      height: 25,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
