import 'package:flutter/material.dart';
import 'package:frontend/controllers/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String username;
  late String email;
  late String password;
  bool isLoading = false;
  bool _obscurePassword = true;

  registerUser() async {
     setState(() {
       isLoading = true;
     });
      await _authController.Register(context: context, 
                       username: username, 
                       email: email, 
                       password: password)
                      .whenComplete(() {
                        _formKey.currentState!.reset();
                        setState(() {
                          isLoading = false;
                        });
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
                  Text('Đăng ký tài khoản Chat Message',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    onChanged: (value) {
                      username = value;
                    },
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Vui lòng nhập tên người dùng';
                      }else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text(
                        'Tên người dùng',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10,),
                      )
                    ),
                  ),
                  const SizedBox(height: 12,),
                  TextFormField(
                    onChanged: (value) {
                       email = value;
                    },
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Vui lòng nhập email';
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
                        return 'Vui lòng nhập mật khẩu';
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
                  //button login 
                  InkWell(
                    onTap: () {
                      if(_formKey.currentState!.validate())  {
                         registerUser();
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
                        child: isLoading ? CircularProgressIndicator(color: Colors.white,) 
                        : Text(
                          'Đăng Ký',
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
                      Text(
                        'Bạn đã có tài khoản?',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: Colors.black45,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pop(context),
                        },
                        child: Text(
                          "Đăng Nhập",
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