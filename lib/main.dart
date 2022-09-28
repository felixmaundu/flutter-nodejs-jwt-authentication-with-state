import 'package:flutter/material.dart';
import 'package:project8/constants/global_variables.dart';
import 'package:project8/features/auth/auth_screen.dart';
import 'package:project8/features/home/HomeScreen.dart';
import 'package:project8/features/services/auth_service.dart';
import 'package:project8/providers/user_provider.dart';
import 'package:project8/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'authentication',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true, // can remove this line
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
      // Provider.of<UserProvider>(context).user.token.isNotEmpty
      //     ? Provider.of<UserProvider>(context).user.type == 'user'
      //         ? const HomeScreen()
      //         : const AdminScreen()
      //     : const AuthScreen(),
    );
  }
}
