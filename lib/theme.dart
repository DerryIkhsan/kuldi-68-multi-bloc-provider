import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Cubit<bool>{
  ThemeBloc(bool initialState) : super(false);

  void changeTheme() => emit(!state);
}