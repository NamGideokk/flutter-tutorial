// ignore_for_file: file_names
import 'package:flutter/material.dart';

/// State 저장소
class StateStore extends ChangeNotifier {
  String name = 'NamGideok';
  String image =
      'https://img.wowtv.co.kr/wowtv_news/dnrs/20220330/B20220330181301797.jpg';
  int follower = 0;
  int followState = 0; // 0은 언팔로우 상태, 1은 팔로우 상태

  void clickButton(int state) {
    if (state == 0) {
      followState = 1;
    } else {
      followState = 0;
    }
    print('버튼 클릭');
  }

  void increaseFollower(int state) {
    if (state == 1) {
      follower++;
    } else {
      follower--;
    }
  }
}
