import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sicpa_test/Models/ArticlesModel.dart';

class ArticleItem extends StatelessWidget{
  ArticlesModel? article ;
  ArticleItem({this.article,super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
          contentPadding: EdgeInsets.all(15),
          title:  Padding(
            padding: const EdgeInsets.only( bottom: 8),
            child: Text("${article!.title}" , style: TextStyle(
              fontSize: 18 , fontWeight: FontWeight.w500
            ),),
          ),
          subtitle: Text("${DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.parse(article!.date!))}" , style: TextStyle(
            color: Colors.black87
          ),)
          );
  }
}