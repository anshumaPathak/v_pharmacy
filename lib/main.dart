// import 'package:flutter/material.dart';
// import 'package:v_pharmashing/res/sizing_const.dart';
// import 'package:v_pharmashing/utils/routes/routes.dart';
//
// void main() {
//   setUrlStrategy(PathUrlStrategy());
//   runApp(const MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Sizes.init(context);
//     return MaterialApp.router(
//       routerConfig: AppRouter.router,
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       // home: DashboardScreen(),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; // 👈 ye add karo for PathUrlStrategy
import 'package:v_pharmashing/res/sizing_const.dart';
import 'package:v_pharmashing/utils/routes/routes.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'V PharmaShing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
      builder: (context, child) {
        Sizes.init(context);
        return child!;
      },
    );
  }
}
