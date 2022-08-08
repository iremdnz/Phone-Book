import 'package:flutter/material.dart';
import 'record.dart';
import 'card.dart';
import 'info.dart';

void main() => runApp(MaterialApp(
  home: PhoneBook(),
));

class PhoneBook extends StatefulWidget {
  @override
  State<PhoneBook> createState() => _PhoneBookState();
}

class _PhoneBookState extends State<PhoneBook> {
  List<Record> records = [
    Record(name: 'Murat', number: '05432546706'),
    Record(name: 'Eda', number: '05374577055')
  ];

  final _textController = TextEditingController();
  final _textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Phone Book'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView( //listedit build bak
        child: Column(
          children: records.map((record) => PCard(
            record: record,
            showInfo: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Info(record: record)
                  ),
                );
            },
            delete: () {
              setState(() {
                records.remove(record);
              });
            },
          )).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        foregroundColor: Colors.black,
      ),
    );
  }

  Future openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Add new person'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(hintText: 'Person name'),
            ),TextField(
              controller: _textController2,
              decoration: InputDecoration(hintText: 'Person number'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Submit'),
          onPressed: submit,
        ),
      ],
    ),
  );

  void submit(){
    setState(() {
      records.add(Record(name: _textController.text, number: _textController2.text));
    });
    Navigator.of(context).pop();
  }
}

