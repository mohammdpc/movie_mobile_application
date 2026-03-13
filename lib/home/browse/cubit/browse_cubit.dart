import 'package:flutter_bloc/flutter_bloc.dart';

class BrowseCubit extends Cubit<int>{
  BrowseCubit():super(0);
  void changeGenre(int index){
    emit(index);
  }
}