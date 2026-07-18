import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'next_page.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          SizedBox.expand(
            child: Image.asset(
              "assets/images/xl_848228_477d9240 1.png",
              fit: BoxFit.cover,
            ),
          ),

          Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color.fromARGB(120, 0, 0, 0),
                  Color.fromARGB(200, 0, 0, 0),
                  Colors.black,
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:  EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              decoration:  BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [


                   Text(
                     "discover_movies_title".tr(),                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                   SizedBox(height: 15),

                   Text(
                     "discover_movies_desc".tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),

                   SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
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
                            builder: (context) =>  NextPage(),
                          ),
                        );
                      },
                      child:  Text(
                        "next".tr(),                        style: TextStyle(
                          color: Color(0xff121312),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }}