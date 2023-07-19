import 'package:flutter/material.dart';

class NotifierProvider<T extends ChangeNotifier>
    extends InheritedNotifier<ChangeNotifier> {
  const NotifierProvider({Key? key, required T value, required Widget child})
      : super(key: key, notifier: value, child: child);

  static T of<T extends ChangeNotifier>(BuildContext context,
      {bool listen = false}) {
    if (listen) {
      /// build work
      return context
          .dependOnInheritedWidgetOfExactType<NotifierProvider<T>>()!
          .notifier as T;
    } else {
      /// build not work
      return (context
          .getElementForInheritedWidgetOfExactType<NotifierProvider<T>>()!
          .widget as NotifierProvider<T>)
          .notifier as T;
    }
  }

  @override
  bool updateShouldNotify(NotifierProvider oldWidget) {
    return notifier != oldWidget.notifier;
  }
}

extension CustomContext on BuildContext {
  T watch<T extends ChangeNotifier>() {
    return NotifierProvider.of<T>(this, listen: true);
  }

  T read<T extends ChangeNotifier>() {
    return NotifierProvider.of<T>(this, listen: false);
  }
}

class Consumer<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(BuildContext context, T provider, Widget? child) builder;
  final Widget? child;
  const Consumer({super.key, this.child, required this.builder});

  @override
  Widget build(BuildContext context) {
    return builder(context,
      context.watch<T>(),
      child,
    );
  }
}
