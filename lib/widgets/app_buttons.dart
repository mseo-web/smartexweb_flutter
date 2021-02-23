import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final void Function() action;

  PrimaryButton(
    this.text, {
    Key key,
    this.width,
    this.height,
    this.backgroundColor = const Color(0xFFFF4500),
    this.borderColor = const Color(0xFFFF4500),
    this.textColor = const Color(0xFFFFFFFF),
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed(
          //   'projects',
          //   // arguments: {'listProjects': listProjectsHome},
          // );
          action();
        },
        child: new Container(
          width: width,
          padding: const EdgeInsets.all(10),
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                backgroundColor,
                backgroundColor,
              ],
            ),
            border: new Border.all(color: borderColor, width: 1.0),
            borderRadius: new BorderRadius.circular(10),
          ),
          child: new Center(
              child: new Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final void Function() action;

  CategoryButton(
    this.text, {
    Key key,
    this.width,
    this.height,
    this.backgroundColor = const Color(0XFFFFFFFF),
    this.borderColor = const Color(0xffA1A3A6),
    this.textColor = const Color(0xFF000000),
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed(
          //   'projects',
          //   // arguments: {'listProjects': listProjectsHome},
          // );
          action();
        },
        child: new Container(
          width: width,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          padding: const EdgeInsets.all(10),
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                backgroundColor,
                backgroundColor,
              ],
            ),
            border: new Border.all(color: borderColor, width: 1.0),
            borderRadius: new BorderRadius.circular(10),
          ),
          child: new Center(
              child: new Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}