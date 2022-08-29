import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:silicon_village/shared/auth/auth_controller.dart';
import 'package:silicon_village/shared/model/user_model.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSingIn(BuildContext context) async {
    GoogleSignIn _googleSingIn = GoogleSignIn(scopes: ['email']);

    try {
      final response = await _googleSingIn.signIn();
      final user =
          UserModel(name: response!.displayName!, photoURL: response.photoUrl!);
      authController.setUser(context, user);
      // print(response);

    } catch (err) {
      print(err);
    }
  }
}
