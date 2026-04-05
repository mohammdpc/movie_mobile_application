import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/firebase_utils.dart';
import 'package:movie/home/update_profile_page/cubit/user_state.dart';
import 'package:movie/models/movie_response.dart';
import 'package:movie/models/user_model.dart';
import '../../../data/repository/movies/repository/movies_repository.dart';
import '../user_navigator.dart';

class UserViewModel extends Cubit<UserState> {
  MoviesRepository? moviesRepository;
  UserViewModel({this.moviesRepository}) : super(UserInitiationState());
  late UserNavigator navigator;
  late UserModel user;
  Future<void> updateUser({
    required String id,
    required String name,
    required String email,
    required String phone,
    required int avatarIndex,
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
  Future<void> getUserHistoryOrWish({int limit = 20,required List<String> queryTerms}) async {
    List<Movies> movies = [];
    try{
      for(int i = 0 ;i<queryTerms.length;i++){
        var response = await moviesRepository!.getMovies(queryTerm: queryTerms[i]);
        movies.addAll(response.data!.movies!);
      }
      emit(UserWishListOrHistorySuccessState(movies: movies));
      return;
    }
    catch(e){
      emit(UserErrorState(errorMessage: e.toString()));
    }
  }

}
