import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tictactoe/MyHome.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'Start.dart';



class Home extends StatefulWidget {
   Home({super.key, required this.playerx, required this.playero});
String playerx = 'Player X';
String playero = 'Player O';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
List<String> zeroVal = ['','','','','','','','','',];
bool oturn = true;   // player 1 is O

  int ohwin = 0;
  int exwin = 0;
  int count = 0;
  final assetsAudioPlayer = AssetsAudioPlayer();

  String getCurrentVal(){
    if(oturn == true){
      return '$playero';
    }else{
      return '$playerx';
    }
  }

  void builder(int index){
    setState(() {
      if(zeroVal[index] ==''){
        count++;
        assetsAudioPlayer.open(
          Audio('lib/assets/tap.mp3'),
        );
      if(oturn){
        zeroVal[index] = 'O';
        
      }else{
        zeroVal[index] = 'X';
      }

      oturn = !oturn;
      checkWinner();
      }
    });
  }

  void checkWinner(){

    if(zeroVal[0] == zeroVal[1] && zeroVal[0] == zeroVal[2] && zeroVal[0] != ''){
      showBox(zeroVal[0]);
    }
    else 
    if(zeroVal[3] == zeroVal[4] && zeroVal[3] == zeroVal[5] && zeroVal[3] != ''){
      showBox(zeroVal[3]);
    }
    else 
    if(zeroVal[6] == zeroVal[7] && zeroVal[6] == zeroVal[8] && zeroVal[6] != ''){
      showBox(zeroVal[6]);
    }
    else 
    if(zeroVal[0] == zeroVal[3] && zeroVal[0] == zeroVal[6] && zeroVal[0] != ''){
      showBox(zeroVal[0]);
    }
    else 
    if(zeroVal[1] == zeroVal[4] && zeroVal[1] == zeroVal[7] && zeroVal[1] != ''){
      showBox(zeroVal[1]);
    }
    else 
    if(zeroVal[2] == zeroVal[5] && zeroVal[2] == zeroVal[8] && zeroVal[2] != ''){
      showBox(zeroVal[2]);
    }
else 
    if(zeroVal[0] == zeroVal[4] && zeroVal[0] == zeroVal[8] && zeroVal[0] != ''){
      showBox(zeroVal[0]);
    }
    else 
    if(zeroVal[2] == zeroVal[4] && zeroVal[2] == zeroVal[6] && zeroVal[2] != ''){
      showBox(zeroVal[2]);
    }
else if(count == 9)
      {
          
            setState(() {
        
                Alert(context:context,
                    title: ': DRAW :',
                    image: Image.asset('lib/assets/draw.gif', height:100,width: 100,),
                    style: AlertStyle(
                      isCloseButton: false,
                      isButtonVisible: false,
                      animationType: AnimationType.grow,
                    )
                ).show();
                count = 0;
                playDraw();
                clearAll();
            });
      }


  }


  void clearAll(){
    setState(() {
      for(int i =0 ;i<9;i++){
        zeroVal[i]='';
      }
    });
  }

  void showBox(String s){
    count = 0;
    String win;
    if(s == 'X'){
      win = playerx;
        oturn = false;
        exwin++;
    }else{
      win = playero;
        oturn = true;
        ohwin++;
    }
    assetsAudioPlayer.open(
          Audio('lib/assets/win.mp3'),
        );
    Alert(
      context: context,
      image: Image.asset('lib/assets/trophy.gif',),
      title: ": WINNER :",
      desc: "Winner is $win !",
      style: AlertStyle(
        isCloseButton: false,
      ),
      buttons: [
        DialogButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Play Again !",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20,fontWeight: FontWeight.w500),
              ),
              Icon(Icons.restart_alt, color: Colors.white,)
            ],
          ),

          onPressed: () {
            clearAll();
            Navigator.pop(context);
          },
          color: Colors.green[600],
        ),
      ],
    ).show();
  }
  

  @override
  Widget build(BuildContext context) {
        SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Scaffold(
      backgroundColor: Color.fromARGB(136, 20, 20, 20),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome()));
              },
              child: Icon(Icons.grid_3x3)),
          )
        ],
        leading: Icon(Icons.grid_3x3),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(
              color: Color.fromARGB(250, 255, 255, 255), fontWeight: FontWeight.w500, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical : 20.0, horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(playero,style: TextStyle(
                                    color: Color.fromARGB(250, 255, 255, 255), fontWeight: FontWeight.w500, fontSize: 15), ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(ohwin.toString(),style: TextStyle(
                                      color: Color.fromARGB(250, 255, 255, 255), fontWeight: FontWeight.w500, fontSize: 25),),
                        )
                      ],
                    ),
                  ),
                
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                       
                        Text(playerx,style: TextStyle(
                                    color: Color.fromARGB(250, 255, 255, 255), fontWeight: FontWeight.w500, fontSize: 15), ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(exwin.toString(),style: TextStyle(
                                      color: Color.fromARGB(250, 255, 255, 255), fontWeight: FontWeight.w500, fontSize: 25),),
                        ),        
                      ],
                    ),
                  )
                ],
              ),
            ),
      
            Expanded
            (
              child: GridView.builder(
                itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                  itemBuilder: (BuildContext context, int index) {
                    
                        return GestureDetector(
                          onTap: (){
                              builder(index);
                          },
                          child: Card(
                            elevation: 10,
                            child: Center(
                              child: Text(zeroVal[index], style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color: Colors.black)),
                            ),
                          ),
                        );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getCurrentVal(),style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500)),
                Text('\'s Turn !',style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400)),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 20),
                  child: GestureDetector(
                    onTap: () {
                        setState(() {
                        oturn = !oturn;
                        showAlert();
                        });
                    },

                    child: Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 93, 93),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Change Turn !',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 15,fontWeight: FontWeight.w500),),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal : 8.0),
                              child: Icon(Icons.refresh, color: Colors.white,),
                            )
                          ],
                        ),
                    ),
                  ),
                ),
                Expanded
                (
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                          setState(() {
                          count = 0;
                          clearAll();
                          });
                      },
                
                      child: Container(
                        height: 40,
                        
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Clear ',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 12,fontWeight: FontWeight.w500),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal : 8.0),
                                child: Icon(Icons.cleaning_services_outlined, color: Colors.white,),
                              )
                            ],
                          ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {
                    setState(() {
                      count = 0;
                      clearAll();
                      ohwin = 0;
                      exwin = 0;
                    });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Restart Game !',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 15,fontWeight: FontWeight.w500),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal : 8.0),
                          child: Icon(Icons.refresh, color: Colors.white,),
                        )
                      ],
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void showAlert() {
    playCheat();
    Alert(context:context ,title: 'You are going to Cheat !', image:  Image.asset('lib/assets/sad.gif',), style: AlertStyle(isCloseButton: false, animationType: AnimationType.grow, isButtonVisible: false)).show();
  }
  
  void playDraw() {
    assetsAudioPlayer.open(
          Audio('lib/assets/draw.mp3'),
        );
  }
  void playCheat(){
assetsAudioPlayer.open(
          Audio('lib/assets/cheat.mp3'),
        );
  }
}