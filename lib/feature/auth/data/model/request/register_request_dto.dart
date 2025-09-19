
import 'package:e_commerce/core/constants/app_assets.dart';

class RegisterRequestDto {
  RegisterRequestDto({this.name, this.email, this.password, this.avatar=AppAssets.avatar});
  String? name;
  String? email;
  String? password;
  String? avatar;


  

  Map<String, dynamic> toJson( ) {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['password'] =password;
    data['avatar'] = avatar;
    return data;
  }
}
