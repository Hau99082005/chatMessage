import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaiScreen extends StatefulWidget {
  const MaiScreen({super.key});

  @override
  State<MaiScreen> createState() => _MaiScreenState();
}

class _MaiScreenState extends State<MaiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Text('Main Screen', 
        style: GoogleFonts.roboto(fontSize: 16,
        fontStyle: FontStyle.normal,),),
      ))
    );
  }
}