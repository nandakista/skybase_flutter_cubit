import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocView<T extends StateStreamableSource<Object?>>
    extends StatelessWidget {
  const BlocView({super.key});

  T bloc(BuildContext context, {bool listen = false}) =>
      BlocProvider.of<T>(context, listen: listen);

  @override
  Widget build(BuildContext context);
}
