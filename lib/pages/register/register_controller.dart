import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "You need to fill username");
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: "You need to fill email");
      return;
    }

    if (userName.isEmpty) {
      toastInfo(msg: "You need to fill password");
      return;
    }

    if (userName.isEmpty) {
      toastInfo(msg: "You password confirmation is wrong");
      return;
    }

    if (password.compareTo(rePassword) != 0) {
      toastInfo(msg: "You password and password confirmation is not match");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);

        String photoUrl = "uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(msg: "An email verification has been sent to your email");
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The account already exists for that email");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email format is wrong");
      }
    }
  }
}
