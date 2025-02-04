import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MyCal")),
      resizeToAvoidBottomInset: false, 
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
                radius: 40,
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
                child: const Text("Ubah Profil"),
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
