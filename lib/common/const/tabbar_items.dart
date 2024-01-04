import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final ICON_WIDTH = 20.0;
final ICON_HEIGHT = 20.0;

final TABBAR_ICONS = [
  BottomNavigationBarItem(
    icon: SvgPicture.asset("asset/icons/tabbar/home.svg", width: ICON_WIDTH, height: ICON_HEIGHT),
    activeIcon: SvgPicture.asset("asset/icons/tabbar/home.fill.svg", width: ICON_WIDTH, height: ICON_HEIGHT),
    label: '홈',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset('asset/icons/tabbar/shop.svg', width: ICON_WIDTH, height: ICON_HEIGHT),
    activeIcon: SvgPicture.asset('asset/icons/tabbar/shop.fill.svg', width: ICON_WIDTH, height: ICON_HEIGHT),
    label: '쇼핑',
  ),
  // BottomNavigationBarItem(
  //   icon: SvgPicture.asset('asset/icons/tabbar/chat.svg', width: ICON_WIDTH, height: ICON_HEIGHT),
  //   activeIcon: SvgPicture.asset('asset/icons/tabbar/chat.fill.svg', width: ICON_WIDTH, height: ICON_HEIGHT),
  //   label: '채팅'
  // ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset('asset/icons/tabbar/mypage.svg', width: ICON_WIDTH, height: ICON_HEIGHT),
    activeIcon: SvgPicture.asset('asset/icons/tabbar/mypage.fill.svg', width: ICON_WIDTH, height: ICON_HEIGHT),
    label: '마이페이지'
  ),
];