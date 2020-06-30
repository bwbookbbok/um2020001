import 'package:flutter/services.dart';
import 'package:flutter_fai_upgrade/flutter_fai_upgrade.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_fai_upgrade');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    FlutterFaiUpgrade.uMengInit("");
  });
}
