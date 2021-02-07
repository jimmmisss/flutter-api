import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_api/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final repository = TodoRepository(dio);

  test('Deve trazer uma lista de TodoModel', () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: jsonDecode(jsonData)));
    final list = await repository.fetchTodos();
    expect(list[1].title, 'quis ut nam facilis et officia qui');
  });
}

String jsonData = '''

[
  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
    "userId": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false
  },
  {
    "userId": 1,
    "id": 3,
    "title": "fugiat veniam minus",
    "completed": false
  },
  {
    "userId": 1,
    "id": 4,
    "title": "et porro tempora",
    "completed": true
  },
  {
    "userId": 1,
    "id": 5,
    "title": "laboriosam mollitia et enim quasi adipisci quia provident illum",
    "completed": false
  },
  {
    "userId": 1,
    "id": 6,
    "title": "qui ullam ratione quibusdam voluptatem quia omnis",
    "completed": false
  }
]

''';
