import 'package:flutter/material.dart';
import 'package:movie/extensions/device_dimensions.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';

class BottomDialog {
  static void showGridBottomDialog(
    BuildContext context,
    int currentIconIndex,
    Function(int index) func,
  ) {
    showDialog(
      context: context,
      barrierColor: AppColors.black.withValues(alpha: 0.7),
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              top: context.height * 0.016,
              bottom: context.height * 0.016,
              left: context.width * 0.02,
              right: context.width * 0.02,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: context.height*0.5,
              ),
              child: Material(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(24),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 19,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    String iconPath = "${AppAssets.baseUrl}gamer${index + 1}.png";
                    return GestureDetector(
                      onTap: () {
                        func(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              currentIconIndex == index + 1
                                  ? AppColors.accentYellow.withValues(alpha: 0.56)
                                  : AppColors.transparentColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.accentYellow,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.only(
                          left: 9,
                          right: 13,
                          top: 9,
                          bottom: 10,
                        ),
                        child: Center(
                          child: Image.asset(iconPath, fit: BoxFit.fill,),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
