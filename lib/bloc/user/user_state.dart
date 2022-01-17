// Estado de la App
part of 'user_bloc.dart';

@immutable
abstract class UserState{
  final bool existUser;
  final Usuario? user;

  const UserState({
    this.existUser = false, 
    this.user
  });
}

//Estado inicial del Usuario
class UserInitialState extends UserState {
  const UserInitialState(): super(existUser: false, user: null);
}


//Establecer Usuario
class UserSetState extends UserState {

  final Usuario newUser;

  const UserSetState(this.newUser): super(existUser: true, user: newUser);
}