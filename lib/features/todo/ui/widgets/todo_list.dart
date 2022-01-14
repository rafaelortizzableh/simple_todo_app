import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fallback_widget.dart';
import 'todo_list_tile.dart';
import '../../../features.dart';

class TodoList extends ConsumerWidget {
  const TodoList({Key? key, required this.typeOfTodo}) : super(key: key);
  final TypeOfTodo typeOfTodo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todoState = (ref.watch(todoControllerProvider) as TodoListSuccess);
    final listOfTodos =
        typeOfTodo == TypeOfTodo.todo ? todoState.todos : todoState.doneItems;
    return ListView.builder(
        itemBuilder: (context, index) =>
            TodoListTile(todo: listOfTodos[index]));
  }
}
