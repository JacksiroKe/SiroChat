import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPrefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPrefs;
  final FirebaseFirestore fbFirestore = FirebaseFirestore.instance;
  final FirebaseStorage fbStorage = FirebaseStorage.instance;

  MyApp({Key? key, required this.sharedPrefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(
            firebaseAuth: FirebaseAuth.instance,
            googleSignIn: GoogleSignIn(),
            prefs: sharedPrefs,
            firebaseFirestore: fbFirestore,
          ),
        ),
        Provider<SettingProvider>(
          create: (_) => SettingProvider(
            prefs: sharedPrefs,
            firebaseFirestore: fbFirestore,
            firebaseStorage: fbStorage,
          ),
        ),
        Provider<HomeProvider>(
          create: (_) => HomeProvider(
            firebaseFirestore: fbFirestore,
          ),
        ),
        Provider<ChatProvider>(
          create: (_) => ChatProvider(
            prefs: sharedPrefs,
            firebaseFirestore: fbFirestore,
            firebaseStorage: fbStorage,
          ),
        ),
      ],
      child: MaterialApp(
        title: AppConstants.appTitle,
        theme: appThemeData[AppTheme.main],
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
