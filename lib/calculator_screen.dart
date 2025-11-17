import 'dart:developer' as dev;

import 'package:bmi_calculator/bmi_calculation.dart';
import 'package:bmi_calculator/converter/to_kg.dart';
import 'package:bmi_calculator/converter/to_meter.dart';
import 'package:bmi_calculator/widget/app_input_field.dart';
import 'package:flutter/material.dart';

enum HeightType { cm, feet_inch, meter }

enum WeightType { kg, pound }

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  HeightType? heightType = HeightType.cm;
  WeightType? weightType = WeightType.kg;
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _mheightController = TextEditingController();
  final TextEditingController _cmheightController = TextEditingController();
  final TextEditingController _inchheightController = TextEditingController();
  final TextEditingController _feetheightController = TextEditingController();

  Color categoryColor = const Color.fromARGB(0, 255, 86, 34);
  String _bmiResult = '';
  String? category;
  String categoryMessage = '';
  String underWeightMessage =
      ' You are underweight. You should eat more to gain weight.';
  String normalWeightMessage = ' You have a normal weight. Keep it up!';
  String overWeightMessage =
      ' You are overweight. You should eat less to lose weight.';
  String obeseWeightMessage =
      ' You are obese. You should start eating a healthy diet or you risk health problems.';
  String impossibleWeightMessage =
      'You have entered a value which is impossible with human physiology. Please enter a value that is realistic to human physiology.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("Weight Type:"),
            SegmentedButton<WeightType>(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.deepOrange.shade100,
                ),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
              ),
              segments: [
                ButtonSegment<WeightType>(
                  label: Text("Kilogram (kg)"),
                  value: WeightType.kg,
                ),
                ButtonSegment<WeightType>(
                  label: Text("Pound (lb)"),
                  value: WeightType.pound,
                ),
              ],
              selected: {weightType!},
              onSelectionChanged: (value) {
                setState(() {
                  weightType = value.first;
                });
              },
            ),
            SizedBox(height: 10),
            if (weightType == WeightType.kg) ...[
              AppInputFieldstyle(
                labelText: "Enter Weight (KG)",
                controller: _weightController,
                textInputType: TextInputType.number,
              ),
            ] else ...[
              AppInputFieldstyle(
                labelText: "Enter Weight (pound)",
                controller: _weightController,
                textInputType: TextInputType.number,
              ),
            ],
            const SizedBox(height: 10),
            Text("Height Type:"),
            SegmentedButton<HeightType>(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.deepOrange.shade100,
                ),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
              ),
              segments: [
                ButtonSegment<HeightType>(
                  label: Text("Meter (m)"),
                  value: HeightType.meter,
                ),
                ButtonSegment<HeightType>(
                  label: Text("Centimeter (cm)"),
                  value: HeightType.cm,
                ),
                ButtonSegment<HeightType>(
                  label: Text("Feet-Inch (ft-in)"),
                  value: HeightType.feet_inch,
                ),
              ],
              selected: {heightType!},
              onSelectionChanged: (value) {
                setState(() {
                  heightType = value.first;
                });
              },
            ),
            SizedBox(height: 10),
            if (heightType == HeightType.meter) ...[
              AppInputFieldstyle(
                labelText: "Enter Height (meter)",
                controller: _mheightController,
                textInputType: TextInputType.number,
              ),
            ] else if (heightType == HeightType.cm) ...[
              AppInputFieldstyle(
                labelText: "Enter Height (cm)",
                controller: _cmheightController,
                textInputType: TextInputType.number,
              ),
            ] else ...[
              Row(
                children: [
                  Expanded(
                    child: AppInputFieldstyle(
                      labelText: "Enter Height (feet)",
                      controller: _feetheightController,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppInputFieldstyle(
                      labelText: "Enter Height (inch)",
                      controller: _inchheightController,
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  const Color.fromARGB(255, 255, 132, 94),
                ),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
              ),
              onPressed: () {
                double? weight;
                double weight2 = 0;
                double? height;
                double? height2;
                double height3 = 0;

                if (weightType == WeightType.kg) {
                  if (_weightController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter a valid weight value"),
                      ),
                    );
                    return;
                  }
                  weight = double.tryParse(_weightController.text.trim());
                  weight2 = weight as double;
                } else if (weightType == WeightType.pound) {
                  if (_weightController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter a valid weight value"),
                      ),
                    );
                    return;
                  }
                  weight = ToKilogram.poundToKg(
                    double.tryParse(_weightController.text.trim()),
                  );
                  weight2 = weight as double;
                }
                if (heightType == HeightType.meter) {
                  if (_mheightController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter a valid height value"),
                      ),
                    );
                    return;
                  }
                  height = double.tryParse(_mheightController.text.trim());
                  height3 = height as double;
                } else if (heightType == HeightType.cm) {
                  if (_cmheightController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter a valid height value"),
                      ),
                    );
                    return;
                  }
                  height = double.tryParse(_cmheightController.text.trim());
                  height3 = height as double;
                } else if (heightType == HeightType.feet_inch) {
                  if (_feetheightController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter a valid height value"),
                      ),
                    );
                    return;
                  }
                  height = ToMeter.ftToMeter(
                    context,
                    double.tryParse(_feetheightController.text.trim()),
                  );
                  height2 = ToMeter.inchToMeter(
                    context,
                    double.tryParse(_inchheightController.text.trim()),
                  );

                  if (height == null || height <= 0) {
                    if (height2 == null || height2 <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter a valid height value"),
                        ),
                      );
                      return;
                    } else {
                      height = height2;
                    }
                  } else if (height2 != null && height2 > 0) {
                    height = height + height2;
                  }

                  height3 = height;
                }
                BmiCalculation bmiCalculation = BmiCalculation(
                  weight: weight2,
                  height: height3,
                );
                if (bmiCalculation.bmi_result < 6) {
                  category = "Impossible low value";
                  categoryColor = Colors.black;
                  categoryMessage = impossibleWeightMessage;
                } else if (bmiCalculation.bmi_result < 18.5) {
                  category = "Underweight";
                  categoryColor = Colors.blue;
                  categoryMessage = underWeightMessage;
                } else if (bmiCalculation.bmi_result < 25) {
                  category = "Normal";
                  categoryColor = Colors.green;
                  categoryMessage = normalWeightMessage;
                } else if (bmiCalculation.bmi_result < 30) {
                  category = "Overweight";
                  categoryColor = Colors.orange;
                  categoryMessage = overWeightMessage;
                } else if (bmiCalculation.bmi_result < 200) {
                  category = "Obese";
                  categoryColor = Colors.red;
                  categoryMessage = obeseWeightMessage;
                } else {
                  category = "Impossible high value";
                  categoryColor = Colors.black;
                  categoryMessage = impossibleWeightMessage;
                }

                _bmiResult = bmiCalculation.bmi_result
                    .toStringAsFixed(1)
                    .trim();
                dev.log(_bmiResult);
                setState(() {});
              },
              child: Text(
                "Calculate BMI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: categoryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_bmiResult.isNotEmpty) ...[
                        if (double.tryParse(_bmiResult)! < 6) ...[
                          Text(
                            "BMI: Impossible value",
                            style: TextStyle(color: Colors.white, fontSize: 26),
                          ),
                        ] else if (double.tryParse(_bmiResult)! > 200) ...[
                          Text(
                            "BMI: Impossible value",
                            style: TextStyle(color: Colors.white, fontSize: 26),
                          ),
                        ] else ...[
                          Text(
                            "BMI: $_bmiResult",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        if (category != null) ...[
                          Text(
                            "Category: $category",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                color: Colors.white.withAlpha(130),
                                width: 1,
                              ),
                              color: Colors.white.withValues(alpha: 0.2),
                            ),

                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              categoryMessage,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w100,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    blurRadius: 1.5,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        if (double.tryParse(_bmiResult)! > 6 &&
                            double.tryParse(_bmiResult)! < 200)
                          ...[],
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
