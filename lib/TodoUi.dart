import 'package:flutter/material.dart';

class TodoUi extends StatefulWidget {
  const TodoUi({Key? key}) : super(key: key);

  @override
  State<TodoUi> createState() => _TodoUiState();
}

class _TodoUiState extends State<TodoUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "TodoList App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAlertDialog,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            myCard("Record a Video"),
            myCard("Go To Gym"),
            myCard("Go To Sleep"),
            myCard("Take the money from Mamdouh"),
            myCard("Visit Degla Apartment"),
            myCard("Pay Fees to Yehia"),
            myCard("Prepare for Flutter Session"),
          ],
        ),
      ),
    );
  }

  Widget myCard(String task) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          title: Text("$task",style: TextStyle(
            fontSize: 18.0,
          ),),
          onLongPress: (){
            print("Should get deleted");
          },
        ),
      ),
    );
  }

  void showAlertDialog(){
    showDialog(context: context, builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(
        "Add Task"
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            autofocus: true,
            style: TextStyle(
              fontSize: 10.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: deprecated_member_use
              RaisedButton(onPressed: (){},
                color: Colors.purple,
              child: Text("Add"),)
            ],
          )
        ],
      ),
    ));
  }
}
