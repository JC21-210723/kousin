import 'package:flutter/material.dart';

import 'SettingUserNameChange.dart';
import 'SettingUserDelete.dart';

class StateUserSettings2 extends StatefulWidget{
  final String UserName;
  const StateUserSettings2(this.UserName);

  @override
  State<StateUserSettings2> createState(){
    return UserSettings2();
  }
}

class UserSettings2 extends State<StateUserSettings2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('成分チェッカー'),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:const EdgeInsets.fromLTRB(0, 10, 0, 15),
                      padding:const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepOrange,
                          width: 1,
                        ),
                      ),
                      child:const Text('ユーザー設定',
                        style: TextStyle(
                            fontSize: 30,
                            color:Colors.deepOrange,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      child:Container(
                        width: 280,
                        height: 60,
                        margin: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color:Colors.deepOrangeAccent
                              )
                          ),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width:60,
                              child: const Icon(
                                Icons.account_box,
                                color: Colors.redAccent,
                                size:50,
                              ),
                            ),
                            Container(
                              width: 220,
                              child:Text(widget.UserName,style: const TextStyle(fontSize: 25),textAlign: TextAlign.center,),
                            )
                          ],
                        ),
                      ),
                    ),


                    Container(
                      width:270,
                      height:50,
                      margin: EdgeInsets.fromLTRB(20, 25, 20, 20),
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent
                        ),
                        child: const Text('ユーザー名の変更',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context){
                                return StateSettingUserNameChange(widget.UserName);
                              })
                          );
                        },
                      ),

                    ),
                    Container(
                      width:270,
                      height:50,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent
                        ),
                        child: const Text('アレルゲンの変更',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        onPressed: (){},
                      ),

                    ),
                    Container(
                      width:270,
                      height:50,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.red
                        ),
                        child: const Text('ユーザーの削除',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context){
                                return StateSettingUserDelete(widget.UserName);
                              })
                          );
                        },
                      ),

                    ),

                    Container(
                      width:290,
                      height:90,
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 25),
                      child:OutlinedButton(
                        style:OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.deepOrange
                          ),
                        ),
                        child: const Text('ユーザー選択画面に\n戻る',
                          style: TextStyle(
                            color:Colors.deepOrange,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),

                    ),
                  ]
              )
          )
      ),
    );
  }
}