import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/routes/bloc_observer.dart';
import 'package:learning_app/services/storage_service.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyGlobalObserver();

    Platform.isAndroid
        ? await Firebase.initializeApp(
            options: const FirebaseOptions(
              apiKey: "AIzaSyCVZtnXwvKGk1WNR8CFTibQJOlDK_j8NyM",
              appId: "1:287248674371:android:6a74622be66d804cbc2ef6",
              messagingSenderId: "287248674371",
              projectId: "ulearning-app-2caf8",
            ),
          )
        : await Firebase.initializeApp();

    storageService = await StorageService().init();
  }
}
