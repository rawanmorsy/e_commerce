
import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/auth/data/model/request/login_request_dto.dart';
import 'package:e_commerce/feature/auth/data/model/request/register_request_dto.dart';
import 'package:e_commerce/feature/auth/data/model/response/login_response_dto.dart';
import 'package:e_commerce/feature/auth/data/model/response/register_response_dto.dart';
import 'package:e_commerce/feature/auth/data/repo/data_source/auth_data_source_contract.dart';
import 'package:e_commerce/feature/auth/data/repo/data_source/auth_data_source_imp.dart';
import 'package:e_commerce/feature/auth/data/repo/repository/auth_repository_contract.dart';

class AuthRepositoryImp implements AuthRepositoryContract {
  const AuthRepositoryImp(this._authRemoteDataSourceContract);
  final AuthRemoteDataSourceContract _authRemoteDataSourceContract;
  @override
  Future<NetworkResult<RegisterResponseDto>> register(
    RegisterRequestDto registerRequestDto,
  ) => _authRemoteDataSourceContract.register(registerRequestDto);

  @override
  Future<NetworkResult<LoginResponseDto>> login(LoginRequestDto loginRequestDto) =>
      _authRemoteDataSourceContract.login(loginRequestDto);
   

}

AuthRepositoryContract repositoryInjectable() => AuthRepositoryImp(authRemoteInjectable());
