import 'package:flutter/material.dart';

class EditItemScreen extends StatelessWidget {
  final Map<String, dynamic> item;
  const EditItemScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: item['name']);
    TextEditingController calorieController = TextEditingController(text: item['calories'].toString());
    return Scaffold(
      appBar: AppBar(title: Text("Edit Item")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(item['image'], height: 100),
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Nama Item")),
            TextField(controller: calorieController, decoration: InputDecoration(labelText: "Jumlah Kalori")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Simpan Perubahan"),
            )
          ],
        ),
      ),
    );
  }
}