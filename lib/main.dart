import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/app/app.dart';
import 'package:target_sistemas_prova/app/data/dependencies/dependencies_injection.dart';

void main() {
  DependenciesInjection.setup();
  runApp(const App());
}
