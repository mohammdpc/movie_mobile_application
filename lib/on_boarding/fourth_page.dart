import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/on_boarding/third_page.dart';

import 'last_page.dart';


class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          SizedBox.expand(
            child: Image.asset(
              "assets/images/xl_9419884_887ed6c7 1.png",
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
                vertical: 10,
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
                     "rate_review_title".tr(),                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                   SizedBox(height: 10),

                   Text(
                     "rate_review_desc".tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),

                   SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0xffF6BD00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  LastPage(),
                          ),
                        );},
                      child:  Text(
                        "next".tr(),                        style: TextStyle(
                          color: Color(0xff121312),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        side:  BorderSide(
                          color: Color(0xffF6BD00),
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  ThirdPage(),
                          ),
                        );},
                      child:  Text(
                        "back".tr(),                        style: TextStyle(
                          color: Color(0xffF6BD00),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),],
              ),
            ),
          ),],
      ),
    );}}