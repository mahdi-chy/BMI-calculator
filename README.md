# bmi_calculator

A Flutter application to calculate Body Mass Index (BMI) with support for multiple units. This app allows users to input their weight and height in various metric and imperial units, and it displays the calculated BMI, the corresponding category, and a color indicator for that category.

## Features

- Weight Input: Enter weight in kilograms (kg) or pounds (lb).
- Height Input: Enter height in meters (m), centimeters (cm), or feet and inches (ft + in).
- Unit Conversion: Automatically converts all inputs to metric units for calculation.
- BMI Calculation: Calculates BMI and displays the result rounded to one decimal place.
- Result Categorization: Displays the BMI category (Underweight, Normal, Overweight, Obese).
- Color-Coded Results: Shows a colored card based on the BMI category for quick visual feedback.
- Input Validation: Provides user-friendly messages for invalid or empty inputs.

## BMI Formula and Unit Conversions

The BMI is calculated using the standard metric formula. All user inputs are first converted to metric units (kilograms and meters) before the calculation.

### BMI Formula
BMI = weight_kg / (height_m)²

### Unit Conversions Used
- Pounds to Kilograms: kg = lb × 0.45359237
- Centimeters to Meters: m = cm / 100
- Feet & Inches to Meters: m = (feet × 12 + inches) × 0.0254

## BMI Category and Color Mapping

The app categorizes the BMI score and assigns a specific color to each category for better visual understanding.

| Category    | BMI Range       | Color  |
|-------------|-----------------|--------|
| Underweight | < 18.5          | Blue   |
| Normal      | 18.5 – 24.9     | Green  |
| Overweight  | 25.0 – 29.9     | Orange |
| Obese       | ≥ 30.0          | Red    |

## How to Use the App

1.  Select your preferred unit for weight (kg or lb) using the toggle buttons.
2.  Enter your weight in the corresponding text field.
3.  Select your preferred unit for height (m, cm, or ft/in).
4.  Enter your height. If using ft/in, provide values for both feet and inches.
5.  As you type, the app automatically calculates and displays your BMI score.
6.  The result card at the bottom will update to show your final BMI, the corresponding health category (e.g., Normal, Overweight), and a color that visually represents that category.

## Screenshots

*(Add your app screenshots here)*

