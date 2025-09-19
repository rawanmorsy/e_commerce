
import 'package:e_commerce/core/network/network.dart';
import 'package:e_commerce/feature/auth/data/model/request/login_request_dto.dart';
import 'package:e_commerce/feature/auth/data/model/request/register_request_dto.dart';
import 'package:e_commerce/feature/auth/data/model/response/login_response_dto.dart';
import 'package:e_commerce/feature/auth/data/model/response/register_response_dto.dart';

abstract class AuthRemoteDataSourceContract {
  Future<NetworkResult<RegisterResponseDto>> register(RegisterRequestDto registerRequestDto);
   Future<NetworkResult<LoginResponseDto>> login(LoginRequestDto loginRequestDto);
}

// abstract class AuthLocalDataSourceContract {}
