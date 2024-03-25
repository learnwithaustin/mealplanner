import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shreyas/screens/OnBoarding.dart';
import '../../constants/images.dart';
import '../../constants/sizes.dart';
import '../../constants/text.dart';
import '../../global/global.dart';
import '../../widgets/progress_dialog.dart';
import '../login/login_screen.dart';
import 'Signup_header.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  validateForm()
  {
  if(nameTextEditingController.text.length<3)
  {
  Fluttertoast.showToast(msg: "Name must be atleast 3 Characters");
  }
  else if(!emailTextEditingController.text.contains("@"))
  {
  Fluttertoast.showToast(msg: "Email address is not valid");
  }
  else if(phoneTextEditingController.text.isEmpty)
  {
  Fluttertoast.showToast(msg: "Phone Number is Required");
  }
  else if(passwordTextEditingController.text.length<8)
  {
  Fluttertoast.showToast(msg: "Password must be atleast 8 characters");
  }
  else
  {
  saveUserInfoNow();
  }
  }

  saveUserInfoNow() async
  {
  showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext c)
  {
  return ProgressDialog(message: "Processing, Please Wait...",);
  }
  );

  final User? firebaseUser = (
  await fAuth.createUserWithEmailAndPassword(
  email: emailTextEditingController.text.trim(),
  password: passwordTextEditingController.text.trim(),
  ).catchError((msg){
  Navigator.pop(context);
  Fluttertoast.showToast(msg: "Error: $msg");
  })
  ).user;

  if(firebaseUser != null)
  {
  Map userMap =
  {
  "id": firebaseUser.uid,
  "name": nameTextEditingController.text.trim(),
  "email": emailTextEditingController.text.trim(),
  "phone": phoneTextEditingController.text.trim(),
  };

  DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("users");
  driversRef.child(firebaseUser.uid).set(userMap);

  currentFirebaseUser = firebaseUser;
  Fluttertoast.showToast(msg: "Account has been created.");
  // ignore: use_build_context_synchronously
  Navigator.push(context, MaterialPageRoute(builder: (c)=> const OnBoarding()));
  }
  else
  {
  // ignore: use_build_context_synchronously
  Navigator.pop(context);
  Fluttertoast.showToast(msg: "Account has not been created.");
  }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const FormHeaderWidget(
                  image: "assets/images/Log in.png",
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  imageHeight: 0.15,
                ),
                TextFormField(
                  controller: nameTextEditingController,
                  decoration: const InputDecoration(
                      label: Text(tFullName),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_outline_rounded)),
                ),
                const SizedBox(height: tFormHeight - 20),
                TextFormField(
                  controller: emailTextEditingController,
                  decoration: const InputDecoration(
                      label: Text(tEmail),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                const SizedBox(height: tFormHeight - 20),
                TextFormField(
                  controller: phoneTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text(tPhoneNo),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.numbers)),
                ),
                const SizedBox(height: tFormHeight - 20),
                TextFormField(
                  controller: passwordTextEditingController,
                  decoration: const InputDecoration(
                      label: Text(tPassword),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.fingerprint)),
                ),
                const SizedBox(height: tFormHeight - 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      validateForm();
                    },
                    child: Text(tSignup.toUpperCase()),
                  ),
                ),

                const Text("OR"),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage(tGoogleLogoImage),
                      width: 20.0,
                    ),
                    label: Text(tSignInWithGoogle.toUpperCase()),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) => const LoginScreen()));
                  },
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: tAlreadyHaveAnAccount,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(text: tLogin.toUpperCase())
                  ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

