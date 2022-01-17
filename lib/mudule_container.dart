import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:sample_dependence_injection/bloc/calculate_bloc.dart';

class ModuleContainer{
  Injector initialise(Injector injector) {
    injector.map((injector) => CalculateBloc(), isSingleton: true);
    return injector;
  }
}