import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'movie_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/Movies Posters.png",
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),

          SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                   Spacer(),

                   Text(
                     "onboarding_title".tr(),
                     style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                   SizedBox(height: 15),

                   Text("onboarding_desc".tr(),
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),

                   SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0xffF6BD00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  MoviePage(),
                          ),
                        );
                      },
                      child:  Text(
                        "explore_now".tr(),                        style: TextStyle(
                          color: Color(0xff121312),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,),
                      ),
                    ),
                  ),

                   SizedBox(height: 30),
                ],),
            ),),
        ],),
    );}}