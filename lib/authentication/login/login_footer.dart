import 'package:shreyas/authentication/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: 30.0 - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage("assets/images/signInWithGoogle.png"), width: 20.0,),
            onPressed: () {},
            label: const Text("Sign-In with google"),
          ),
        ),
        const SizedBox(height: 30.0 - 20),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) => const SignUpScreen()));
          },
          child: Text.rich(
            TextSpan(
                text: "Don't hava an account",
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(text: " Signup", style: TextStyle(color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }
}