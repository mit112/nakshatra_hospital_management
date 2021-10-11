import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kFont = 'Abel';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value.',
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kMyStyle = TextStyle(
  color: Colors.black,
  //fontWeight: FontWeight.w600,
  fontSize: 25.0,
);
const kBoldStyle = TextStyle(
  fontFamily: kFont,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

class RoundedButtonlogin extends StatelessWidget {
  RoundedButtonlogin({this.colour, this.title, @required this.onPressed});
  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: 8.0,
      ),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: kFont,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

Widget constantrow({
  @required String text,
  @required String snap,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              "$text : ",
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Flexible(
            child: Text(
              snap,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      )
    ],
  );
}
