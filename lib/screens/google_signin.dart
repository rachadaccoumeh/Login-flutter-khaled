
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}


















  // class Authentication {
  // static SnackBar customSnackBar({required String content}) {
  // return SnackBar(
  // backgroundColor: Colors.black,
  // content: Text(
  // content,
  // style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
  // ),
  // );
  // }
  // static Future<User?> signInWithGoogle({required BuildContext context}) async {
  // FirebaseAuth auth = FirebaseAuth.instance;
  // User? user;
  //
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  //
  // final GoogleSignInAccount? googleSignInAccount =
  // await googleSignIn.signIn();
  //
  // if (googleSignInAccount != null) {
  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //   await googleSignInAccount.authentication;
  //
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleSignInAuthentication.accessToken,
  //     idToken: googleSignInAuthentication.idToken,
  //   );
  //
  //   try {
  //     final UserCredential userCredential =
  //     await auth.signInWithCredential(credential);
  //
  //     user = userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'account-exists-with-different-credential') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         Authentication.customSnackBar(
  //           content:
  //           'The account already exists with a different credential.',
  //         ),
  //       );
  //     } else if (e.code == 'invalid-credential') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         Authentication.customSnackBar(
  //           content:
  //           'Error occurred while accessing credentials. Try again.',
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       Authentication.customSnackBar(
  //         content: 'Error occurred using Google Sign-In. Try again.',
  //       ),
  //     );
  //   }
  // }
  //
  // }
  //
  // }



// final GoogleSignIn googleSignIn = GoogleSignIn();
//
// Future<String> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication =
//     await googleSignInAccount.authentication;
//
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );
//
//     final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
//     final User user = authResult.user;
//
//     assert(!user.isAnonymous);
//     assert(await user.getIdToken() != null);
//
//     final User currentUser = FirebaseAuth.instance.currentUser;
//     assert(user.uid == currentUser.uid);
//
//     return 'signInWithGoogle succeeded: $user';
//   } catch (e) {
//     return 'signInWithGoogle failed: $e';
//   }
// }







