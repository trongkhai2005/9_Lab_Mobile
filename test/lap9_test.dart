import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/lap9.dart'; // Đổi tên project của bạn ở đây

void main() {
  // --- PHẦN 1: UNIT TEST (Kiểm tra não bộ của App) ---
  group('Kiểm tra Logic WeatherModel', () {
    final weatherModel = WeatherModel();

    test('1. Kiểm tra icon trả về đúng mã code WeatherAPI', () {
      expect(weatherModel.getWeatherIcon(1000), '☀️');
      expect(weatherModel.getWeatherIcon(1183), '☔️');
      expect(weatherModel.getWeatherIcon(1135), '🌫');
    });

    test('2. Kiểm tra thông điệp theo nhiệt độ', () {
      expect(weatherModel.getMessage(30), contains('🍦'));
      expect(weatherModel.getMessage(15), contains('🧥'));
    });
  });

  // --- PHẦN 2: WIDGET TEST (Kiểm tra Giao diện & Chuyển màn hình) ---
  group('Kiểm tra Luồng Giao diện Lab 9', () {

    testWidgets('3. Kiểm tra trạng thái Loading và các nút bấm chính', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(const Clima());

        // Kiểm tra vòng xoay lúc khởi động
        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        // Đợi 2 giây để thoát khỏi trạng thái Loading (nhảy vào catch do không có GPS thật)
        await tester.pump(const Duration(seconds: 2));

        // Kiểm tra xem 2 nút bấm GPS và City có xuất hiện không
        expect(find.byIcon(Icons.near_me), findsWidgets);
        expect(find.byIcon(Icons.location_city), findsWidgets);
      });
    });

    testWidgets('4. Kiểm tra luồng chuyển màn hình CityScreen', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(const Clima());

        // Đợi app load xong
        await tester.pump(const Duration(seconds: 2));

        // Nhấn vào nút chọn thành phố (location_city)
        await tester.tap(find.byIcon(Icons.location_city));

        // pumpAndSettle để đợi hiệu ứng chuyển màn hình hoàn tất
        await tester.pumpAndSettle();

        // Kiểm tra xem đã sang màn hình CityScreen chưa (tìm TextField)
        expect(find.byType(TextField), findsOneWidget);
        expect(find.text('Nhập tên thành phố (vd: Hanoi)'), findsOneWidget);

        // Kiểm tra nút quay lại
        expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
      });
    });
  });
}