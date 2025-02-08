import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIUpdateScreen extends StatefulWidget {
  @override
  _BMIUpdateScreenState createState() => _BMIUpdateScreenState();
}

class _BMIUpdateScreenState extends State<BMIUpdateScreen> {
  double bmi = 22.3;
  String selectedUnit = "Metric";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Perbarui BMI")),
      body: SingleChildScrollView( 
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Usia"),
                  ),
                ),
                SizedBox(width: 10),
                Text("Tahun", style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),

            Row(
              children: [
                Text("Standar Ukuran:", style: TextStyle(fontSize: 16)),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedUnit,
                  items: [
                    DropdownMenuItem(child: Text("Metric"), value: "Metric"),
                    DropdownMenuItem(child: Text("Imperial"), value: "Imperial"),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedUnit = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),

            // Tinggi Badan Field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Tinggi Badan"),
                  ),
                ),
                SizedBox(width: 10),
                Text("CM", style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),

            // Berat Badan Field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Berat Badan"),
                  ),
                ),
                SizedBox(width: 10),
                Text("KG", style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),

            // Jenis Kelamin Field
            TextField(
              decoration: InputDecoration(labelText: "Jenis Kelamin"),
            ),
            SizedBox(height: 20),

            // BMI Gauge
            Container(
              height: 250, 
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    minimum: 15,
                    maximum: 45,
                    ranges: [
                      GaugeRange(startValue: 15, endValue: 18.4, color: Colors.blue, label: "Underweight"),
                      GaugeRange(startValue: 18.5, endValue: 24.9, color: Colors.green, label: "Normal"),
                      GaugeRange(startValue: 25, endValue: 29.9, color: Colors.yellow, label: "Overweight"),
                      GaugeRange(startValue: 30, endValue: 39.9, color: Colors.orange, label: "Obese"),
                      GaugeRange(startValue: 40, endValue: 45, color: Colors.red, label: "Morbidly Obese"),
                    ],
                    pointers: [
                      NeedlePointer(
                        value: bmi,
                        enableAnimation: true,
                        needleColor: Colors.black,
                        knobStyle: KnobStyle(color: Colors.black),
                      ),
                    ],
                    annotations: [
                      GaugeAnnotation(
                        widget: Text(
                          "Skor BMI: ${bmi.toStringAsFixed(1)}",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        positionFactor: 0.8,
                        angle: 90,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Simpan Button
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Simpan BMI"),
              ),
            ),
            SizedBox(height: 20), 
          ],
        ),
      ),
    );
  }
}
