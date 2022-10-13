import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/ViewModel/ViewModel.dart';
import 'package:whatsapp/Widgets/Widgets.dart';

class StatusList extends StatelessWidget {
  const StatusList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData=Provider.of<UserData>(context).UserDetails;
    final statusList=Provider.of<UserData>(context).statuses;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         statusListHeader(userData['profilePic']!),
          DivisionText('Recent updates'),
          buildStatusList(statusList.where((element) => element.isSeen=='not seen',).toList()),
          DivisionText('Viewed updates'),
          buildStatusList(statusList.where((element) => element.isSeen=='seen',).toList()),
        ],
      ),
    );
  }
}