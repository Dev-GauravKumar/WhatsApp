import 'package:flutter/material.dart';
import 'package:whatsapp/Model/users_data.dart';

class UserData with ChangeNotifier{
  Map<String,String> UserDetails={
  "userName":"Gaurav",
  "profilePic":"https://images.unsplash.com/photo-1608889175123-8ee362201f81?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
    "status":"Hey There I'm Using Whatsapp"
};

  final List<UserModel> chats=[];
  final List<StatusModel> statuses=[];
  final List<CallsModel> calls=[];
  UserData(){
    init();
  }
  void init()async {
    print("init called");
    final data=await loadData();

    for(var json in data){
      if(json['MessageStatus']=='not seen'){
        chats.insert(0, UserModel.fromMap(json));
      }else{
        chats.add(UserModel.fromMap(json));
      }
    }

    final statusData=await loadStatus();
    for(var json in statusData){
      statuses.add(StatusModel.fromMap(json));
    }

    final callsData=await loadCalls();
    for(var json in callsData){
      calls.add(CallsModel.fromMap(json));
    }
    notifyListeners();
  }
}