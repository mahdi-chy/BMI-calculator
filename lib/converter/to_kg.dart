class ToKilogram {
  static double? poundToKg(double? pound) {
    if (pound == null || pound <= 0) {
      return null;
    }
    return pound * 0.45359237;
  }
}
