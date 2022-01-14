import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum TypeOfTodo { done, todo }

const _size300 = 300.0;

class RiveAnimationWidget extends StatefulWidget {
  const RiveAnimationWidget({Key? key, required this.typeOfTodo})
      : super(key: key);
  final TypeOfTodo typeOfTodo;
  @override
  _RiveAnimationWidgetState createState() => _RiveAnimationWidgetState();
}

class _RiveAnimationWidgetState extends State<RiveAnimationWidget> {
  late RiveAnimationController _controller;
  @override
  void initState() {
    _controller = OneShotAnimation('Example', autoplay: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size300,
      height: _size300,
      child: RiveAnimation.asset(
        'assets/animations/my_avatar.riv',
        controllers: [_controller],
      ),
    );
  }
}

class FallbackWidget extends StatelessWidget {
  const FallbackWidget({Key? key, required this.typeOfTodo}) : super(key: key);
  final TypeOfTodo typeOfTodo;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RiveAnimationWidget(typeOfTodo: typeOfTodo),
          Text(
            typeOfTodo == TypeOfTodo.todo
                ? '${l10n?.noTodosYet}'
                : '${l10n?.allTodosDone}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
