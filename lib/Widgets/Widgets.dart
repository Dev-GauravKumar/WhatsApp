import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Screens/ChatBox.dart';
import 'package:whatsapp/Themes/ThemeManager.dart';

Widget searchButton(){
  return IconButton(onPressed: (){}, icon: const Icon(Icons.search));
}
Widget menuButton(){
  return IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_rounded));
}

Widget buildChatList(List chatList,BuildContext context){
  return ListView.builder(
      physics: const BouncingScrollPhysics(),
  itemCount: chatList.length,
  itemBuilder: (context,index){
  return ListTile(
    leading: ClipOval(
      child:CachedNetworkImage(imageUrl:chatList[index].profile,height: 50.0,width: 50.0,placeholder: (context,_){
        return  const CircularProgressIndicator();
      },
      ),
    ),
    title: Text(chatList[index].name),
    subtitle: Text(chatList[index].message),
    trailing: chatList[index].messageStatus=='seen'?Text(chatList[index].timeOrDate,style: TextStyle(color: Colors.grey),)
        :Column(
      children: [
        Text(chatList[index].timeOrDate,style: TextStyle(color: Colors.green),),
        CircleAvatar(child: Text(chatList[index].numberOfMessages,style: TextStyle(color: Colors.white,fontSize: 10.0),),backgroundColor: Colors.green,radius: 10.0,)
      ],
    ),
    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatBox(user:chatList[index]),),),
  );
  }
  );
}

Widget Fab(int index,BuildContext context){
  final themeMode=Provider.of<ThemeManager>(context).themeMode;
  final buttonTheme=Theme.of(context).floatingActionButtonTheme.copyWith(backgroundColor: themeMode==ThemeMode.light?Colors.grey:Colors.black87);
  return index==0?Container():index==1?FloatingActionButton(onPressed: (){},child: Icon(Icons.message),)
      :index==2?Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: FloatingActionButton(onPressed: (){},child: Icon(Icons.edit,),mini:true,backgroundColor: buttonTheme.backgroundColor,),
      ),
    FloatingActionButton(onPressed: (){},child: Icon(Icons.camera_alt),),
  ],):FloatingActionButton(onPressed: (){},child: Icon(Icons.add_ic_call_sharp),);
}

Widget DivisionText(String text){
  return Padding(
    padding: EdgeInsets.only(left: 10.0,top: 20.0,bottom: 10.0),
    child: Text(text),
  );
}

Widget buildStatusList(List statusList){
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: statusList.length,
      itemBuilder: (context,index){
        return ListTile(
          leading: Container(
            child: Container(
              child: ClipOval(child:CachedNetworkImage(imageUrl:statusList[index].status,height: 50.0,width: 50.0,),),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0,color: Colors.white),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 2.0,color: statusList[index].isSeen=='seen'?Colors.grey:Colors.green),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          title: Text(statusList[index].name),
          subtitle: Text(statusList[index].time),
        );
      });
}

Widget statusListHeader(String url){
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: ListTile(
      leading: Container(height: 55,width: 55,
      child: Stack(
        alignment: Alignment.bottomRight,
        children:[
          ClipOval(
          child: CachedNetworkImage(imageUrl: url),
        ),
          Container(
            decoration: BoxDecoration(border: Border.all(
                width: 2.0,
                color: Colors.white,),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child:  CircleAvatar(
              child: Icon(Icons.add,size: 20.0,),
              radius: 10.0,),
          ),
        ],
      ),
      ),
      title: Text('My Status'),
      subtitle: Text('Tap to add status update'),
    ),
  );
}

Widget buildCallsList(List callsList){
  return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: callsList.length,
      itemBuilder: (context,index){
        return ListTile(
          leading: ClipOval(child: CachedNetworkImage(imageUrl: callsList[index].profile,placeholder: (context,_){
            return  const CircularProgressIndicator();
          }),
          ),
          title: Text(callsList[index].name),
          subtitle: Row(
            children: [
              Icon(callsList[index].status=="dialed"?Icons.arrow_upward:Icons.arrow_downward,color: callsList[index].status=='missed'?Colors.red:Colors.green,),
              Text(callsList[index].dateTime),
            ],
          ),
          trailing: Icon(callsList[index].type=='voice'?Icons.call:Icons.video_camera_back),
        );
      });
}

PreferredSizeWidget? appbar1(BuildContext context,String imageUrl,String name){
  print(imageUrl);
  return AppBar(
    leadingWidth: 80,
    leading: Row(
      children: [
        Container(
            height: 40,
            width: 40,
            child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back))),
        Container(height: 40,width: 40,
        child: ClipOval(
          child: CachedNetworkImage(imageUrl: imageUrl),
        ),
        ),
      ],
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(name,style: TextStyle(fontSize: 15.0),overflow: TextOverflow.ellipsis,),
      Text('last seen today at 12:49 pm',style: TextStyle(fontSize: 10.0),),
    ],),
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.video_camera_back)),
      IconButton(onPressed: (){}, icon: Icon(Icons.call)),
      IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded)),

    ],
  );
}

PreferredSizeWidget? appbar2(){
  return AppBar(

  );
}