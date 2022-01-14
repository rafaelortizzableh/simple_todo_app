import 'package:shared_preferences/shared_preferences.dart';

import '../core.dart';

class SharedPreferencesService {
  final SharedPreferences prefs;

  SharedPreferencesService(this.prefs);

  List<String>? get getTodosFromStorage => prefs.getStringList('todos');
  List<String>? get getDoneItemsFromStorage => prefs.getStringList('doneItems');
  String? get getUserTheme => prefs.getString('selectedTheme');

  Future<bool> updateTodoList(List<String> todos) async {
    try {
      bool result = await prefs.setStringList('todos', todos);
      return result;
    } catch (e) {
      throw Failure(message: 'Could not save todos');
    }
  }

  Future<bool> updateDoneItemsList(List<String> doneItems) async {
    try {
      bool result = await prefs.setStringList('doneItems', doneItems);
      return result;
    } catch (e) {
      throw Failure(message: 'Could not save done items');
    }
  }

  Future<bool> setPreferredTheme(String theme) async {
    try {
      return await prefs.setString('selectedTheme', theme);
    } catch (e) {
      throw Failure(message: 'Could not save preferred theme');
    }
  }
}
