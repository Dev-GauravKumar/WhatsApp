import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/ViewModel/ViewModel.dart';
import 'package:whatsapp/Widgets/Widgets.dart';
class CallsList extends StatelessWidget {
  const CallsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 final callsList=Provider.of<UserData>(context).calls;
      return buildCallsList(callsList);
  }
}
