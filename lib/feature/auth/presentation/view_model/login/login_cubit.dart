import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/auth/data/model/request/login_request_dto.dart';
import 'package:e_commerce/feature/auth/data/model/response/login_response_dto.dart';
import 'package:e_commerce/feature/auth/data/repo/repository/auth_repository_contract.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repositoryContract) : super(LoginInitial());
 final AuthRepositoryContract _repositoryContract;
  Future<void> login(String email, String password)async {
    emit(LoginLoading());
    final request = LoginRequestDto(email: email, password: password);
    var result =await _repositoryContract.login(request);

    switch (result) {
      case NetworkSuccess<LoginResponseDto>():
        emit(LoginSuccess());
      case NetworkError<LoginResponseDto>():
        emit(LoginError());
    }
  }
}
