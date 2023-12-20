import 'package:flutter/material.dart';
import '../DB/Database.dart';
import '../Data/AllUserData.dart';

class StateSettingUserDelete extends StatefulWidget{
  final String UserName;

  StateSettingUserDelete(this.UserName);

  @override
  State<StateSettingUserDelete> createState(){
    return SettingUserDelete();
  }
}

class SettingUserDelete extends State<StateSettingUserDelete>{
  bool Agree = false;
  String UN = "";
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
                    margin:const EdgeInsets.fromLTRB(0, 10, 0, 30),
                    padding:const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    color:Colors.red,
                    child:const Text('ユーザーの削除',
                      style: TextStyle(
                          fontSize: 28,
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    width: 310,
                    child:Transform.scale(
                        scale: 1.2,
                        child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title:Transform.translate(
                              offset: const Offset(-15, 0),
                              child:const Text('このユーザーを削除する',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                            ),
                            value: Agree,
                            onChanged:(value) {
                              setState(() {
                                Agree = value!;
                              });
                            }
                        )

                    ),
                  ),

                  Container(
                    margin:const EdgeInsets.fromLTRB(10,20,10,10),
                    child:const Text('削除するユーザー名を\n入力してください',
                      style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.fromLTRB(10,10,10,10),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red)
                    ),
                    child:SizedBox(
                      width:200,
                      child:TextField (
                        style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                        maxLength: 7,
                        onChanged: (value){
                          UN = value;
                        },
                      ),
                    ),
                  ),
                  Container(
                      width: 200,
                      height:60,
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child:const Text('削除',style: TextStyle(fontSize: 28),),
                        onPressed: (){
                          setState(() {
                            if(widget.UserName == UN && Agree == true){
                              _deleteUser();
                              _selectlistUser();
                              _deletefood();//追加
                              //aud.deleteUserName(widget.UserName);

                            }else{
                              //エラーメッセが欲しいけど今出す場所ない
                            }
                          });
                          //ユ－ザー選択画面(ChooseUser)
                          Future.delayed(Duration(seconds: 1)).then((_){
                            Navigator.popUntil(context,ModalRoute.withName('ChooseUser_page'));
                          });
                        },
                      )
                  ),
                ]
            ),
          )

      ),
    );
  }
  final dbProvider = DBProvider.instance;
  //ユーザの追加処理
  void _deleteUser() async {
    debugPrint('_deleteUserに来ました');
    final rowsDeleted = await dbProvider.deleteUser(widget.UserName);
    print('削除しました $rowsDeleted');
  }
  //ユーザの参照
  void _selectlistUser() async {
    debugPrint('_selectAllUserにきました');
    final result = await dbProvider.selectlistUser();
    debugPrint('userNameの中身$result');
  }

  //お試し
  //食品の削除
  void _deletefood() async {
    debugPrint('_deleteUserに来ました');
    final int userid = await dbProvider.selectUserId(AllUserData.sUserName);// ユーザーIDを非同期で取得
    final rowsDeleted = await dbProvider.deletefood(userid);
    print('削除しました $rowsDeleted');
  }

}