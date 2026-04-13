import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/core/utils/app_utils.dart';
import 'package:movie/home/movie_details/cubit/movie_details_states.dart';
import 'package:movie/home/movie_details/cubit/movie_details_view_model.dart';
import 'package:movie/home/movie_details/widgets/cast_card.dart';
import 'package:movie/home/movie_details/widgets/genres_card.dart';
import 'package:movie/home/movie_details/widgets/info_card.dart';
import 'package:movie/home/movie_details/widgets/screenShotCard.dart';
import 'package:movie/di.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/widgets/loading_widget.dart';
import 'package:movie/models/movie_response.dart';
import 'package:movie/widgets/custom_elevated_button.dart';
import 'package:movie/home/home_page/widgets/movie_child_widget.dart';
import '../../authentication/cubit/auth_state.dart';
import '../../authentication/cubit/auth_view_model.dart';
import '../../models/user_model.dart';
import '../profile_page/cubit/user_view_model.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String movieID;
  final bool? isHistory;

  const MovieDetailsScreen({super.key, required this.movieID, this.isHistory});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final movieDetailsViewModel = MovieDetailsViewModel(
    movieDetailsRepository: injectMovieDetailsRepository(),
    moviesSuggestionsRepository: injectMoviesSuggestionsRepository(),
  );
  late AuthViewModel authViewModel;
  late UserModel user;
  late UserViewModel userViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieDetailsViewModel.getMovieData(widget.movieID);
    authViewModel = context.read<AuthViewModel>();
    userViewModel = context.read<UserViewModel>();
    final state = authViewModel.state;
    if (state is AuthSuccessState) {
      user = state.user;
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsViewModel, MovieDetailsStates>(
      bloc: movieDetailsViewModel,
      builder: (context, state) {
        if (state is Loading) {
          return LoadingWidget();
        } else if (state is Error) {
          return Center(child: Text(state.errorMessage));
        } else if (state is Success) {
          bool isWishList = user.wishList.contains(state.movie.imdbCode);
          debugPrint(state.movie.cast![2].urlSmallImage);
          userViewModel.addMovieToHistory( authViewModel: authViewModel, movieId: state.movie.imdbCode, isHistory: widget.isHistory);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: context.calcOnHeight(645),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(state.movie.largeCoverImage!),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    child: Stack(
                      //fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.transparentColor,
                                AppColors.black,
                              ],
                            ),
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: widthOf(16, context),
                              right: widthOf(16, context),
                              bottom: heightOf(8, context),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      color: AppColors.transparentColor,
                                      child: SizedBox(
                                        width: widthOf(17, context),
                                        height: heightOf(29, context),
                                        child: InkResponse(
                                          onTap: () => Navigator.pop(context),
                                          child: Icon(
                                            Icons.arrow_back_ios_rounded,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: AppColors.transparentColor,
                                      child: SizedBox(
                                        width: widthOf(17, context),
                                        height: heightOf(29, context),
                                        child: InkResponse(
                                          onTap: () {
                                            userViewModel.updateMovieWishList(authViewModel: authViewModel, movieId: state.movie.imdbCode, isWishList: isWishList, isHistory: widget.isHistory);
                                            if(isWishList){
                                              isWishList = false;
                                            }
                                            else{
                                              isWishList = true;
                                            }
                                            setState(() {

                                            });
                                          },
                                          child: Icon(isWishList?Icons.bookmark_added_rounded:Icons.bookmark_add_outlined,size: 30,),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SvgPicture.asset(
                                    AppAssets.playButton,
                                    width: widthOf(97, context),
                                  ),
                                ),
                                Text(
                                  '${state.movie.titleEnglish!}\n${state.movie.year}',
                                  style: AppStyles.bold24White,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.all(widthOf(16, context)),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      CustomElevatedButton(
                        function: () {},
                        text: 'Watch',
                        textStyle: AppStyles.bold24White.copyWith(fontSize: 20),
                        backgroundColor: AppColors.red,
                        borderColor: AppColors.transparentColor,
                      ),
                      SizedBox(height: heightOf(16, context)),
                      Row(
                        spacing: widthOf(16, context),
                        children: [
                          Expanded(
                            child: InfoCard(
                              icon: AppAssets.heart,
                              value: state.movie.likeCount!.toString(),
                            ),
                          ),
                          Expanded(
                            child: InfoCard(
                              icon: AppAssets.clock,
                              value: state.movie.runtime!.toString(),
                            ),
                          ),
                          Expanded(
                            child: InfoCard(
                              icon: AppAssets.star,
                              value: state.movie.rating!.toString(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: heightOf(16, context)),
                      Text('ScreenShots', style: AppStyles.bold24White),
                      SizedBox(height: heightOf(16, context)),
                      ScreenshotsCard(image: state.movie.largeScreenshotImage1!),
                      SizedBox(height: heightOf(16, context)),
                      ScreenshotsCard(image: state.movie.largeScreenshotImage2!),
                      SizedBox(height: heightOf(16, context)),
                      ScreenshotsCard(image: state.movie.largeScreenshotImage3!),
                      SizedBox(height: heightOf(16, context)),
                      Text('Similar', style: AppStyles.bold24White),
                      SizedBox(height: heightOf(11, context)),
                      //todo add similar movies
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: widthOf(20, context),
                            mainAxisSpacing: heightOf(16, context),
                            childAspectRatio: 0.677419355
                        ),
                        padding: EdgeInsets.zero,
                        itemCount: state.movieSuggestions.data!.movies!.length,
                        itemBuilder: (context, index) {
                          Movies movie = state.movieSuggestions.data!.movies![index];
                          return MovieChildWidget(
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => MovieDetailsScreen(
                                    isHistory: widget.isHistory,
                                    movieID: movie.id.toString(),
                                  ),
                                ),
                              );
                            },
                            imgPath: movie.mediumCoverImage!,
                            rating: movie.rating.toString(),
                            top: heightOf(13, context),
                            left: widthOf(10, context),
                          );
                        },
                      ),
                      SizedBox(height: heightOf(16, context)),
                      Text('Summary', style: AppStyles.bold24White),
                      SizedBox(height: heightOf(16, context)),
                      Text(
                        state.movie.descriptionFull!,
                        style: AppStyles.regular16White.copyWith(
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: heightOf(16, context)),
                      Text('Cast', style: AppStyles.bold24White),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.movie.cast!.length,
                        itemBuilder:
                            (context, index) => CastCard(
                          image: state.movie.cast![index].urlSmallImage,
                          name: state.movie.cast![index].name ?? '',
                          character:
                          state.movie.cast![index].characterName ?? '',
                        ),
                        separatorBuilder:
                            (context, index) =>
                            SizedBox(height: heightOf(8, context)),
                      ),
                      SizedBox(height: heightOf(16, context)),
                      Text('Genres', style: AppStyles.bold24White),
                      SizedBox(height: heightOf(16, context)),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 11,
                          crossAxisSpacing: 16,
                          childAspectRatio: 3.388888889,
                        ),
                        itemCount: state.movie.genres!.length,
                        itemBuilder:
                            (context, index) =>
                            GenresCard(genre: state.movie.genres![index]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return Placeholder();
      },
    );
  }
}
