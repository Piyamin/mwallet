import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Deposit/Deposit.dart';
import "package:intl/intl.dart";
import 'package:flutter_application/Transfer/Transfer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../main.dart';

class HomePage extends StatefulWidget {
  int args;
  HomePage(int args){
    this.args = args;
  }
  @override
  State<StatefulWidget> createState(){
    return _HomePageState(args);
  }
}
class _HomePageState extends State<HomePage> {
  int args;

  _HomePageState(int args){
    this.args = args;
    print(args);
  }
@override
  Map dataUser;
  Map dataWallet;
  var first_name;
  var last_name;
  var amount;
  List userData;
  getUser() async {
    http.Response response =
        await http.get('http://192.168.2.123:8080/users/$args');
    debugPrint(response.body);
    dataUser = json.decode(response.body);
    print(dataUser['user_id']);

    setState(() {
      first_name = dataUser['first_name'];
      last_name = dataUser['last_name'];
    });
    print(first_name);
  }
  getBalance() async {
    http.Response response1 =
        await http.get('http://192.168.2.123:8080/wallet/$args');
    debugPrint(response1.body);
    dataWallet = json.decode(response1.body);
    print(dataWallet['wallet_list_amount']);
    // debugPrint(dataWallet['wallet_list_id']);
    setState(() {
      amount = dataWallet['wallet_list_amount'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
    getBalance();
  }

  Widget build(BuildContext context ) {

    if(dataUser.hashCode == null || dataWallet.hashCode == null){
     return new CircularProgressIndicator();
    }
    else 
    return Scaffold(
      body: Container(
        child: Wrap(
          children: <Widget>[   
            Container(
                padding: const EdgeInsets.only(left:15.0,right: 15.0,top:50,bottom: 0),
                child: FlatButton(
                  onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginDemo()));
                  },
                  child: Container(
                      child:Align(alignment:Alignment(1,-1),
                      child:Image(image: AssetImage('asset/images/mwallet-logout.png'),width: 30,
                      height:30,)
                      )       
              ),
              ),
            ),
            Container(
                  padding: const EdgeInsets.only(left:0,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 200,
                      height:200,
                      child:Align(alignment:Alignment(-1,-2),
                      child:Image(image: AssetImage('asset/images/mwallet-logo.png'))
                      ),
                      ),
              ),
              // diposit
            Container(
                padding: const EdgeInsets.only(left:15,right: 15,top:0,bottom: 10),
                child:Container(
                    height: 200,
                    width: 500,
                    decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Deposit(args)));

                    },
                    child:Align(alignment:Alignment(-1,-0.1),
                    child:Image(image: AssetImage('asset/images/mwallet-deposit.png'),width: 100,
                      height:100,)
                    ),
                  ),
                  ), 
            ),
            // transfer
            Container(
                padding: const EdgeInsets.only(left:15,right: 15,top:0,bottom: 10),
                child:Container(
                    height: 200,
                    width: 500,
                    decoration: BoxDecoration(
                    color: Colors.orange, borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Transfer(args)));

                    },
                    child:Align(alignment:Alignment(-1,-0.1),
                    child:Image(image: AssetImage('asset/images/mwallet-transfer.png'),width: 100,
                      height:100,)
                    ),
                  ),
                  ), 
            ),
            Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(0.5,-12),
                      child:Text('DEPOSIT', 
                      style: TextStyle(color: Colors.black, fontSize: 30),),
                      ),
                      ),
              ),
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(0.5,-14),
                      child:Text('MONEY', 
                      style: TextStyle(color: Colors.black, fontSize: 30),),
                      ),
                      ),
              ),
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(0.5,-12),
                      child:Text('TRANSFER', 
                      style: TextStyle(color: Colors.black, fontSize: 30),),
                      ),
                      ),
              ),
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(0.5,-14),
                      child:Text('MONEY', 
                      style: TextStyle(color: Colors.black, fontSize: 30),),
                      ),
                      ),
              ),
              
            // name
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(-0.8,-31),
                      child:Text('$first_name', 
                      style: TextStyle(color: Colors.black, fontSize: 30),),
                      ),
                      ),
              ),
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(-0.8,-33),
                      child:Text('$last_name', 
                      style: TextStyle(color: Colors.black, fontSize: 30),),
                      ),
                      ),
              ),
              // Amount
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(0.2,-32),
                      child:Text('Balance', 
                      style: TextStyle(color: Colors.blue, fontSize: 20),),
                      ),
                      ),
              ),
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(0.9,-40),
                      child:Text(NumberFormat("#,###").format(amount), 
                      style: TextStyle(color: Colors.blue, fontSize: 30,fontWeight: FontWeight.bold),),
                      ),
                      ),
              ),
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(0.9,-35.5),
                      child:Text('Bath', 
                      style: TextStyle(color: Colors.blue, fontSize: 20),),
                      ),
                      ),
              ),
          ]
        )
        
     )
  );
  }
}
