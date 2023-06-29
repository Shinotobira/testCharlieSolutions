import 'package:flutter/material.dart';
import 'package:testcharliesolutions/core/material_app/main_material_app.dart';

import 'core/di/injection_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjectionDependencies();
  runApp(const MainMaterialApp());
}
