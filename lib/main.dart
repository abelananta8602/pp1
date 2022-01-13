import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bmicalculator(),
    );
  }
}

class bmicalculator extends StatefulWidget {
  const bmicalculator({Key? key}) : super(key: key);

  @override
  _bmicalculatorState createState() => _bmicalculatorState();
}

class _bmicalculatorState extends State<bmicalculator> {
  int currentindex = 0;
  String result = "";
  double height = 0;
  double weight = 0;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Kalkulator Kesehatan",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton("Man", Colors.blue, 0),
                  radioButton("Woman", Colors.pink, 1),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your Height in cm :",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: heightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your height in cm",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your weight in kg :",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: weightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your weight in kg",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      height = double.parse(heightController.value.text);
                      weight = double.parse(weightController.value.text);
                      calculateBmi(height, weight);
                    });
                  },
                  color: Colors.blue,
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Your BMI is :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "$result",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Void calculateBmi(double height, double weight) {
    Double finalresult = weight / (height * height);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        height: 80,
        child: FlatButton(
          color: currentindex == index ? color : Colors.grey[200],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
