import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  Text('Đăng ký tài khoản ChatApp',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
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
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      }else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text('Mật khẩu', style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
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
                        print("Đăng ký thành công!");
                      }else {
                        print("Đăng ký thất bại!");
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
                        child: Text(
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