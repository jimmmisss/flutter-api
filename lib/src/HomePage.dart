import 'package:flutter/material.dart';

import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _success() {
    return ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          var todo = controller.todos[index];
          return ListTile(
            leading: Checkbox(
              onChanged: (bool value) {},
              value: todo.completed,
            ),
            title: Text(todo.title),
          );
        });
  }

  _error() {
    return Center(
      child: RaisedButton(
          onPressed: () {
            controller.start();
          },
          child: Text('Tentar novamente')),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      case HomeState.error:
        return _error();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Todo API'),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh_outlined),
              onPressed: () {
                controller.start();
              })
        ],
      ),
      body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) {
            return stateManagement(controller.state.value);
          }),
    );
  }
}
