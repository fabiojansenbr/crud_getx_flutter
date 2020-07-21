import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const TextWidget(
      {Key key,
      @required this.text,
      this.fontSize,
      this.fontWeight,
      this.color})
      : super(key: key);
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: GoogleFonts.muli(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.color));
  }
}
