import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/authentication/cubit/auth_view_model.dart';
import 'package:movie/core/utils/firebase_utils.dart';
import 'package:movie/home/profile_page/cubit/user_state.dart';
import 'package:movie/models/movie_response.dart';
import 'package:movie/models/user_model.dart';
import '../../../authentication/cubit/auth_state.dart';
import '../../../data/repository/movies/repository/movies_repository.dart';
import '../../../di.dart';
import '../user_navigator.dart';

class UserViewModel extends Cubit<UserState> {
  UserViewModel() : super(UserInitiationState());
  late UserNavigator navigator;
  late UserModel user;
  List<Movies> movies = [];
  Future<void> updateUser({
    required String id,
    required String name,
    required String email,
    required String phone,
    required int avatarIndex,
    required AuthViewModel authViewModel,
  }) async {
    try{
      emit(UserLoadingState());
      navigator.showMyLoading();
      await FirebaseUtils.getUserCollection()
          .doc(id)
          .update({
        "email": email,
        "name": name,
        "phone": phone,
        "avatarIndex": avatarIndex,
      }).then((value) {});
      final state = authViewModel.state;
      if (state is AuthSuccessState) {
        state.user = UserModel(id: id, name: name, email: email, phone: phone, avatarIndex: avatarIndex, wishList: state.user.wishList, history: state.user.history);
      }
      navigator.hideDialog();
      emit(UserSuccessState());
      navigator.showSuccess(message: "Updated Successfully", isDelete: false);


    }
    catch(error){
      navigator.hideDialog();
      emit(UserErrorState());
      navigator.showError(message: error.toString());
    }

  }

  Future<void> deleteUserAccount(String uId) async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        emit(UserLoadingState());
        navigator.showMyLoading();
        await user.delete();
        await FirebaseUtils.getUserCollection().doc(uId).delete();
        navigator.hideDialog();
        emit(UserSuccessState());
        navigator.showSuccess(message: "Account Deleted Successfully", isDelete: true);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'requires-recent-login') {
          navigator.hideDialog();
          emit(UserErrorState());
          navigator.showError(message: "Requires recent login. Please reauthenticate.");
        } else {
          navigator.hideDialog();
          emit(UserErrorState());
          navigator.showError(message: "Failed to delete user account: ${e.code}");
        }
      } catch (e) {
        navigator.hideDialog();
        emit(UserErrorState());
        navigator.showError(message: "An error occurred: ${e.toString()}");
      }
    }
  }
  Future<void> getUserHistoryOrWish({
    int limit = 20,
    required List<String> queryTerms,
    required MoviesRepository moviesRepository,
  }) async {
    movies = [];
    try {
      emit(TabLoadingState());

      // 1. Create a list of all your future requests
      final futures = queryTerms.map((term) =>
          moviesRepository.getMovies(queryTerm: term)
      ).toList();
      // 2. Execute them all in parallel
      final responses = await Future.wait(futures);
      for (var response in responses) {
        if (response.data?.movies != null) {
          movies.addAll(response.data!.movies!);
        }
      }

      emit(UserWishListOrHistorySuccessState(movies: movies));
    } catch (e) {
      emit(UserErrorState(errorMessage: e.toString()));
    }
  }
  Future<void> addMovieToHistory({
    required String? movieId,
    required AuthViewModel authViewModel,
    required bool? isHistory,

  }) async {
    try{
      late UserModel user;
      final state = authViewModel.state;
      if (state is AuthSuccessState) {
        user = state.user;
      }
      if(user.history.contains(movieId) == false){
        user.history.add(movieId??"");
        if(user.history.length>20){
          user.history.removeAt(0);
        }
        await FirebaseUtils.getUserCollection()
            .doc(user.id)
            .update({
          "history":user.history
        }).then((value) {});
        emit(UserHistoryUpdatedSuccessState());
        emit(UserWishListOrHistorySuccessState(movies: movies));
        if(isHistory !=null){
          if(!isHistory){
            getUserHistoryOrWish(queryTerms: user.wishList, moviesRepository: injectMoviesRepository());
          }
          else{
            getUserHistoryOrWish(queryTerms: user.history, moviesRepository: injectMoviesRepository());

          }


        }
      }

    }
    catch(error){
      emit(UserErrorState());
    }
  }
  Future<void> updateMovieWishList({
    required String? movieId,
    required AuthViewModel authViewModel,
    required bool isWishList,
    required bool? isHistory,

  }) async {
    try{
      late UserModel user;
      final state = authViewModel.state;
      if (state is AuthSuccessState) {
        user = state.user;
      }
      if(isWishList){
        user.wishList.remove(movieId??"");
      }
      else{
        user.wishList.add(movieId??"");
      }

      await FirebaseUtils.getUserCollection()
          .doc(user.id)
          .update({
        "wishList":user.wishList
      }).then((value) {});
      if(isHistory != null){
        emit(UserHistoryUpdatedSuccessState());
        emit(UserWishListOrHistorySuccessState(movies: movies));
        if(!isHistory) {
          getUserHistoryOrWish(queryTerms: user.wishList, moviesRepository: injectMoviesRepository());
        }
      }

    }
    catch(error){
      emit(UserErrorState());
    }

  }
}
