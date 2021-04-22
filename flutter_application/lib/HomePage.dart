import 'package:flutter/material.dart';
import 'Deposit.dart';
import "package:intl/intl.dart";
import 'Transfer.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
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
                      context, MaterialPageRoute(builder: (_) => Deposit()));

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
                      context, MaterialPageRoute(builder: (_) => Transfer()));

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
                      child:Text('Piyamin', 
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
                      child:Text('Chaima', 
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
                      child:Text(NumberFormat("#,###").format(123456789), 
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
