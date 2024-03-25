import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: const AssetImage("assets/images/Log in.png"),
            height: size.height * 0.2),
        Text("Welcome Back", style: Theme.of(context).textTheme.displayLarge),
        Text("Get updates, Stay informed", style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}