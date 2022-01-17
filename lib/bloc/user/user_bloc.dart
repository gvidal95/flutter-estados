import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:meta/meta.dart';

//Informacion del estado actual, y procesamiento de eventos
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState>{

  UserBloc() : super(const UserInitialState()) {
    
    on<ActivateUser>( (event, emit) => emit(UserSetState(event.user)));
    
    on<DeleteUser>( (event, emit) => emit( const UserInitialState()));

    on<ChangeUserAge>((event, emit) {
      if( !state.existUser ) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<AddProfesion>((event, emit) {
      if( !state.existUser ) return;      
      emit(UserSetState(state.user!.copyWith(profesiones: [...state.user!.profesiones, event.profession])));
    });

  }
  
}