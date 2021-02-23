import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TechnoSlider extends StatefulWidget {
  @override
  _TechnoSliderState createState() => _TechnoSliderState();
}

class _TechnoSliderState extends State<TechnoSlider> {
  int _current = 0;
  List<String> sliderList = [
    'assets/images/technologies/vuejs1.png',
    'assets/images/technologies/laravel1.png',
    'assets/images/technologies/october1.png',
    'assets/images/technologies/swift1.png',
    'assets/images/technologies/kotlin1.png',
    'assets/images/technologies/flutter1.png',
    'assets/images/technologies/ReactNative1.png',
    'assets/images/technologies/django1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: new BoxDecoration(
        color: Color(0xFFD3D3D3),
        // gradient: LinearGradient(
        //   colors: <Color>[
        //     Color(0xFF23283B),
        //     Color(0xFF404761),
        //   ],
        // ),
        border: new Border.all(
            color: Color(0xFFFF4500), width: 1.0),
        borderRadius: new BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0xFFFF4500).withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Осваиваем технологии',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CarouselSlider(
            items: sliderList.map<Widget>((i) {
              return Container(
                margin: const EdgeInsets.only(right: 15),
                clipBehavior: Clip.antiAlias,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(i, fit: BoxFit.cover),
              );
            }).toList(),
            options: CarouselOptions(
                height: (MediaQuery.of (context) .size.width)/10,
                aspectRatio: 1.3,
                viewportFraction: 0.3,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: sliderList.map((url) {
              int index = sliderList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}