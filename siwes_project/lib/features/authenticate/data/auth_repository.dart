import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siwes_project/services/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});
  userSignUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    AppHttpResponse response = await apiService.post(
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "role": "guest"
      },
      path: apiService.createUser,
    );
    if (response.error || response.data == null){
      return ;
    } else{
      print(response);
    }
    
  }
}

final authRepoProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(apiService: ref.read(apiServiceProvider));
});
