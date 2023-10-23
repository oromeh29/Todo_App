import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: REdgeInsets.all(18),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff3391DF),
            Color(0xff0E5794),
            Color(0xff052641),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topLeft,
        )),
        child: Stack(
          children: [
            ClipPath(
              clipper: ContainerClipper(),
              child: Container(
                height: 300.h,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            Positioned(
              left: 20,
              top: 40,
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 25,
                    color: Color(0xff439ae1),
                  ),
                  SizedBox(
                    width: Width * .1,
                  ),
                  Icon(
                    FontAwesomeIcons.bell,
                    size: 25,
                    color: Color(0xff439ae1),
                  ),
                  SizedBox(
                    width: Width * 0.4,
                  ),
                  CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage("assets/images/userphoto.png"),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ContainerClipper extends CustomClipper<Path> {
  var path = Path();

  @override
  Path getClip(Size size) {
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    // path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height - 100,
        size.width * 0.5, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.80, size.height, size.width * 0.85, size.height - 300);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
