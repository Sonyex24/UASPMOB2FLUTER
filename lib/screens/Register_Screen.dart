import 'package:flutter/material.dart';
import 'login_Screen.dart'; // Pastikan untuk mengimport MenuPage

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyCal"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigasi kembali ke halaman MenuPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Login_Screen()), // Ganti dengan MenuPage
            );
          },
        ),
      ),
      resizeToAvoidBottomInset: true, // Agar UI bisa menyesuaikan saat keyboard muncul
      body: SingleChildScrollView( // Membungkus konten dengan SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 40,
                child: const Icon(Icons.camera_alt, size: 40, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              _buildTextField("Nama Lengkap"),
              _buildTextField("Jenis Kelamin"),
              _buildTextField("Umur"),
              _buildTextField("Email"),
              _buildTextField("Password", isPassword: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Daftar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: label,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
