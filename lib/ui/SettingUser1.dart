import 'package:flutter/material.dart';

import '../DB/Database.dart';
import '../Data/AllUserData.dart';
import 'SettingUser2.dart';


class StateUserSettings1 extends StatefulWidget{
  const StateUserSettings1({super.key});

  @override
  State<StateUserSettings1> createState(){
    return UserSettings1();
  }
}

class UserSettings1 extends State<StateUserSettings1>{

  void PageRoute(String name) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return StateUserSettings2(name);
        })
    );
  }

  AllUserData aud = AllUserData(username: AllUserData.sUserName);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('成分チェッカー'),
      ),
      body: Center(
          child:SingleChildScrollView(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    margin:const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                    margin:const EdgeInsets.all(20),
                    child: const FittedBox(
                      child: Text('登録内容を変更する\nユーザーを選択してください',
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color:Colors.deepOrange)
                    ),
                    child:Container(
                      width:265,
                      height: 290,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:Colors.deepOrange)
                      ),
                      child:Column(
                        children: [

                          if(DBProvider.userName.isEmpty)...[
                            Container(
                              margin:EdgeInsets.fromLTRB(0, 70, 0, 70),
                              child:const Text('ユーザーが\n登録されていません',
                                  style:TextStyle(
                                      fontSize: 25,color:Colors.black87,
                                      fontWeight: FontWeight.bold,
                                  ),textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                          for(String n in DBProvider.userName)...[
                            Container(
                              width: 240,
                              height: 50,
                              margin: const EdgeInsets.all(2),
                              child:OutlinedButton(
                                style:OutlinedButton.styleFrom(
                                    side:const BorderSide(
                                        color: Colors.deepOrangeAccent
                                    )
                                ),
                                child:Text(n,style:const TextStyle(fontSize: 25,color:Colors.black87)),
                                onPressed: (){
                                  PageRoute(n);
                                },
                              ),
                            ),
                          ]

                        ],
                      ),

                    ),
                  ),

                ]
            ),
          )

      ),
    );
  }

}



bool NullHantei(){
  return true;
}
