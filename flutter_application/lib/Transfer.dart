import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'HomePage.dart';
class Transfer extends StatefulWidget {
  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {

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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    width: 500.0,
                    height: 100.0,
                    child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Destination account',
                        
                        ),
                    ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  // child:Align(alignment:Alignment(1,1),
                    width: 500.0,
                    height: 100.0,
                    child: TextField(
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                        
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
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => HomePage()));
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
                      child:Align(alignment:Alignment(-1,-12.5),
                      child:Image(image: AssetImage('asset/images/mwallet-logo.png'))
                      ),
                      ),
              ),
            
              Container(
                  padding: const EdgeInsets.only(left:15,right: 0,top:0,bottom: 0),
                  child: Container(
                      width: 500,
                      height:100,
                      child:Align(alignment:Alignment(-0.8,-24.5),
                      child:Text('TRANSFER', 
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
                      child:Align(alignment:Alignment(-0.8,-27),
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
                      child:Align(alignment:Alignment(-0.8,-29),
                      child:Text('Chaima', 
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
                      child:Align(alignment:Alignment(0.2,-28.5),
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
                      child:Align(alignment:Alignment(0.9,-36),
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
                      child:Align(alignment:Alignment(0.9,-32.2),
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
