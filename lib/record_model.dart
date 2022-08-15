import 'package:hive/hive.dart';
part 'record_model.g.dart';
//flutter packages pub run build_runner build

@HiveType(typeId: 0)
class RecordModel{
  @HiveField(0)
  String name;
  @HiveField(1)
  String number;

  RecordModel({required this.name,required this.number});

}

