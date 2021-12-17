
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moyu_app/blocs/moyu_event.dart';
import 'package:moyu_app/blocs/moyu_state.dart';

class MoYuBloc extends Bloc<MoyuEvent, MoyuState> {
  MoYuBloc() : super(MoyuInit()) {
    
  }
}