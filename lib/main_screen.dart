import 'package:flutter/material.dart';
import 'package:gold_sliver_price/network/dio_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
    getGoldPrice();
    getSilverPrice();
  }
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("TODAY ",style:TextStyle(fontWeight:FontWeight.bold,fontSize: 25) ),
            Text("PRICE",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold,fontSize: 25),),
          ],
        )),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/gold.png",
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 1.5,
                ),
                 Text(
                  "GOLD",
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width/12),
                ),
                
                Text("$goldI💲",style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width/50),),
              ],
            ),
          
           Column(
              children: [
                Image.asset(
                  "assets/sliver.png",
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 1.5,
                ),
                 Text(
                  "SILVER",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width/12),
                ),
                Text("$silverI💲",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width/50),),
              ],
            ),
          ],
        ),
      ),
    );
  }

double? goldD;
int? goldI;
double? silverD;
int? silverI;

 void getGoldPrice(){

  DioHelper.getData('XAU/USD/').then((value){

    setState(() {
    goldD=value.data['price'];
    goldI=goldD!.round();
    print(goldI);

    });

  }).catchError((onError){
    print(onError.toString());
  });


 }



void getSilverPrice(){

  DioHelper.getData('XAG/USD/').then((value){

    setState(() {
    silverD=value.data['price'];
    silverI=silverD!.round();
    print(silverI);

    });

  }).catchError((onError){
    print(onError.toString());
  });


 }
}
