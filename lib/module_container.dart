import 'package:flutter_simple_dependency_injection/injector.dart';
import 'bloc/calculate_bloc.dart';

class ModuleContainer{
  static Injector injector = ModuleContainer().initialise(Injector());
  Injector initialise(Injector injector) {
    injector.map((injector) => CalculateBloc(), isSingleton: true);
    return injector;
  }
}