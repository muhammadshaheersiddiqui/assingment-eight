import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Colors.orange),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: deprecated_member_use, prefer_collection_literals
  List todos = [];
  String input = '';

  @override
  void initState() {
    super.initState();
    todos.add("DEFAULT (1)");
    todos.add("DEFAULT (2)");
    todos.add("DEFAULT (3)");
    todos.add("DEFAULT (4)");
    todos.add("DEFAULT (5)");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.orange,
              ))
        ],
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.format_list_bulleted,
              color: Colors.orange,
            )),
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'MyTodos',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.orange),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Center(
                    child: Text(
                      "Add TodoList",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            todos.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  color: Colors.orange,
                  elevation: 4,
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    title: Text(todos[index]),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            todos.removeAt(index);
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black,
                        )),
                  ),
                ));
          }),
    );
  }
}
