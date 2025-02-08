import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mycalapp/screens/UpdateBmi_Screen.dart';

class BMICheckScreen extends StatelessWidget {
  final List<FlSpot> bmiData = [
    FlSpot(1, 20.0),
    FlSpot(2, 19.5),
    FlSpot(3, 19.2),
    FlSpot(4, 19.8),
    FlSpot(5, 19.6),
    FlSpot(6, 19.9),
    FlSpot(7, 20.1),
  ];

  BMICheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cek BMI")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("Skor BMI terakhir", style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text("19.6", style: TextStyle(color: Colors.white, fontSize: 24)),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: LineChart(
                      LineChartData(
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: bmiData,
                            isCurved: true,
                            color: Colors.white,
                            dotData: FlDotData(show: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMIUpdateScreen()),
              ),
              child: Text("Perbarui BMI"),
            )
          ],
        ),
      ),
    );
  }
}