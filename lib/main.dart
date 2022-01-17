import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import 'package:sample_dependence_injection/bloc/calculate_bloc.dart';
import 'package:sample_dependence_injection/mudule_container.dart';

void main() {
  final injector = ModuleContainer().initialise(Injector());
  runApp(MyApp(injector: injector));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.injector,
  }) : super(key: key);

  final Injector injector;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CalculateBloc(),
        child: Home(injector: injector),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
    required this.injector,
  }) : super(key: key);

  final Injector injector;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CalculateBloc, CalculateState>(
          bloc: injector.get<CalculateBloc>(),
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Text(
                    state.value.toString(),
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      injector.get<CalculateBloc>().add(const CalculateEvent());
                    },
                    child: const Text(
                      'add',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
