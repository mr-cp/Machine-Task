import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'screens/controller/home_controller.dart';

import 'screens/view/homesceen_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(const MyApp(),
    // DevicePreview(
    //   enabled: true,
    //   builder: (BuildContext context) =>
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeController())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'monk_maze - MT',
        home: HomeScreenContainer(),
      ),
    );
  }
}
