import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class ProjectsCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String period;
  final String tag;
  final void Function() action;

  ProjectsCard(
    {Key key,
    this.name,
    this.imageUrl,
    this.period,
    this.tag,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: tag,
        child: Material(
          child: InkWell(
            onTap: action,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(15.0),
                      color: Colors.white,
                      // image: new DecorationImage(
                      //   image: new NetworkImage(imageUrl),
                      //   // alignment: Alignment.bottomCenter,
                      //   fit: BoxFit.fitWidth,
                      // ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: 0,
                          color: Color(0x20000000),
                        ),
                      ],
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                    // child: Image(
                    //   image: CachedNetworkImageProvider(
                    //     imageUrl,
                    //   ),
                    // ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFF4500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}