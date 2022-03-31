import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'apiFile.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'apiFile.dart';
import 'inputcity.dart';

class Climate extends StatefulWidget {
  // const Climate(String apiId, String val, { Key? key }) : super(key: key);
  String cityname;
   Climate(@required this.cityname);


  @override
  State<Climate> createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  get cityname => "Pakistan";

  @override
  

Future<Map> getweather(String appId, String city) async {
  String apiUrl =  "https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=${util.apiId}";
  http.Response response = await http.get(Uri.parse(apiUrl));
  // print(response.body);
  return jsonDecode(response.body);
  
}

  // void showStaff() async {
  //   Map data = await getweather(util.apiId, util.defaultCity);
  //   print(data.toString());
  // }

  Widget updateTempWidget(String city){
    return FutureBuilder(
    future: getweather(util.apiId, city == null? util.defaultCity: city),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
      if(snapshot.hasData){
        Map? context = snapshot.data;
        return Container(
          margin: EdgeInsets.fromLTRB(30.0, 90.0, 0.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    context!['main']['temp'].toString()+ 'F',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                ),
                
              )
            ],
          ),
        );
      }else{
          return Container();
    }
    });
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Weather App"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const cityName()))
          }, icon: Icon(Icons.menu))
        ],
        
      ),
      body: Stack(
        children: [
          Center(
            child: Image(
              
              image: AssetImage("images/umbrella.jpg"),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              
              
            ),
          ),
          Container(
            // alignment: Alignmnet.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text('${cityname}', style: cityStyle(),)),
          ),
          Container(
            
            child: updateTempWidget('Sialkot'),
          )
        ],
      ),
    );
  }



}


TextStyle cityStyle(){
return TextStyle(
color: Colors.white,
fontSize: 22.9,
fontStyle: FontStyle.italic
);
}