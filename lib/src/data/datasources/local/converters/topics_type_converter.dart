import 'dart:convert';
import 'package:floor/floor.dart';



class TopicsTypeConverter extends TypeConverter<List<String>?, String> {
  @override
  List<String>? decode(String databaseValue) {
    // Decode the JSON string into a dynamic object
    dynamic decodedJson = json.decode(databaseValue);

// Cast the dynamic object to a List<String>
    List<String> list = List<String>.from(decodedJson);
    return list;
  }

  @override
  String encode(List<String>? value) {
    return json.encode(value);
  }
}