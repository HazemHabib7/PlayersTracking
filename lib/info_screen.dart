import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Terms and Privace Policy",
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'images/Damascus_University.png',
                      width: 150.0,
                      height: 150.0,

                    ),
                  ),

                  Center(
                    child: Text("Damascus University",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Informed Consent, Terms of Service and Privace Policy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),),
                    ),
                  ),
                  SizedBox(height: 8.0),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Title of the project:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text(" Players Tracking",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Principal Investigators:",
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text("Hazem Habib, Mohammad Anas Twati, Department of Computers Engineering in Damascus University",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),),

                      ],
                    ),
                  ),


                  SizedBox(height: 20.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Purpose of the study:",
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text("Analyse football video of a match",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),),

                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("Version:",
                  //         // textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           fontSize: 18.0,
                  //           fontWeight: FontWeight.bold,
                  //         ),),
                  //       Text(" 1.0",
                  //         style: TextStyle(
                  //           fontSize: 16.0,
                  //           fontWeight: FontWeight.w400,
                  //         ),),
                  //
                  //     ],
                  //   ),
                  // ),
                  Center(
                    child: Text("(This version doesn't support all football teams)",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),),
                  ),



                  Center(child: Image.asset('images/background.png',width: 480.0,height: 480.0,)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
