import 'package:flutter/material.dart';
import 'package:mycalapp/screens/Editcalori_Screen.dart';
import 'package:mycalapp/screens/Addcalori_Screen.dart';

class DataKaloriScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'name': 'Indomie', 'calories': 320, 'image': 'assets/indomie.png'},
    {'name': 'Nasi', 'calories': 204, 'image': 'assets/nasi.png'},
    {'name': 'Chiken', 'calories': 274, 'image': 'assets/ayam_dada.png'},
  ];
 DataKaloriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Kalori")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditItemScreen(item: items[index]),
              ),
            ),
            child: Card(
              color: Colors.blueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(items[index]['image'], height: 60),
                  Text(items[index]['name'], style: TextStyle(color: Colors.white)),
                  Text("${items[index]['calories']} Kalori", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          );
        },
      ),
floatingActionButton: FloatingActionButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TambahItemScreen()),
    );
  },
  child: Icon(Icons.add),
),
    );
  }
}