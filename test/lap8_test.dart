import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/lap8.dart'; // Đảm bảo đường dẫn này đúng với project của bạn

void main() {
  group('Kiểm tra giao diện Lab 8 (Widget Tests)', () {

    testWidgets('1. Kiểm tra tiêu đề và các thành phần chính', (WidgetTester tester) async {
      await tester.pumpWidget(const BMICalculator());

      // Kiểm tra tiêu đề trên AppBar
      expect(find.text('BMI CALCULATOR'), findsOneWidget);

      // Kiểm tra sự tồn tại của các nhãn quan trọng
      expect(find.text('HEIGHT'), findsOneWidget);
      expect(find.text('WEIGHT'), findsOneWidget);
      expect(find.text('AGE'), findsOneWidget);

      // Kiểm tra nút bấm CALCULATE
      expect(find.text('CALCULATE'), findsOneWidget);
    });

    testWidgets('2. Kiểm tra điều hướng sang trang kết quả', (WidgetTester tester) async {
      await tester.pumpWidget(const BMICalculator());

      // Nhấn vào nút CALCULATE
      await tester.tap(find.text('CALCULATE'));

      // Chờ cho hiệu ứng chuyển trang (Navigator) hoàn tất
      await tester.pumpAndSettle();

      // Kiểm tra xem trang kết quả (ResultsPage) đã hiện ra chưa
      expect(find.text('Your Result'), findsOneWidget);
      expect(find.text('RE-CALCULATE'), findsOneWidget);
    });
  });

  group('Kiểm tra logic tính toán (Unit Tests)', () {
    test('3. Kiểm tra công thức BMI từ CalculatorBrain', () {
      // Giả sử: Cao 180cm, Nặng 70kg
      // BMI = 70 / (1.8 * 1.8) ≈ 21.6
      final calc = CalculatorBrain(height: 180, weight: 70);

      String result = calc.calculateBMI();

      expect(result, '21.6');
      expect(calc.getResult(), 'Normal');
    });

    test('4. Kiểm tra phân loại thừa cân', () {
      // Giả sử: Cao 160cm, Nặng 90kg -> BMI cao
      final calc = CalculatorBrain(height: 160, weight: 90);

      calc.calculateBMI();
      expect(calc.getResult(), 'Overweight');
    });
  });
}