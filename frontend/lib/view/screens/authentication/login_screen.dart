import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/controllers/auth_controller.dart';
import 'package:frontend/services/manage_http_response.dart';
import 'package:frontend/view/screens/authentication/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends ConsumerStatefulWidget {
   const LoginScreen({ super.key});

   @override
   ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;
  late String password;
  bool isLoading = false;
  bool _obscurePassword = true;
  loginUser() async {
    setState(() { isLoading = true; });
    await _authController.Login(context: context, ref: ref, email: email, password: password)
    .whenComplete(() {
      _formKey.currentState!.reset();
      setState(() { isLoading = false; });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/Logo.png'),
                  const SizedBox(height: 20),
                  Text('Chào mừng bạn đến với Chat Message',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Vui lòng nhập vào email';
                      }else {
                        return null;
                      }
                    },
                     decoration: InputDecoration(
                      label: Text('Email', 
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal
                      ),
                      ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10,),
                    ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if(value!.isEmpty) {
                         return 'Vui lòng nhập vào mật khẩu';
                      }else {
                        return null;
                      }
                    },
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      label: Text('Mật khẩu', style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
              
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black54,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10,),
                      
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => {},
                        child: Text(
                          "Quên mật khẩu?",
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            color: Colors.lightBlueAccent.shade400,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  //button login 
                  InkWell(
                    onTap: () async {
                      if(_formKey.currentState!.validate()) {
                       loginUser();
                      }else {
                        showSnackbar(context, "Vui lòng điền đầy đủ thông tin!");
                      }
                    },
                    child: Container(
                      width: 320,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8,),
                        color: Colors.lightBlueAccent.shade400,
                      ),
                      child: Center(
                        child: isLoading ? CircularProgressIndicator(
                          color: Colors.white,
                        ) : Text(
                          'Đăng nhập',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider(
                        color: Colors.lightBlueAccent.shade400,
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Hoặc đăng nhập với',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            color: Colors.black54,
                          ),
                        ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  // oath sign (facebook + google)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8,),
                          color: Colors.lightBlueAccent.shade400, 
                        ),
                        child: const Icon(Icons.facebook, color: Colors.white,),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8,),
                          color: Colors.redAccent.shade400,
                        ),
                        child: const Icon(FontAwesomeIcons.googlePlus, color: Colors.white,),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bạn chưa có tài khoản?',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: Colors.black45,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),),),
                        },
                        child: Text(
                          "Đăng Ký Ngay",
                          style: GoogleFonts.roboto( 
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  )
                ],  
              ),
            ),
          ),
          )
      ))
    );
  }
}