import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/di.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/home_page/widgets/genre_widget/cubit/genre_state.dart';
import 'package:movie/home/home_page/widgets/genre_widget/cubit/genre_view_model.dart';
import 'package:movie/home/movie_details/movie_details_screen.dart';
import 'package:movie/home/widgets/loading_widget.dart';
import 'package:movie/home/widgets/main_error_widget.dart';
import '../../../../models/movie_response.dart';
import '../movie_child_widget.dart';
import 'widgets/genre_title_bar.dart';

class GenreWidget extends StatefulWidget {
  final List<Movies> moviesList;
  final String genre;
  const GenreWidget({super.key, required this.moviesList, required this.genre, });

  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.moviesList.isEmpty){
      return Text("No Available Movies Of This Genre");
    }
    return Column(
      spacing: context.calcOnHeight(12),
      children: [
        GenreTitleBar(title: widget.genre,),
        SizedBox(
          height: 220,
          child: ListView.separated(
            padding: EdgeInsets.only(left: context.calcOnWidth(8)),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.moviesList.length,
            itemBuilder: (context, index) {
              return MovieChildWidget(onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailsScreen(movieID: widget.moviesList[index].id.toString())));
              }, imgPath: widget.moviesList[index].mediumCoverImage??"", rating: "${widget.moviesList[index].rating}", top: 13, left: 14);
            }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: context.calcOnWidth(16),);
          },),
        ),
      ],
    );
  }
}
