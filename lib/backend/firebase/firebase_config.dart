import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBMid1eius9KZ8Jovk2yhM9IodCl2kwgT0",
            authDomain: "hrisocagroup.firebaseapp.com",
            projectId: "hrisocagroup",
            storageBucket: "hrisocagroup.appspot.com",
            messagingSenderId: "426535237705",
            appId: "1:426535237705:web:b28d5857127287a095e798",
            measurementId: "G-3N91XWWFSL"));
  } else {
    await Firebase.initializeApp();
  }
}
