import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:getx_test_flutter/utils/text_widget.dart';

class Loader extends StatefulWidget {
  final Color color;
  final String msg;

  const Loader({Key key, this.color, this.msg}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.msg == null ? Container() : TextWidget(text: widget.msg),
        SpinKitThreeBounce(
          size: 20,
          color: widget.color == null ? Colors.black : widget.color,
        ),
      ],
    ));
  }
}
