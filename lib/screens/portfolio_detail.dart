import 'package:flutter/material.dart';
import 'package:smartexweb/stores/main_store.dart';
import 'package:smartexweb/widgets/extentions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

class PortfolioDetail extends StatefulWidget {
  // PortfolioDetail({Key key}) : super(key: key);
  PortfolioDetail(this.store, {Key key}) : super(key: key);
  final MainStore store;
  
  @override
  _PortfolioDetailState createState() => _PortfolioDetailState();
}

class _PortfolioDetailState extends State<PortfolioDetail> 
  with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Map objectProject;
  List imagesArray;
  List projectCategories;
  List categoriesNamesList = [];
  String categoriesNamesToString = "";
  bool isLiked = true;
  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 15,
            padding: 12,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          _icon(isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Color(0xffF72804) : Color(0xffE1E2E4),
              size: 15,
              padding: 12,
              isOutLine: false, onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          }),
        ],
      ),
    );
  }

  Widget _icon(
    IconData icon, {
    Color color = const Color(0xffa8a09b),
    double size = 20,
    double padding = 10,
    bool isOutLine = false,
    Function onPressed,
  }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: Color(0xffa8a09b),
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _productImage() {
    objectProject = ModalRoute.of(context).settings.arguments;
    // log('objectProject: $objectProject');
    // int _current = 0;
    imagesArray = objectProject['photo'];
    projectCategories = objectProject['categories'];
    for (var i = 0; i < projectCategories.length; i++) {
      categoriesNamesList.add(projectCategories[i]['name']);
    }
    categoriesNamesToString = categoriesNamesList.join(", ");
    return AnimatedBuilder(
      builder: (context, child) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: animation.value,
          child: child,
        );
      },
      animation: animation,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // Text(
          //   "AIP",
          //   style: TextStyle(
          //     fontSize: 160,
          //     color: Color(0xffE1E2E4),
          //   ),
          // ),
          Hero(
            tag: "image_" + objectProject['id'].toString(),
            child: Image.network(imagesArray[0]['thumbnail'],)
          ),
        ],
      ),
    );
  }

  // Widget _photosWidget() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 15),
  //     width: MediaQuery.of(context).size.width,
  //     height: 80,
  //     child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children:
  //             imagesArray.map((x) => _thumbnail("${x['thumbnail']}")).toList()),
  //   );
  // }

  // Widget _thumbnail(String image) {
  //   return AnimatedBuilder(
  //     animation: animation,
  //     //  builder: null,
  //     builder: (context, child) => AnimatedOpacity(
  //       opacity: animation.value,
  //       duration: Duration(milliseconds: 500),
  //       child: child,
  //     ),
  //     child:  Container(
  //       margin: EdgeInsets.symmetric(horizontal: 10),
  //       child: Container(
  //         height: 60,
  //         width: 80,
  //         // decoration: BoxDecoration(
  //         //   border: Border.all(
  //         //     color: Color(0xffA1A3A6),
  //         //   ),
  //         //   borderRadius: BorderRadius.all(Radius.circular(13)),
  //         // ),
  //         child: Image.network(image),
  //       ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13))),
  //     ),
  //   );
  // }

  Widget _detailWidget() {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Color(0xffa8a09b),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "${objectProject['name']}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff1d2635),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "\$ ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xffF72804),
                                ),
                              ),
                              Text(
                                "800",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color(0xff1d2635),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star,
                                  color: Color(0xfffbba01), size: 17),
                              Icon(Icons.star,
                                  color: Color(0xfffbba01), size: 17),
                              Icon(Icons.star,
                                  color: Color(0xfffbba01), size: 17),
                              Icon(Icons.star,
                                  color: Color(0xfffbba01), size: 17),
                              Icon(Icons.star,
                                  color: Color(0xfffbba01), size: 17),
                              // Icon(Icons.star_border, size: 17),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _availableSize(),
                SizedBox(
                  height: 20,
                ),
                _availableColor(),
                SizedBox(
                  height: 20,
                ),
                _description(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Категория",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff1d2635),
          ),
        ),
        SizedBox(height: 20),
        Wrap(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // children: <Widget>[
          //   _sizeWidget("US 6"),
          //   _sizeWidget("US 7"),
          //   _sizeWidget("US 8"),
          //   _sizeWidget("US 9"),
          // ],
          children: 
            projectCategories.map((i) => _sizeWidget("${i['name']}")).toList())
      ],
    );
  }

  Widget _sizeWidget(String text,
      {Color color = const Color(0xffa8a09b), bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: color,
            style: !isSelected ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color:
            isSelected ? Color(0xffE65829) : Theme.of(context).backgroundColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: isSelected ? Color(0XFFFFFFFF) : Color(0xff1d2635),
        ),
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _availableColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Цвет темы",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff1d2635),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _colorWidget(Color(0xfffbba01), isSelected: true),
            SizedBox(
              width: 30,
            ),
            _colorWidget(Color(0xff5c3dff)),
            SizedBox(
              width: 30,
            ),
            _colorWidget(Color(0xff5F5F60)),
            SizedBox(
              width: 30,
            ),
            _colorWidget(Color(0xffF72804)),
            SizedBox(
              width: 30,
            ),
            _colorWidget(Color(0xff2890c8)),
          ],
        )
      ],
    );
  }

  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: isSelected
          ? Icon(
              Icons.check_circle,
              color: color,
              size: 18,
            )
          : CircleAvatar(radius: 7, backgroundColor: color),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Описание",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff1d2635),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "${objectProject['description']}",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff1d2635),
          ),
        ),
      ],
    );
  }

  FloatingActionButton _flotingButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('home');
      },
      backgroundColor: Color(0xffE65829),
      child: Icon(Icons.home,
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _flotingButton(),
      body: SafeArea(
        child: Container(
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //   colors: [
          //     Color(0xfffbfbfb),
          //     Color(0xfff7f7f7),
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // )),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _appBar(),
                  _productImage(),
                  // _photosWidget(),
                  CarouselSlider(
                    items: imagesArray.map<Widget>((i) {
                      return Container(
                        margin: const EdgeInsets.only(top: 25, right: 15),
                        clipBehavior: Clip.antiAlias,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          i['thumbnail'], 
                          fit: BoxFit.cover),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: (MediaQuery.of (context) .size.width)/4,
                      aspectRatio: 1.66,
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
                        // setState(() {
                        //   _current = index;
                        // });
                      },
                    ),
                  ),
                ],
              ),
              _detailWidget()
            ],
          ),
        ),
      ),
    );
  }
}