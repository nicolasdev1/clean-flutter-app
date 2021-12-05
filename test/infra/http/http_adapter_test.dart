import 'package:faker/faker.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';

import 'package:flutter_test/flutter_test.dart';

class HttpAdapter {
  final ClientSpy client;

  HttpAdapter(this.client);

  Future<void> request({@required String url, @required String method}) async {
    await client.post(url);
  }
}

class ClientSpy extends Mock implements Client {}

void main() {
  group('POST', () {
    test('Should call POST with correct values', () async {
      final ClientSpy client = ClientSpy();
      final HttpAdapter sut = HttpAdapter(client);
      final String url = faker.internet.httpUrl();

      await sut.request(url: url, method: 'POST');

      verify(client.post(url));
    });
  });
}
