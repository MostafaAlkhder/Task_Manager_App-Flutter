import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/shared/network/local/remote/dependeny_initializer.dart';
import 'package:task_manager_app/pages/loginScreen.dart';
import 'package:task_manager_app/provider/addTaskProvider.dart';
import 'package:task_manager_app/provider/authProvider.dart';
import 'package:task_manager_app/provider/homeProvider.dart';
import 'package:task_manager_app/provider/taskProvider.dart';
import 'package:task_manager_app/styles/themes.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await DependenyInitializer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeProvider>(create: (_) => HomeProvider()),
        Provider<AuthProvider>(create: (_) => AuthProvider()),
        Provider<TaskProvider>(create: (_) => TaskProvider()),
        Provider<AddTaskProvider>(create: (_) => AddTaskProvider()),
      ],
      child: MaterialApp(
          title: 'Project Name',
          theme: Themes.mainTheme,
          // darkTheme: Themes.darkTheme,,
          home: Scaffold(
            body: ChangeNotifierProvider<AuthProvider>(
              create: (context) => AuthProvider(),
              child: LoginScreen(),
            ),
          )),
    );
  }
}
