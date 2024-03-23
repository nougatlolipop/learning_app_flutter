import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/values/constants.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/sign_in/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SigninBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
        }

        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
            return;
          }

          var user = credential.user;
          if (user != null) {
            Global.storageService
                .setString(AppConstans.STORAGE_USER_TOKEN_KEY, "12346789");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for thet email");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for that user");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email format is wrong");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
