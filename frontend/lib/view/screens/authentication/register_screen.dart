import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: SingleChildScrollView(
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
                Container(
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
          )
      ))
    );
  }
}