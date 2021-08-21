import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  _StateLoginPage createState() => _StateLoginPage();
}

class _StateLoginPage extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 124,
          ),
          Image.asset('assets/images/logo.png', width: 251, height: 251),
          Container(
            margin: EdgeInsets.only(top: 18, bottom: 48, left: 26, right: 26),
            child: Column(
              children: [
                SizedBox(
                  height: 33,
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF253342)),
                ),
                SizedBox(
                  height: 75,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      child: TextButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            FirebaseService service = new FirebaseService();
                            try {
                              await service.signInwithGoogle();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/home', (route) => false);
                            } catch (e) {
                              if (e is FirebaseAuthException) {
                                showMessage(e.message!);
                              }
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 16))),
                          child: isLoading
                              ? CircularProgressIndicator()
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/google_logo.png',
                                        width: 40, height: 37),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Text(
                                      'Google Sign In',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3252DF)),
                                    )
                                  ],
                                )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
