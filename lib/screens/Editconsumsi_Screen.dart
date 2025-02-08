import 'package:flutter/material.dart';

class EditKonsumsiScreen extends StatelessWidget {
  final Map<String, dynamic> item;
  const EditKonsumsiScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    TextEditingController consumptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Edit Konsumsi")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              color: Colors.blueAccent,
              child: ListTile(
                leading: Image.asset(item['image']),
                title: Text(item['name'], style: TextStyle(color: Colors.white)),
                subtitle: Text("${item['calories']} Kalori/Bungkus", style: TextStyle(color: Colors.white)),
              ),
            ),
            TextField(controller: consumptionController, decoration: InputDecoration(labelText: "Jumlah Konsumsi")),
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