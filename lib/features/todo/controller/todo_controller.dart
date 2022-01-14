import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../features.dart';

class TodoController extends StateNotifier<TodoListState> {
  TodoController(
    this._sharedPreferencesService,
  ) : super(TodoListInitial()) {
    loadLocalTodos();
  }

  final SharedPreferencesService _sharedPreferencesService;

  void loadLocalTodos() {
    final encodedTodos =
        _sharedPreferencesService.getTodosFromStorage ?? const [];
    final encodedDoneItems =
        _sharedPreferencesService.getDoneItemsFromStorage ?? const [];

    final todos = encodedTodos.map((todo) => Todo.fromJson(todo)).toList();
    final doneItems =
        encodedDoneItems.map((todo) => Todo.fromJson(todo)).toList();
    state = TodoListSuccess(todos: todos, doneItems: doneItems);
  }

  Future<void> addTodo(Todo todo) async {
    if (state is! TodoListSuccess) {
      return;
    }
    final currentState = state as TodoListSuccess;
    final newTodos = [...currentState.todos, todo];
    final newEncodedTodos = newTodos.map((todo) => todo.toJson()).toList();

    try {
      await _sharedPreferencesService.updateTodoList(newEncodedTodos);
    } on Failure catch (e) {
      state = TodoListError(error: e.message);
      return;
    }

    final newState = currentState.copyWith(todos: newTodos);

    state = newState;
  }

  Future<void> markTodoAsDone(Todo todo) async {
    if (state is! TodoListSuccess) {
      return;
    }
    final currentState = state as TodoListSuccess;
    final currentTodos = currentState.todos;
    currentTodos.remove(todo);
    final newEncodedTodos = currentTodos.map((todo) => todo.toJson()).toList();
    try {
      await _sharedPreferencesService.updateDoneItemsList([
        ..._sharedPreferencesService.getDoneItemsFromStorage ?? [],
        todo.toJson()
      ]);
      await _sharedPreferencesService.updateTodoList(newEncodedTodos);
    } on Failure catch (e) {
      state = TodoListError(error: e.message);
      return;
    }

    final newDoneItems = _sharedPreferencesService.getDoneItemsFromStorage
            ?.map((todo) => Todo.fromJson(todo))
            .toList() ??
        const [];

    state = currentState.copyWith(
      todos: currentTodos,
      doneItems: newDoneItems,
    );
  }

  Future<void> deleteTodoFromDoneItems(Todo todo) async {
    if (state is! TodoListSuccess) {
      return;
    }
    final currentState = state as TodoListSuccess;
    final currentDoneItems = currentState.doneItems;
    currentDoneItems.remove(todo);
    final newEncodedDoneItems =
        currentDoneItems.map((todo) => todo.toJson()).toList();
    try {
      await _sharedPreferencesService.updateDoneItemsList(newEncodedDoneItems);
    } on Failure catch (e) {
      state = TodoListError(error: e.message);
      return;
    }
    state = currentState.copyWith(
      doneItems: currentDoneItems,
    );
  }
}
