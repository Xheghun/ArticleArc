import 'package:article_finder/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class BlockProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  BlockProvider({
    Key? key,
    required this.bloc,
    required this.child
  }) : super(key: key);

  static T of<T extends Bloc>(BuildContext context) {
    final BlockProvider<T> provider = context.findAncestorWidgetOfExactType()!;

    return provider.bloc;
  }

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlockProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

}