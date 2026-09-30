import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/lap2.dart';


void main() {
  testWidgets('MiCardApp UI Test', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const MiCardApp());

    // Kiểm tra thông tin sinh viên
    expect(find.text('Minh Nghĩa'), findsOneWidget);
    expect(find.text('23IT.B138'), findsOneWidget);

    // Kiểm tra nghề nghiệp
    expect(find.text('SINH VIÊN'), findsOneWidget);

    // Kiểm tra nội dung bài tập
    expect(find.text('Bài tập Flutter: 9 Labs'), findsOneWidget);

    // Kiểm tra icon mã sinh viên
    expect(find.byIcon(Icons.badge), findsOneWidget);

    // Kiểm tra icon khóa học
    expect(find.byIcon(Icons.school), findsOneWidget);

    // Kiểm tra avatar có tồn tại
    expect(find.byType(CircleAvatar), findsOneWidget);

    // Kiểm tra có 2 Card thông tin sinh viên
    expect(find.byType(Card), findsNWidgets(2));
  });
}
