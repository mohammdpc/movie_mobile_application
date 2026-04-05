import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/extensions/device_dimensions.dart';
import '../../authentication/cubit/auth_state.dart';
import '../../authentication/cubit/auth_view_model.dart';
import '../../di.dart';
import '../home_page/widgets/movie_child_widget.dart';
import '../movie_details/movie_details_screen.dart';
import '../widgets/loading_widget.dart';
import '../widgets/main_error_widget.dart';
import 'cubit/user_state.dart';
import 'cubit/user_view_model.dart';

class HistoryOrWishList extends StatefulWidget {
  final List<String> historyOrWish;
  const HistoryOrWishList({super.key, required this.historyOrWish});

  @override
  State<HistoryOrWishList> createState() => _HistoryOrWishListState();
}

class _HistoryOrWishListState extends State<HistoryOrWishList> {
  UserViewModel viewModel = UserViewModel(
    moviesRepository: injectMoviesRepository(),
  );

  late AuthViewModel authViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authViewModel = context.read<AuthViewModel>();
    final state = authViewModel.state;
    if (state is AuthSuccessState) {
      viewModel.user = state.user;
    }
    viewModel.getUserHistoryOrWish(queryTerms: widget.historyOrWish);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserViewModel, UserState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is UserWishListOrHistorySuccessState) {
          if (state.movies.isEmpty) {
            return Center(child: Image.asset(AppAssets.empty));
          }

          return CustomScrollView(
            // Use BouncingScrollPhysics for a smooth feel inside NestedScrollView
            physics: NeverScrollableScrollPhysics(),
            slivers: [
              // 1. This "Infector" consumes the space occupied by the pinned TabBar
              // so your content starts exactly where the TabBar ends.
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              // 2. The Grid is wrapped in SliverPadding for clean margins
              SliverPadding(
                padding:  EdgeInsets.symmetric(horizontal: context.calcOnWidth(16), vertical: context.calcOnHeight(10)),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 180,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) => MovieChildWidget(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                              movieID: state.movies[index].id.toString(),
                            ),
                          ),
                        );
                      },
                      imgPath: state.movies[index].mediumCoverImage ?? "",
                      rating: "${state.movies[index].rating}",
                      top: 10,
                      left: 5,
                      borderRadius: 16,
                    ),
                    // Use state.movies.length to ensure safety with the UI data
                    childCount: state.movies.length,
                  ),
                ),
              ),
            ],
          );
        } else if (state is UserErrorState) {
          return MainErrorWidget(
            errorMessage: state.errorMessage,
            onPressed: () {
              viewModel.getUserHistoryOrWish(queryTerms: widget.historyOrWish);
            },
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}