import 'package:flutter/cupertino.dart';

double screenWidth(BuildContext context)=>MediaQuery.of(context).size.width;
double screenHeight(BuildContext context)=>MediaQuery.of(context).size.height;

double widthOf(double width,BuildContext context)=>screenWidth(context)*(width/430);
double heightOf(double height,BuildContext context)=>screenHeight(context)*(height/932);