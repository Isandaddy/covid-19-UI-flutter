import 'package:corona_19/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(body1: TextStyle(color: kBodyTextColor))),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        //ClipPath 원하는 모양의 커스텀 컨테이너 작성하게 해주는 위젯
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            padding: EdgeInsets.only(left: 40, top: 50, right: 20),
            height: 350,
            width: double.infinity, //부모 위젯의 최대 너비
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFF3383CD), Color(0xFF11249F)]),
                image: DecorationImage(
                  image: AssetImage("assets/images/virus.png"),
                )),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/menu.svg")),
                  SizedBox(height: 20),
                  Expanded(
                      child: Stack(children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/Drcorona.svg",
                      width: 230,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                    Positioned(
                        top: 20,
                        left: 150,
                        child: Text("All you need \nis stay at home",
                            style: kHeadingTextStyle.copyWith(
                                color: Colors.white))),
                    Container(),
                  ]))
                ]),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xFFE5E5E5),
              )),
          child: Row(
            children: <Widget>[
              SvgPicture.asset("assets/icons/maps-and-flags.svg"),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                value: 'Indonesia',
                items: ['Indonesia', 'Bangladesh', 'United States', 'Japan']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
              ))
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(text: "Case Update\n", style: kTitleTextstyle),
                      TextSpan(
                          text: "Newest update March 28",
                          style: TextStyle(color: kTextLightColor)),
                    ],
                  ))
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  //새로운 방향이 구축되는 부분
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
