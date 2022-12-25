

import 'dart:convert';

import 'package:api_tutorial/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'API Calling Tutorial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isApiCalled = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChaptersModel>>(
        future: getDataFromApi(),
        builder: (context, snap) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: isApiCalled?
              (  snap.data?.isNotEmpty?? false)?
                ListView.builder(
                    itemCount: snap.data?.length,
                    itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,1),
                          spreadRadius: 0.5,
                            blurRadius:1,
                          color: Colors.black.withOpacity(.2)
                          
                        )
                      ]
                    ),
                    child: ListTile(title: Text(snap.data?[index].name??""),),
                  );
                }):Text("Can't fetch data from API")
            :Text("Let me call api first"),
            // This trailing comma makes auto-formatting nicer for build methods.
          );
        });
  }

  Future<List<ChaptersModel>> getDataFromApi() async {
    isApiCalled = false;
    List<ChaptersModel> chapterList=[];

    Uri uri = Uri.parse("https://bhagavadgitaapi.in/chapters/");
    try{
      return await http.get(uri).then((value) {
        if (value.statusCode == 200) {
          isApiCalled = true;
          var data = jsonDecode(value.body);
          data.forEach((element) {
            chapterList.add(ChaptersModel.fromJson(element));
          });
          return chapterList;
        } else {
          return chapterList;
        }
      });
    }catch(e){
      return chapterList;
    }
  }
}
