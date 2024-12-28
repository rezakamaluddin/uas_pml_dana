import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterPage({super.key});

  void register(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Parse response jika registrasi berhasil
        final data = jsonDecode(response.body);
        final token = data['token'];
        print("Registration successful. Token: $token");

        // Kembali ke halaman login
        Navigator.pop(context);
      } else {
        // Tampilkan pesan error jika registrasi gagal
        final errorData = jsonDecode(response.body);
        showError(context, errorData['error']);
      }
    } catch (e) {
      // Handle error saat tidak ada koneksi atau lainnya
      showError(context, "An error occurred. Please try again.");
    }
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => register(context),
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
