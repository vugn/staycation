import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  _StateOnboardingScreen createState() => _StateOnboardingScreen();
}

class _StateOnboardingScreen extends State<OnboardingScreen> {
  User? result = FirebaseAuth.instance.currentUser;

  PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    if (result != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _controller,
      children: [
        Column(children: [
          SizedBox(
            height: 53,
          ),
          Image.asset('assets/images/onboarding_1.png',
              width: 375, height: 353),
          Container(
            width: 400,
            margin: EdgeInsets.only(top: 18, bottom: 48, left: 26, right: 26),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: 92,
                ),
                Text(
                  'Welcome!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF253342)),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 262,
                  margin: EdgeInsets.only(top: 18),
                  child: Text(
                    'welcome to Staycation, We provide what you need to enjoy your holiday with family. Time to make another memorable moments.',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF253342)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextButton(
                    onPressed: () {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.ease,
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF3252DF)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(
                                horizontal: 34, vertical: 16))),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ],
            ),
          ),
        ]),
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            height: 115,
          ),
          Image.asset('assets/images/onboarding_2.png',
              width: 375, height: 291),
          Container(
            margin: EdgeInsets.only(top: 0, left: 26, right: 26),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Text(
                  'Great Activities',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF253342)),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 262,
                  margin: EdgeInsets.only(top: 18),
                  child: Text(
                    'We have great activities around our staycation, invite your family to relax as well as an adventure!',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF253342)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24, top: 124),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/sign-in');
                        },
                      ),
                      TextButton(
                          onPressed: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 250),
                              curve: Curves.ease,
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF3252DF)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          horizontal: 34, vertical: 16))),
                          child: Text(
                            'Next >',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            height: 115,
          ),
          Image.asset('assets/images/onboarding_3.png',
              width: 375, height: 339),
          Container(
            width: 400,
            margin: EdgeInsets.only(top: 0, left: 26, right: 26),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Text(
                  'Around the World',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF253342)),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 262,
                  margin: EdgeInsets.only(top: 18),
                  child: Text(
                    'We are in many parts of the world, on vacation as well as adventures in new places? we are the solution!',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF253342)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 124, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/sign-in');
                        },
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/sign-in');
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF3252DF)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          horizontal: 34, vertical: 16))),
                          child: Text(
                            'Next >',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ],
    ));
  }
}
