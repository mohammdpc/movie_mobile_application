import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/core/utils/app_utils.dart';
import 'package:movie/di.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/Search/cubit/search_cubit.dart';
import 'package:movie/home/Search/cubit/search_state.dart';
import 'package:movie/home/home_page/widgets/movie_child_widget.dart';
import 'package:movie/home/movie_details/movie_details_screen.dart';
import 'package:movie/home/widgets/loading_widget.dart';
import 'package:movie/widgets/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchCubit searchCubit = SearchCubit(injectMoviesRepository());
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthOf(16, context)),
        child: Column(
          spacing: context.calcOnHeight(16),
          children: [
            CustomTextField(
              hintText: "Search here",
              controller: searchController,
              prefixIcon: AppAssets.search,
              onChanged: (v) => searchCubit.searchMovie(queryTerm: v),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                  bloc: searchCubit,
                  builder: (context, state) {
                    if(state is SearchSuccessState){
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: widthOf(16, context),
                          mainAxisSpacing: heightOf(8, context),
                          childAspectRatio: 0.684587814
                        ),
                        itemCount: state.movies.length,
                        itemBuilder: (context, index) {
                          var movie = state.movies[index];
                          return MovieChildWidget(
                            onPress:
                                () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => MovieDetailsScreen(
                                  movieID: movie.id.toString(),
                                ),
                              ),
                            ),
                            imgPath: movie.mediumCoverImage!,
                            rating: movie.rating.toString(),
                            top: heightOf(13, context),
                            left: widthOf(10, context),
                          );
                        },
                      );
                    } else if(state is SearchLoadingState){
                      return Center(child: LoadingWidget());
                    }
                    else if(state is SearchErrorState){
                      if(state.errorMessage == "Null check operator used on a null value"){
                        return Center(child: Image.asset(AppAssets.empty));
                      }
                      else{
                        return Center(child: Text(state.errorMessage,style: AppStyles.regular20White,),);
                      }
                    }
                    else{
                      return Center(child: Image.asset(AppAssets.empty));
                    }
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
