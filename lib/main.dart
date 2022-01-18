import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/calculate_bloc.dart';
import 'module_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CalculateBloc, CalculateState>(
          bloc: ModuleContainer.injector.get<CalculateBloc>(),
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
                      ModuleContainer.injector.get<CalculateBloc>().add(const CalculateEvent());
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
