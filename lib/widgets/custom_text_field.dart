import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_styles.dart';
import '../core/utils/app_assets.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextStyle? hintStyleDark;
  final TextStyle? textStyle;
  final double verticalPadding;

  // New Color Attributes for Icons
  final Color? prefixColorDark;
  final Color? suffixColorDark;

  final double borderRadius;
  final EdgeInsetsGeometry suffixPadding;
  final EdgeInsetsGeometry prefixPadding;
  final double minHeight;
  final dynamic suffixIcon;
  final dynamic prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool isEnabled;
  void Function(String)? onChanged;
  bool obscure;
  bool isPassword;


  CustomTextField({
    super.key,
    this.hintText,
    this.hintStyleDark,
    this.textStyle,
    this.prefixColorDark,
    this.suffixColorDark,
    this.borderRadius = 15.0,
    this.suffixPadding = const EdgeInsets.only(left: 16,right: 16),
    this.prefixPadding = const EdgeInsets.only(left: 16,right: 16),
    this.minHeight = 24.0,
    this.verticalPadding = 0,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.obscure = false,
    this.isPassword = false,
    this.maxLines,
    this.isEnabled = true,
    this.onChanged
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      enabled: widget.isEnabled,
      // onTapOutside: (event) {
      //   FocusManager.instance.primaryFocus?.unfocus();
      // },
      maxLines: widget.maxLines ?? 1,
      obscureText: widget.obscure,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      style: widget.textStyle??AppStyles.regular20White,
      cursorColor: AppColors.accentYellow,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: widget.verticalPadding),
        filled: true,
        fillColor: AppColors.darkGray,

        enabledBorder: _buildBorder(),
        disabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        errorBorder: _buildBorder(borderColor: AppColors.red),
        focusedErrorBorder: _buildBorder(borderColor: AppColors.red),

        hintText: widget.hintText ?? "",
        hintStyle: widget.hintStyleDark??AppStyles.regular15White,

        prefixIcon: _getIcon(widget.prefixIcon,  false),
        suffixIcon: _getIcon(widget.suffixIcon, true),

        prefixIconConstraints: BoxConstraints(minHeight: widget.minHeight),
        suffixIconConstraints: BoxConstraints(minHeight: widget.minHeight),
      ),
    );
  }

  Widget? _getIcon(dynamic iconSource, bool isSuffix) {
    if (iconSource == null) return null;

    Color iconColor;
    if (isSuffix) {
      iconColor = widget.suffixColorDark??AppColors.white;
    } else {
      iconColor = widget.prefixColorDark??AppColors.white;
    }
    Widget child;
    if (iconSource is String) {
      child = SvgPicture.asset(
        iconSource,
        //colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      );
    } else if (iconSource is Widget) {
      child = IconTheme(
        data: IconThemeData(color: iconColor),
        child: iconSource,
      );
    } else {
      return null;
    }
    if (widget.isPassword && isSuffix) {
      return GestureDetector(
        onTap: () {
          widget.obscure = !widget.obscure;
          setState(() {

          });
        },
        child: Padding(
            padding: isSuffix ? widget.suffixPadding : widget.prefixPadding,
            child: SvgPicture.asset(
              widget.obscure ? AppAssets.eyeSlashIcon : AppAssets.eyeIcon,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            )
        ),
      );
    }
    else {
      return Padding(
        padding: isSuffix ? widget.suffixPadding : widget.prefixPadding,
      child: child,
    );
    }
  }

  OutlineInputBorder _buildBorder({Color borderColor = AppColors.darkGray}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(width: 1, color: borderColor),
    );
  }


}