import 'package:flutter/material.dart';
import 'package:technews/backend/functions.dart';
import 'package:technews/components/appbar.dart';
import 'package:technews/components/newsbox.dart';
import 'package:technews/components/searchbar.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/constant.dart';

class science extends StatefulWidget {
  const science({ Key? key }) : super(key: key);

  @override
  _scienceState createState() => _scienceState();
}

class _scienceState extends State<science> {

  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews('science');
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: appbar(),
      body: Column(
        children: [
          SearchBar(category: 'science',),
          Expanded(
            child: Container(  
              width: w,
              child: FutureBuilder<List>(
                future: fetchnews('science'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsBox(
                          url: snapshot.data![index]['url'],
                          imageurl: snapshot.data![index]['urlToImage'] != null ? snapshot.data![index]['urlToImage'] : Constants.imageurl,
                          title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description: snapshot.data![index]['description'].toString(),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return Center(  
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                },


              ),
          )
          )
        ],
      ),
    );
  }
}