import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sicpa_test/DB/LocalModel.dart';
import 'package:sicpa_test/Providers/ArticlesPr.dart';

import '../DB/DatabaseHelper.dart';
import '../Widgets/ArticleItem.dart';

class ArticleScreen extends StatefulWidget {
  final word;
  final type;
  final title;
  const ArticleScreen({super.key ,required this.word,required this.type,required this.title});

  @override
  State<ArticleScreen> createState() => Artscreen();
}

class Artscreen extends State<ArticleScreen> {
  var preventCall = false;
  var connect = true;
  final dbHelper = DatabaseHelper.instance;
  List<LocalModel> data = [];
  @override
  void initState() {
    super.initState();
    callapi();


  }
  @override
  void dispose() {
    super.dispose();
  }
  Future<void> callapi()
  async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Provider.of<ArticlePr>(context, listen: false).getArticlesbySearch( widget.word , widget.type);
        });
      }
    } on SocketException catch (_) {
      dbHelper.queryAllRows().then((value) {
        setState(() {
           connect =false;
          data = value.map((e) => LocalModel.fromJson(e)).toList();
          print(data[0].date);
          print(data.length);
        });
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.title),
      ),
      body: connect ?  Consumer<ArticlePr>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final articcle = value.articles;
          return ListView.builder(
            itemCount: articcle.length,
            itemBuilder: (context, index) {
              final acl = articcle[index];
              return ArticleItem(article: acl,);
            },
          );
        },
      ) :
      ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
              dense: true,
              contentPadding: EdgeInsets.all(15),
              title:  Padding(
                padding: const EdgeInsets.only( bottom: 8),
                child: Text("${data[index].title}" , style: TextStyle(
                    fontSize: 18 , fontWeight: FontWeight.w500
                ),),
              ),
              subtitle: Text("${DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.parse(data[index].date!))}" , style: TextStyle(
                  color: Colors.black87
              ),)
          );
        },
      ),
    );
  }
}