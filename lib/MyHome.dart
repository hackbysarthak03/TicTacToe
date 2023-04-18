import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
         SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Scaffold(
      
      backgroundColor: Colors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
    
            child: Container(
                  child: Column(
                  children: [
                    Image.asset('lib/assets/avatar.png', height: 120,width: 120,),
                    
                    const Padding(
                      padding: EdgeInsets.only(top:15.0),
                      child: Text("Sarthak Vishwakarma",style: TextStyle(
                          fontFamily: 'Quicksand-SemiBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                      ),
                      const Padding(
                      padding: EdgeInsets.only(top:2.0,bottom: 40),
                      child: Text("Flutter Developer",style: TextStyle(
                          fontFamily: 'Quicksand-Regular',
                        
                          fontSize: 14
                        ),),
                      ),
                       Container(
                        padding: EdgeInsets.only(left: 35,right: 35),
                        child:Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Expanded(
                              child: Divider(
                                color: Colors.black26,
                                thickness: 1,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: const Text("Connect With Me", style: 
                              TextStyle(
                                fontFamily: 'JosefinSans-SemiBold',
                              )
                              ,),
                              ),
                            const Expanded(
                              child: Divider(
                                color: Colors.black26,
                                thickness: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                       Container(
                      
                        padding: const EdgeInsets.only(left:30, right: 30,top: 20),
                        child: ListTile(
                          leading:Image.asset("lib/assets/gmail.png", height: 24,width: 24,),
                          title: const Text("vsarthak62@gmail.com", style: TextStyle(
                            fontFamily: "Quicksand-Regular",

                          ),),
                          shape:const  RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.black26),
                              
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                      ),
                    
                      Container(
                        padding: const EdgeInsets.only(left:30, right: 30,top: 10),
                        child:  ListTile(
                          leading:Image.asset("lib/assets/linkedin.png", height: 24,width: 24,),
                          title: const Text("/hellosarthak", style:TextStyle(
                            fontFamily: "Quicksand-Regular",
                          ),
                          
                          ),
                          shape:const  RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.black26),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          // tileColor: Color.fromARGB(255, 218, 217, 210),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:30, right: 30,top: 10),
                        child:  ListTile(
                          leading:Image.asset("lib/assets/instagram.png", height: 24,width: 24,),
                          title: const Text("/sarthak_buddy", style:TextStyle(
                            fontFamily: "Quicksand-Regular",
                          ),
                          
                          ),
                          shape:const  RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.black26),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          // tileColor: Color.fromARGB(255, 218, 217, 210),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:30, right: 30,top: 10),
                        child:  ListTile(
                          leading:Image.asset("lib/assets/twitter.png", height: 24,width: 24,),
                          title: const Text("/tweettosarthak", style:TextStyle(
                            fontFamily: "Quicksand-Regular",
                          ),
                          
                          ),
                          shape:const  RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.black26),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          // tileColor: Color.fromARGB(255, 218, 217, 210),
                        ),
                      )
                  ]

                  )
                )
            
          ),
        ],
      ),
      
    );
  }
}