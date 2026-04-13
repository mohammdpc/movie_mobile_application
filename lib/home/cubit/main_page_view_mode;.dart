import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/home/cubit/main_page_state.dart';

class MainPageViewModel extends Cubit<MainPageState>{
  int currentIndex = 0;
  int?browseIndex;
  MainPageViewModel() : super(InitState());
  void changeIndex({required int index,int? browse}){
    emit(Navigating());
    currentIndex = index;
    browseIndex = browse;
    emit(NavigatedSuccessfully());
  }
}