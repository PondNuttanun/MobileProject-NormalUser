import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mosquito_project/pages/ar3dpage.dart';
import 'package:mosquito_project/pages/learningpage.dart';
import 'package:mosquito_project/pages/game.dart';
import 'package:mosquito_project/provider/internet_provider.dart';
import 'package:mosquito_project/provider/sign_in_provider.dart';
import 'package:mosquito_project/screens/account_screen.dart';
import 'package:mosquito_project/screens/home_screen.dart';
import 'package:mosquito_project/screens/login_screen.dart';
import 'package:mosquito_project/utils/theme.dart';
import 'screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => SignInProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => InternetProvider()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mosquitoTheme(),
        initialRoute: '/splashscreen',
        routes: {
          '/splashscreen': (context) => SplashScreen(),
          '/loginscreen': (context) => LoginScreen(),
          '/homescreen': (context) => HomeScreen(),
          '/accountscreen': (context) => AccountScreen(),
          '/ar3d': (context) => AR3Dpage(),
          '/game': (context) => Game(),
          '/learning': (context) => Learningpage(),
        },
      ),
    );
  }
}
