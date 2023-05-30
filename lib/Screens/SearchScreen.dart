import 'package:flutter/material.dart';
import 'package:sicpa_test/Screens/ArticlesScreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => Mysearch();
}

class Mysearch extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none),
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  hintText: "Search articles here",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if(controller.text != "")
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ArticleScreen(word: controller.text , type : "search", title : controller.text)));
                  }

              },
              child: Container(
                  width: 150,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                      child: Text(
                    'Search',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ))),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
