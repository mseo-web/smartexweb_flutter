// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class BottomNavbar extends StatefulWidget {
//   @override
//   _BottomNavbarState createState() => _BottomNavbarState();
// }

// class _BottomNavbarState extends State<BottomNavbar> {
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.white,
//       selectedItemColor: Color(0xFF606060),
//       unselectedItemColor: Color(0x80606060),
//       type: BottomNavigationBarType.fixed,
//       items: <BottomNavigationBarItem>[
//         navBarItem('Главная', index: 0, icon: CustomIcons.home, firstColor: Color(0xFF02EFFD), secondColor: Color(0xFF48AFFD)),
//         navBarItem('Мои отклики', index: 1, icon: Icons.check_circle_outline, firstColor: Color(0xFF34F8DA), secondColor: Color(0xFF43E980), badgeCounter: 5),
//         navBarItem('Лента', index: 2, icon: CustomIcons.list, firstColor: Color(0xFFFED000), secondColor: Color(0xFFFFAD00), iconSize: 15.w, badgeCounter: 14),
//         navBarItem('Уведомления', index: 3, icon: CustomIcons.notification, firstColor: Color(0xFFFFBCDE), secondColor: Color(0xFFFC337C), badgeCounter: 30),
//         navBarItem('Настройки', index: 4, icon: CustomIcons.settings, firstColor: Color(0xFFA3D5FF), secondColor: Color(0xFF6581D2)),
//       ],
//       currentIndex: selectedIndex,
//       onTap: (value) => setState(() {
//         selectedIndex = value;
//       }),
//     );
//   }

//   BottomNavigationBarItem navBarItem(String title, {int badgeCounter = 0, IconData icon, double iconSize, Color firstColor, Color secondColor, int index}) {
//     return BottomNavigationBarItem(
//       label: Text(title, style: TextStyle(color: Color(0xFF606060 - ((index == selectedIndex) ? 0 : 0x80000000)), fontSize: 11.w, fontWeight: FontWeight.w500))
//           .padding(EdgeInsets.only(top: 7.w)),
//       icon: Stack(
//         alignment: Alignment.topRight,
//         children: <Widget>[
//           Opacity(
//             opacity: (index == selectedIndex) ? 1 : 0.5,
//             child: RoundedGradientIcon(
//               iconSize: iconSize,
//               firstColor: firstColor,
//               secondColor: secondColor,
//               icon: icon,
//               radius: 30.w,
//             ),
//           ),
//           Visibility(
//             visible: badgeCounter != 0,
//             child: Container(
//               padding: EdgeInsets.all(1.w),
//               height: 15.w,
//               width: 15.w,
//               alignment: Alignment.center,
//               child: AutoSizeText(
//                 badgeCounter.toString(),
//                 minFontSize: 6,
//                 style: TextStyle(fontSize: 10.w, color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//               decoration: BoxDecoration(
//                 color: Color(0xFFFF0000),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }