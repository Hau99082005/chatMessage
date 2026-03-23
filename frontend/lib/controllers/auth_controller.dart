import 'package:frontend/global_variables.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/services/manage_http_response.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<void> Register({
    required context,
    required String username,
    required String email,
    required String password,
  }) async{
      try {
        User user = User(id: '',
        firebaseUid: '', 
        username: username,
        email: email, 
        password: password, 
        avatar: '', 
        bio: '');
        http.Response response = await http.post(Uri.parse('${uri}/api/register'), 
        body: user.toJson(),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        });
        manageHttpResponse(response: response, 
        context: context, 
        onSuccess: () {
          showSnackbar(context, 'Đăng ký thành công!');
        });
      }catch(e) {
         print(e);
      }
  }
}