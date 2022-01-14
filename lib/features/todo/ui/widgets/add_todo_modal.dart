import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../features.dart';

class AddTodoModal extends StatefulWidget {
  const AddTodoModal({
    Key? key,
  }) : super(key: key);

  @override
  _AddTodoModalState createState() => _AddTodoModalState();
}

class _AddTodoModalState extends State<AddTodoModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.newTodo,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: TextField(
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                textInputAction: TextInputAction.next,
                controller: _descriptionController,
                decoration: InputDecoration(hintText: l10n.todoTitleHint),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: TextField(
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                controller: _descriptionController,
                onSubmitted: (text) => Navigator.pop(context, text),
                decoration: InputDecoration(hintText: l10n.todoDescriptionHint),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: ElevatedButton.icon(
                onPressed: () {
                  final newTodo = Todo(
                    description: _descriptionController.text,
                    title: _titleController.text,
                    done: false,
                  );
                  Navigator.pop(context, newTodo);
                },
                icon: const Icon(CupertinoIcons.add_circled_solid),
                label: Text(l10n.addTodo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
