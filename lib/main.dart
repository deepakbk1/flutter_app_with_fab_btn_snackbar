import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() =>
    runApp(

        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UI widgets',
          home: Scaffold(
            appBar: AppBar(
              title: Text("Long List View"),),
            body: getListView(),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Fluttertoast.showToast(msg: "Fab CLicked",
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
              child: Icon(Icons.add),
              tooltip: "Add More Item",
            ),
          ),
        )
    );

List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

void showSnackBar(BuildContext context,String item){
  var snackBar=SnackBar(content: Text("You just click $item"),elevation: 1.0,
  action: SnackBarAction(label: "Undo", onPressed: (){
    Fluttertoast.showToast(msg: "Undo CLicked",
      toastLength: Toast.LENGTH_SHORT,
    );
  }),);
  Scaffold.of(context).showSnackBar(snackBar);
}

Widget getListView() {
  var listItems = getListElements();
  var listView = ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text(listItems[index]),
          onTap: () {
           showSnackBar(context,listItems[index]);
          },
        );
      }
  );
  return listView;
}



