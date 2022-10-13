import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Screens/CallsList.dart';
import 'package:whatsapp/Screens/ChatsList.dart';
import 'package:whatsapp/Screens/StatusList.dart';
import 'package:whatsapp/Themes/ThemeManager.dart';
import 'package:whatsapp/Widgets/Widgets.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late final TabController _tabController;
  int index=1;
  List<Widget> tabs= [Icon(Icons.camera_alt),Text('Chats'),Text('Status'),Text('Calls'),];
  @override
  void initState(){
    super.initState();
    _tabController=TabController(initialIndex: 1,length: tabs.length, vsync: this);

    _tabController.animation!.addListener(() {setState(()=>index=_tabController.animation!.value.round());});
  }
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ThemeManager>(context);
    return Scaffold(
            appBar: AppBar(
              title: const Text('WhatsApp'),
              actions: [
                Switch(value: provider.themeMode==ThemeMode.dark, onChanged: (value)=>provider.changeTheme(value?ThemeMode.dark:ThemeMode.light),),
                searchButton(),
                menuButton(),
              ],
              bottom: TabBar(controller:_tabController,tabs: tabs,),
            ),
            body: TabBarView(
                controller: _tabController,
                children: [Text('camera'),ChatsList(),StatusList(),CallsList()],
                 ),
            floatingActionButton:Fab(index,context),
    );
  }
}
