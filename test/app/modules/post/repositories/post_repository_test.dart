import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:weddy/app/modules/post/repositories/post_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  PostRepository repository;
  MockClient client;

  setUp(() {
    repository = PostRepository();
    client = MockClient();
  });

  group('PostRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<PostRepository>());
    });

    test('returns a Post if the http call completes successfully', () async {
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer(
              (_) async => Response(data: {'title': 'Test'}, statusCode: 200));
      Map<String, dynamic> data = await repository.fetchPost(client);
      expect(data['title'], 'Test');
    });
  });
}
