import 'package:hive_flutter/hive_flutter.dart';
//import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:phone_book/record_model.dart';
import 'record.dart';
import 'card.dart';
import 'info.dart';


const String recordBoxName = "record_box";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RecordModelAdapter());
  await Hive.openBox<RecordModel>(recordBoxName);
  runApp(MaterialApp(
    home: PhoneBook()
  ));
}

class PhoneBook extends StatefulWidget {
  @override
  State<PhoneBook> createState() => _PhoneBookState();
}

class _PhoneBookState extends State<PhoneBook> {
  List<Record> records = [
    Record(name: 'Murat', number: '05432546706'),
    Record(name: 'Eda', number: '05374577055')
  ];

  late Box<RecordModel> recordBox;

  final _textController = TextEditingController();
  final _textController2 = TextEditingController();

  void initState(){
    super.initState();
    recordBox = Hive.box<RecordModel>(recordBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Phone Book'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Column(
        children: <Widget>[
          ValueListenableBuilder(
              valueListenable: recordBox.listenable(),
              builder: (context, Box<RecordModel> records, _){
                List<int> keys = records.keys.cast<int>().toList();
                return ListView.separated(
                  itemBuilder: (_, index) {
                    final int key = keys[index];
                    final RecordModel? recordM = records.get(key);
                    /*return ListTile(
                      title: Text(recordM?.name ?? ""),
                      subtitle: Text(recordM?.number ?? ""),
                      leading: Text('$key'),
                    );*/
                    return PCard(
                      //record: record,
                      recordMdl: recordM,
                      /*recordName: Text(recordM?.name ?? ""),
                      recordNumber: Text(recordM?.number ?? ""),*/
                      showInfo: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Info(recordMdl: recordM)
                          ),
                        );
                      },
                      delete: () {
                        recordBox.delete(key);
                      },
                    );
                  },
                  separatorBuilder: (_, index) => Divider(),
                  itemCount: keys.length,
                  shrinkWrap: true,
                );
              },
          ),
        ],
      ),
      /*body: SingleChildScrollView( //listedit build bak
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
      ),*/
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
    /*setState(() {
      records.add(Record(name: _textController.text, number: _textController2.text));
    });*/
    final String pName = _textController.text;
    final String pNumber = _textController2.text;
    RecordModel recordM = RecordModel(name: pName, number: pNumber);
    recordBox.add(recordM);

    Navigator.of(context).pop();
  }
}

/*_deleteRecord(var key, ) async {
  await recordBox!.delete(key).whenComplete(( {
      print("Deleted");
      set
  });
}*/

