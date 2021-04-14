import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'file:///F:/Projects/Template/nakshatra_hospital_management/lib/screens/login.dart';
import 'screens/login.dart';
import 'package:nakshatra_hospital_management/services/auth.dart';
// import 'file:///F:/Projects/Template/nakshatra_hospital_management/lib/screens/homepage.dart';
import 'screens/homepage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final firebaseuser = context.watch<User>();
//     if (firebaseuser != null) {
//       return Homepage();
//     }
//     return Authenticate();
//   }
// }

    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(auth: FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Nakshatra Hospital',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        )),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return Homepage();
    }
    return Authenticate();
  }
}
