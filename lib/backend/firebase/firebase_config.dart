import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDgStaaENSXV5qm1NGbFDy1a3yIRDNHa08",
            authDomain: "bank-g6jqpj.firebaseapp.com",
            projectId: "bank-g6jqpj",
            storageBucket: "bank-g6jqpj.appspot.com",
            messagingSenderId: "685297662197",
            appId: "1:685297662197:web:fc0259534c7395f707edbc"));
  } else {
    await Firebase.initializeApp();
  }
}
