import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/auth/data/model/request/register_request_dto.dart';
import 'package:e_commerce/feature/auth/data/model/response/register_response_dto.dart';
import 'package:e_commerce/feature/auth/data/repo/repository/auth_repository_contract.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._repositoryContract) : super(RegisterInitial());
  final AuthRepositoryContract _repositoryContract;

  Future<void> register({
    required String email,
    // required String name,
    required String password,
  }) async {
    emit(RegisterLoading());
    final request = RegisterRequestDto(
      email: email,
      // name: name,
      password: password,
    );
    var result = await _repositoryContract.register(request);
    switch (result) {
      case NetworkSuccess<RegisterResponseDto>():
        emit(RegisterSuccess());
      case NetworkError<RegisterResponseDto>():
        emit(RegisterError());
    }
  }
}
