import 'dart:convert';
import 'package:flutter/services.dart';

class UserModel{
  String name;
  String message;
  String profile;
  String timeOrDate;
  String messageStatus;
  String numberOfMessages;
  UserModel({required this.name,required this.profile,required this.message,required this.timeOrDate,required this.messageStatus,required this.numberOfMessages});
  static fromMap(Map<String,dynamic> json)=>UserModel(name:json['name'], profile:json['profile'], message:json['message'], timeOrDate:json['TimeOrDate'], messageStatus: json['MessageStatus'] ,numberOfMessages: json['NumberOfMessages'] );

}
class StatusModel{
  String name;
  String time;
  String numberOfStatuses;
  String isSeen;
  String status;
  StatusModel({required this.name,required this.time,required this.numberOfStatuses,required this.isSeen,required this.status});
  static fromMap(Map<String,dynamic> json)=>StatusModel(name: json['username'], time: json['Time'], numberOfStatuses: json['NumberOfStatus'], isSeen: json['isSeen'], status: json['status']);

}
class CallsModel{
  String name;
  String type;
  String profile;
  String status;
  String dateTime;
  CallsModel({required this.name, required this.type, required this.profile, required this.status, required this.dateTime});
  static fromMap(Map<String,dynamic> json)=>CallsModel(name: json['name'], type: json['type'], profile: json['profile'], status: json['callStatus'], dateTime: json['Date&Time']);
}

Future<List>loadData()async{

  final json= await rootBundle.loadString('assets/MyJsonFile.json');
  final data= jsonDecode(json);
  return data;
}
Future<List>loadStatus()async{
  final json= await rootBundle.loadString('assets/Statuses.json');
  final statusData=jsonDecode(json);
  return statusData;
  
}
Future<List>loadCalls()async{
  final json=await rootBundle.loadString('assets/Calls.json');
  final callsData=jsonDecode(json);
  return callsData;
}