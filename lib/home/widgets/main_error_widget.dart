import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/extensions/device_dimensions.dart';

import '../../lang/locale_keys.g.dart';


class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;
  const MainErrorWidget({super.key,required this.errorMessage,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: context.calcOnHeight(14),
        children: [
          Text(errorMessage,style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
          ElevatedButton(onPressed: onPressed, child: Text(LocaleKeys.try_again.tr())),
        ],
      ),
    );;
  }
}
