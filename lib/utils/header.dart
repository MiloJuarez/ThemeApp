import 'package:flutter/material.dart';

class HeaderList extends StatelessWidget {

  final String pathImage;
  final String titleAppBar;
  HeaderList(this.pathImage, this.titleAppBar);
  @override
  Widget build(BuildContext context) {
    final image = Container(
      height: 110.0,
      child: ClipPath(
        child: Image.asset(
          pathImage,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        clipper: WaveClipper(),
      ),
    );

    final title = Container(
      padding: EdgeInsets.only(left: 60.0),
      child: Text(
        titleAppBar,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),
      ),
    );

    final row = Row(
      children: <Widget>[
        title,
      ],
    );

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        image,
        row,
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 20.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 45);
    var secondEndPoint = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
