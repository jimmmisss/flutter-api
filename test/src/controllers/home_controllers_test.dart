import 'package:flutter_api/src/controllers/home_controller.dart';
import 'package:flutter_api/src/models/todo_model.dart';
import 'package:flutter_api/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController();

  test('Deve preencher variável todos', () async {
    when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.success);
    expect(controller.todos.isNotEmpty, true);
  });
}
