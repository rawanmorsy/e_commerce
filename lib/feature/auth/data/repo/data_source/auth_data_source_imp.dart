
import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/auth/data/api/auth_api.dart';
import 'package:e_commerce/feature/auth/data/model/request/login_request_dto.dart';
import 'package:e_commerce/feature/auth/data/model/request/register_request_dto.dart';
import 'package:e_commerce/feature/auth/data/model/response/login_response_dto.dart';
import 'package:e_commerce/feature/auth/data/model/response/register_response_dto.dart';
import 'package:e_commerce/feature/auth/data/repo/data_source/auth_data_source_contract.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSourceContract {
  AuthRemoteDataSourceImp(this._authApi);
  final AuthApi _authApi;

  @override
  Future<NetworkResult<RegisterResponseDto>> register(
    RegisterRequestDto registerRequestDto,
  ) => _authApi.register(registerRequestDto);

  @override
  Future<NetworkResult<LoginResponseDto>> login(LoginRequestDto loginRequestDto) =>
      _authApi.login(loginRequestDto);
}
// class AuthLocalDataSourceImp implements AuthLocalDataSourceContract {}

AuthRemoteDataSourceContract authRemoteInjectable() =>
    AuthRemoteDataSourceImp(AuthApi.instance);
