import 'package:flutter/material.dart';
class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int currentIndex = 0;
  String result = "";
  double height=0;
  double weight=0;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Color(0xfffafafa),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.blue, 0),
                    radioButton("Women", Colors.pink, 1),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Your height in CM :",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: heightController,
                  decoration: InputDecoration(
                      hintText: "Your height in Cm",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Your Weight in Kg :",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: weightController,
                  decoration: InputDecoration(
                      hintText: "Your Weight in Kg",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      setState((){
                        height = double.parse(heightController.value.text);
                        weight = double.parse(weightController.value.text);
                      });

                      calculateBmi(height, weight);
                    },
                    color: Colors.blue,
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Your BMI is : ",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "$result",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi(double height, double weight) {
    double finalResult = weight / (height * height/10000);
    String bmi = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          // ignore: deprecated_member_use
          height: 80.0,
          child: FlatButton(
            onPressed: () {
              // when we click the button the current index will have the value of the buttons index
              changeIndex(index);
            },
            color: currentIndex == index ? color : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              value,
              style: TextStyle(
                color: currentIndex == index ? Colors.white : color,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
