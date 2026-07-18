import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/data/constants/imdb_genres.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/cubit/main_page_view_mode;.dart';
import 'package:movie/home/home_page/widgets/genre_widget/widgets/see_more_widget.dart';

import '../../../../../core/utils/app_styles.dart';

class GenreTitleBar extends StatefulWidget {
  final String title;
  const GenreTitleBar({super.key, required this.title});

  @override
  State<GenreTitleBar> createState() => _GenreTitleBarState();
}

class _GenreTitleBarState extends State<GenreTitleBar> {
  late MainPageViewModel mainViewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainViewModel = context.read<MainPageViewModel>();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.calcOnWidth(8)),
      child: Row(
        children: [
          Expanded(child: Text(widget.title,style: AppStyles.regular20White,)),
          SeeMoreWidget(onPress: () {
            mainViewModel.changeIndex(index: 2,browse: ImdbGenres.all.indexOf(widget.title));
          },),
        ],
      ),
    );
  }
}
