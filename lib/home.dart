import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart'as http;


class HomePage extends StatefulWidget {
  HomePage({super.key,  this.user});
  final String? user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List news=[];
  List imagess=[];
  List desList=[];

  List<bool> check=[];
  List<bool> check2=[];

  //FirebaseAuth inst=FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // inst.authStateChanges().listen((User? user) {

    //  });
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Text(
          "Mealz",
        ),
      ),
      body: Center(
        child:
        ListView.separated(itemBuilder: (context, index) {

          return Column(

            children:[
              Container(color: Colors.blueGrey,),
              Row(
                children:[
                  Image.network(imagess[index]),
                  // Image.asset('assets/images/news.png'),

                  Column(

                    children:[
                      Text(news[index],
                        style:  TextStyle(fontStyle: FontStyle.italic ,
                            fontSize: 20,backgroundColor: Colors.deepOrange,color:Colors.white ),

                      ),
                      Container(
                        width: 450,
                        height: 250,

                        child: Text(desList[index],style: TextStyle(fontWeight: FontWeight.bold, ),),
                      ),
                      Row(children:[
                        IconButton(
                          color: check[index] ?Colors.black :Colors.red,
                          icon: Icon(Icons.favorite),
                          iconSize: 50,
                          onPressed: () {
                            setState(() {
                              check[index]=!check[index];
                            });
                          }, ),
                        IconButton(
                          color: check2[index] ?Colors.black :Colors.blue,
                          icon: Icon(Icons.mood_bad_outlined),
                          iconSize: 50,
                          onPressed: () {
                            setState(() {
                              check2[index]=!check2[index];
                            });
                          },
                        ),
                      ],
                      ) ],  ),
                ],
              ),
            ],
          );
        },
          separatorBuilder: (context, index){
            return Container(
              color: Colors.deepOrange,
              height: 3 ,
              width: double.infinity,
            );
          } , itemCount: news.length,)
        ,
      ),

    );
  }
  getData() async //work..in..the..background
      {
    // finish this first->take along
/* var response=
 await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=8c8f9eb739764d4e9afa1438762e673b"));
*/
    var response=
    await http.get(Uri.parse("http://www.themealdb.com/api/json/v1/1/categories.php"));
    print(response.statusCode); //200..Get->Done
    var data=jsonDecode(response.body );
//var dataList=data['articles'];
    var dataList=data["categories"];
//print(data['articles'][0]['title']);
/*setState(() {
   for(var item in dataList){
    String tit=item['title'];
    news.add(tit);
   }
});*/
    setState(() {
      for(var item in dataList){
        String tit=item['strCategory'];
        String image=item["strCategoryThumb"];
        String desc=item['strCategoryDescription'];
        imagess.add(image);
        news.add(tit);
        desList.add(desc);
        for(int i=0;i<imagess.length;i++){
          check.add(true);          check2.add(true);

        }
      }
    });
  }
}
