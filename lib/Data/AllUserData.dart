import 'package:flutter/material.dart';

import '../DB/Database.dart';

class AllUserData{
  //一時的に保持するとこ
  static String sUserName = "";
  static String bName = "";
  static String aName = "";

  //臨時
  static List<String> UserNameList = [];

  //他に要るなら後で

  void setUserName(String nam){
    sUserName = nam;
  }

  String getUserName(){
    return sUserName;
  }

  void setUserNameFinal(){
    debugPrint(sUserName);
    UserNameList.add(sUserName);
    debugPrint('Listのなかみ$UserNameList');
    sUserName = "";
  }

  List<String> getUserNames(){
    sUserName = "";
    return UserNameList;
  }

  void deleteUserName(String name){
    UserNameList.remove(name);
  }

  void changeUserName(String beforeName,String afterName){
    int idx = UserNameList.indexOf(beforeName);   //trueのインデックスを探す
    deleteUserName(beforeName);                   //削除
    UserNameList.insert(idx, afterName);
    debugPrint('Listのなかみ$UserNameList');
  }
  //みちるちゃんの領域
  final dbProvider = DBProvider.instance;

  late String username;

  AllUserData({
    required this.username,
  });

  AllUserData.newAllUserData(){
    username = "";
  }

  Map<String, String> toMap() =>{
    "username":username,
  };
//indexで誰の情報か紐づけで持ってくる
//後でdeleteもほしいね
}
