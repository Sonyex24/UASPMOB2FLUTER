import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TambahItemScreen extends StatefulWidget {
  const TambahItemScreen({super.key});

  @override
  _TambahItemScreenState createState() => _TambahItemScreenState();
}

class _TambahItemScreenState extends State<TambahItemScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController calorieController = TextEditingController();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Item")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: _selectedImage == null
                  ? Icon(Icons.camera_alt, size: 100, color: Colors.grey)
                  : Image.file(_selectedImage!, height: 100),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Pilih Gambar"),
            ),
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Nama Item")),
            TextField(controller: calorieController, decoration: InputDecoration(labelText: "Jumlah Kalori")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menyimpan item
              },
              child: Text("Tambah Item"),
            )
          ],
        ),
      ),
    );
  }
}
