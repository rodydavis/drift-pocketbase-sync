import 'package:flutter/widgets.dart';

class Provider<T> extends InheritedWidget implements ValueProvider<T> {
  const Provider({
    super.key,
    required this.value,
    required super.child,
  });

  @override
  final T value;

  static T? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<T>>()?.value;
  }

  @override
  bool updateShouldNotify(Provider<T> oldWidget) {
    return value != oldWidget.value;
  }
}

class ValueProvider<T> {
  ValueProvider({
    required this.value,
  });

  final T value;
}

class MultiProvider extends StatelessWidget {
  const MultiProvider({
    super.key,
    required this.providers,
    required this.child,
  });

  final List<ValueProvider> providers;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget root = child;
    for (final provider in providers) {
      root = Provider(
        value: provider.value,
        child: child,
      );
    }
    return root;
  }
}
