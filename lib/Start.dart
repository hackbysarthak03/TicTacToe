import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Home.dart';

String playero ='Player O';
String playerx ='Player X';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
        SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.black87,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Text('Tic Tac Toe',style: TextStyle(
                    fontFamily:'punkBoy',
                    fontSize: 30,
                    color: Colors.white
                  ),),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Image.asset('lib/assets/ttt.png', height: 130,width: 130,),
                  ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: TextField(
                      
                        textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color:Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'punkBoy'
                      ),
                      decoration: InputDecoration(
                      
                      hintText: 'Player O',
                      fillColor: Color.fromARGB(111, 255, 255, 255),
                      filled: true,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      
                        
                      ),
                      onChanged: (value){
                        playero = value;
                      },
                
                                    ),
                    ),
                 Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                      child: TextField(
                        textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color:Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'punkBoy'
                      ),
                      decoration: InputDecoration(
                      
                      hintText: 'Player X',
                      fillColor: Color.fromARGB(111, 255, 255, 255),
                      filled: true,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),  
                      ),
                      onChanged: (value){
                        playerx = value;
                      },
                         ),
                    ),
                    Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => Home(playero: playero,playerx: playerx,)));
                    });
                    
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Start Game !',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 15,fontWeight: FontWeight.w500),),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal : 8.0),
                              child: Icon(Icons.start, color: Colors.white,),
                            )
                          ],
                        ),
                    ),
                  ),
                ),
              ),
                
                    
                
                
                ],
              ),
            ),
    
      ),
    );
  }
}


