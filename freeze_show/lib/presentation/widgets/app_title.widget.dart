import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Freeze show',
      style: GoogleFonts.pacifico().copyWith(
        fontSize: 35,
      ),
    );
  }
}
