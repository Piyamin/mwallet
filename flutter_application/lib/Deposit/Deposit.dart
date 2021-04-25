import 'dart:ffi';

import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:flutter_application/User/HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Deposit extends StatefulWidget {
   int args;
  Deposit(int args){
    this.args = args;
  }
  @override
  _DepositState createState() => _DepositState(args);

}

class _DepositState extends State<Deposit> {
   int args;
  _DepositState(int args){
    this.args = args;
  }
@override
  Map dataUser;
  Map dataWallet;
  var first_name;
  var last_name;
  double amount;
  int walletId;
  int userid;
  // List userData;
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
      amount = dataWallet['wallet_list_amount'].toDouble();
      userid = dataWallet['user_id'];
      walletId = dataWallet['wallet_list_id'];
    });
  }
 Future<http.Response> updateAmount(int walletId,double amount , int Userid,) async {
  final http.Response response = await http.put(
    Uri.parse('http://192.168.2.123:8080/wallet/$args'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'wallet_list_id': walletId,
      'wallet_list_amount': amount,
      'user_id':Userid,
    }),
  );
}
 Future<http.Response> addTransection(int walletId,double amount , int Userid) async {
  final http.Response response = await http.post(
    Uri.parse('http://192.168.2.123:8080/wallet/transection'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
       "transection_receiver": Userid,
        "user_id": Userid,
        "wallet_list_id": walletId,
        "financial_id": 1,
        "transection_amount": amount
    }),
  );
}
  @override
  void initState() {
    super.initState();
    getUser();
    getBalance();
  }

  Widget build(BuildContext context) {
    TextEditingController _amount = new TextEditingController();
        return Scaffold(
          body: Container(
            child: Wrap(
              children: <Widget>[
                
                Container(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0,top:50,bottom: 0),
                    child: FlatButton(
                      onPressed: () {
                      Navigator.pop(context);
                      },
                      child: Container(
                          child:Align(alignment:Alignment(1,-1),
                          child:Image(image: AssetImage('asset/images/mwallet-home.png'),width: 50,
                          height:50,)
                          )       
                  ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left:15,right: 15,top:150,bottom: 80),
                    child:Container(
                        height: 5,
                        width: 500,
                        decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                      ), 
                ),
                // Amount
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      // child:Align(alignment:Alignment(1,1),
                        width: 500.0,
                        height: 100.0,
                        child: TextField(
                        controller: _amount,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Amount',
                        
                        ),
                    ),
                  // ),
                ),
              ),
            Container(
                padding: const EdgeInsets.only(left:80,right: 15,top:0,bottom: 10),
                child:Container(
                    height: 50,
                    width: 230,
                    decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                    child: FlatButton(
                      onPressed: () {
                        print(_amount.text);
                        setState((){
                         amount = amount + double.parse(_amount.text);
                          // Set state like this'

                        });
                        updateAmount(walletId,amount,userid);
                        addTransection(walletId,double.parse(_amount.text),userid);
                        print(amount);
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => HomePage(userid)));
                      },
                      child: Text(
                        'CONFIRM',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ), 
            ),
            Container(
                  padding: const EdgeInsets.only(left:0,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 200,
                      height:200,
                      child:Align(alignment:Alignment(-1,-9),
                      child:Image(image: AssetImage('asset/images/mwallet-logo.png'))
                      ),
                      ),
              ),
            
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(-0.8,-17),
                      child:Text('DEPOSIT', 
                      style: TextStyle(color: Colors.black, fontSize: 40),),
                      ),
                      ),
              ),
      
             // name
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(-0.8,-21),
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
                      child:Align(alignment:Alignment(-0.8,-23),
                      child:Text('$last_name', 
                      style: TextStyle(color: Colors.black, fontSize: 30),),
                      ),
                      ),
              ),
              // Balance
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(0.2,-23.5),
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
                      child:Align(alignment:Alignment(0.9,-30),
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
                      child:Align(alignment:Alignment(0.9,-27.2),
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
