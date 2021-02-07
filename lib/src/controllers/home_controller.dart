import 'package:flutter_api/src/models/todo_model.dart';
import 'package:flutter_api/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _repository;

  HomeController([TodoRepository repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    todos = await _repository.fetchTodos();
  }
}
