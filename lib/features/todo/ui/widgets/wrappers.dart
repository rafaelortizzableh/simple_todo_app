import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_rafa/features/todo/ui/widgets/fallback_widget.dart';

import '../../../../core/core.dart';
import '../../../features.dart';
import 'todo_list.dart';

class TodosListWrapper extends ConsumerWidget {
  const TodosListWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todoState = ref.watch(todoControllerProvider);
    if (todoState is TodoListInitial) {
      return const LoaderWidget();
    } else if (todoState is TodoListError) {
      return LocalErrorWidget(errorText: todoState.error ?? 'Error');
    } else {
      return (todoState as TodoListSuccess).todos.isEmpty
          ? const FallbackWidget(typeOfTodo: TypeOfTodo.todo)
          : const TodoList(typeOfTodo: TypeOfTodo.todo);
    }
  }
}

class DoneItemsListWrapper extends ConsumerWidget {
  const DoneItemsListWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todoState = ref.watch(todoControllerProvider);
    if (todoState is TodoListInitial) {
      return const LoaderWidget();
    } else if (todoState is TodoListError) {
      return LocalErrorWidget(errorText: todoState.error ?? 'Error');
    } else {
      return (todoState as TodoListSuccess).doneItems.isEmpty
          ? const FallbackWidget(typeOfTodo: TypeOfTodo.done)
          : const TodoList(typeOfTodo: TypeOfTodo.done);
    }
  }
}
