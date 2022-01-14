import '../../features.dart';

abstract class TodoListState {}

class TodoListInitial extends TodoListState {}

class TodoListError extends TodoListState {
  final String? error;
  TodoListError({this.error});
}

class TodoListSuccess extends TodoListState {
  final List<Todo> todos;
  final List<Todo> doneItems;

  TodoListSuccess({
    required this.todos,
    required this.doneItems,
  });

  TodoListSuccess copyWith({
    List<Todo>? todos,
    List<Todo>? doneItems,
  }) {
    return TodoListSuccess(
      todos: todos ?? this.todos,
      doneItems: doneItems ?? this.doneItems,
    );
  }
}
