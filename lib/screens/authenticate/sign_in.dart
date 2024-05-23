// import 'package:flutter/material.dart';
// import 'package:utaxi/services/auth.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({super.key});

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(241, 85, 25, 25),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(239, 205, 166, 166),
//         elevation: 0.0,
//         title: Text('Sign In Page to Crew'),
//       ),
//       body: Container(
//           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//           child: ElevatedButton(
//               child: Text('Sign In Anon'),
//               onPressed: () async {
//                 dynamic result = await _auth.signInAnon();
//                 if (result == null) {
//                   print('error sign in');
//                 } else {
//                   print('sign in');
//                   print(result.uid);
//                 }
//               })),
//     );
//   }
// }
