import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:github/config/constants.dart';
import 'package:github/screens/dashboard/dashboardProvider.dart';
import 'package:provider/provider.dart';

import 'common/themeData.dart';
import 'config/routes.dart';
import 'firebase_options.dart';
import 'common/connectivityProvider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //initialize main plugins,rendering engine before call an await function
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Constants.githubToken = await Constants.storage.read(key: 'githubtoken');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
        ChangeNotifierProvider(create: (context) => DashboardDataProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
