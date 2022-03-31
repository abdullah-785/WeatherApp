import 'dart:html';

import 'package:flutter/material.dart';
import 'ClimateFile.dart';
import 'apiFile.dart' as util;

class cityName extends StatefulWidget {
  const cityName({ Key? key }) : super(key: key);

  @override
  State<cityName> createState() => _cityNameState();
}

class _cityNameState extends State<cityName> {
  String ? s_data;
  
  TextEditingController _cityName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _cityName,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Enter City",
              label: Text("City"),
              
              ),
              // onChanged: (val){
              //   setState(() {
              //     s_data=val;
              //     // Climate(util.apiId,val);
              //     // print(s_data);
              //   });
              // },
              ),
            ),
            ElevatedButton(onPressed: ()=>{
              print(_cityName),
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  Climate(_cityName.text)))
            }, child: Text("Search"))
            
            
          ],
        ),
      ),
    );
  }
}