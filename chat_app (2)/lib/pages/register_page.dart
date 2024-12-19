import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_text.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    //get auth service
    final _auth = AuthService();

//if the user can log in
    if (_pwController.text == _confirmpwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
      }

      //if not
      else 
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Passwords don't match"),
              ));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message_rounded,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 20,
            ),
            MyText(
                hinttext: "Email",
                obscureText: false,
                controller: _emailController),
            SizedBox(
              height: 20,
            ),
            MyText(
                hinttext: "Password",
                obscureText: true,
                controller: _pwController),
            SizedBox(
              height: 20,
            ),
            MyText(
                hinttext: "Confirm Password",
                obscureText: true,
                controller: _confirmpwController),
            SizedBox(
              height: 20,
            ),
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
