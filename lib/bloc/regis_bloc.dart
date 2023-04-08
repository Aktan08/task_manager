import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repo/userRepozitor.dart';

part 'regis_event.dart';
part 'regis_state.dart';

class RegisBloc extends Bloc<RegisEvent, RegisState> {
  RegisBloc({required this.repo}) : super(Getstarted()) {
    on<RegisEvent>((event, emit) {
      if (repo.regis == true) {
        emit(LogIn());
      }
      if (repo.regis == false) {
        emit(SignIn());
      }
    });
  }
  final UserRepo repo;
}
