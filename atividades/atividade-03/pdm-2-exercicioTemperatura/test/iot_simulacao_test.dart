import 'package:meu_app_web/meu_app_web.dart';
import 'package:test/test.dart';

void main() {
  test('main executa sem lançar exceções', () async {
    expect(() async => main(), returnsNormally);
  });
}
