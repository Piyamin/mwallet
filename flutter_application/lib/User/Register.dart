import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Register extends StatefulWidget {
  @override
  
  _RegisterState createState() => _RegisterState();
}
  
  class _RegisterState extends State<Register> {
  Future<http.Response> addUser(String firstname,String lastname, String username, String password) async {
    print(firstname);
    final http.Response response = await http.post(
      Uri.parse('http://192.168.2.123:8080/users/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
          "first_name": firstname,
          "last_name": lastname,
          "user_name": username,
          "user_password": password
      }),
    );
  }
    int dataUser;
  getUser() async {
    http.Response response =
        await http.get('http://192.168.2.123:8080/users/maxid');
    debugPrint(response.body);
    dataUser = json.decode(response.body);
    dataUser = dataUser;
    print(dataUser);
  }
  Future<http.Response> addWallet(int user_id) async {
    user_id = user_id+1;
    // print(firstname);
    final http.Response response = await http.post(
      Uri.parse('http://192.168.2.123:8080/wallet/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "wallet_list_amount": 0,
        "user_id": user_id
      }),
    );
  }

 @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _firstname = new TextEditingController();
    TextEditingController _lastname = new TextEditingController();
    TextEditingController _username = new TextEditingController();
    TextEditingController _password = new TextEditingController();
    
   return Scaffold(
     backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Container(
                    width: 1000,
                    height: 200,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child:Image(image: AssetImage('asset/images/mwallet-logo.png'))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _firstname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'FIRSTNAME',
                    hintText: 'Enter Firstname'),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: TextField(
                controller: _lastname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'LASTNAME',
                    hintText: 'Enter Lastname'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'USERNAME',
                    hintText: 'Enter Username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'PASSWORD',
                    hintText: 'Enter secure password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CONFIRMPASSWORD',
                    hintText: 'Enter password again'),
              ),
            ),
            
            
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  addUser(_firstname.text, _lastname.text, _username.text, _password.text);
                  addWallet(dataUser);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => HomePage((dataUser+1))));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text(
                "Have Account",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Text("Don't have Account")
          ],
        ),
      ),
    );
  }
    
}