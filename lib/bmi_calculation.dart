class BmiCalculation {
  BmiCalculation({required this.height, required this.weight}) {}

  final double height;
  final double weight;
  double get bmi_result => weight / height / height;
}
