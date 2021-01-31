import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signal_cone/model/model.dart';
import 'package:signal_cone/modules/chats/cubit/chats_cubit.dart';
import 'package:signal_cone/modules/chats/cubit/chats_state.dart';
import 'package:signal_cone/shared/styles/styles.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsState>(
        builder: (context, state) {
          var cubitChats = ChatsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(''),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Signal', style: black20)
                    // Spacer(
                    //   flex: 1,
                    // )
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    splashRadius: 15,
                    icon: Icon(
                      Icons.search,
                      color: Colors.white70,
                      size: 27,
                    ),
                  ),
                  PopupMenuButton(

                      icon: Icon(
                        Icons.more_vert,
                        size: 25,
                        color: Colors.white70,
                      ),
                      color: Color(0xff363636),
                      itemBuilder: (context) {
                        return cubitChats.menues
                            .map((PopupMenu menu) => PopupMenuItem<PopupMenu>(
                                  value: menu,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      menu.name.toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ))
                            .toList();
                      },
                      onSelected: (PopupMenu e) =>
                          cubitChats.selectItem(e, context))
                ]),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: Text(
                            'No Chat yat. \n'
                            'Get started by messaging a \n friend.',
                            style: black500.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Stack(alignment: Alignment.bottomRight, children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('camera');
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[800],
                                  radius: 25,
                                  child: Icon(Icons.camera_alt,
                                      size: 20, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('edit');
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.blue,
                                  child: Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(key: cubitChats.keyWidget,
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get Started',
                        style: black20.copyWith(color: Colors.white),
                      ),
                      Container(
                        key: cubitChats.keyWidget,
                        // margin: EdgeInsets.symmetric(vertical: 10),
                        height: 200,
                        child: GridView.count(
                          scrollDirection: Axis.horizontal,
                          crossAxisCount: 1,
                          children:
                              List.generate(cubitChats.list2.length, (index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  right: 7, top: 15, bottom: 15),
                              // padding: EdgeInsets.only(right: 5,left: 5),

                              // symmetric(horizontal: 10, vertical: 30),

                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    // alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 113,
                                        decoration: BoxDecoration(
                                            color: Colors.white10,
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(15)),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  cubitChats.list2[index].url),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        child: CircleAvatar(
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.clear,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            alignment: Alignment.topLeft,
                                            onPressed: () =>
                                                ChatsCubit.get(context)
                                                    .clear(index),
                                          ),
                                          radius: 15,
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.7),
                                        ),
                                        alignment: Alignment.topRight,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )
                                    ],
                                  ),

                                  // defultButton(
                                  //   function: () {},
                                  //   text: cubitChats.list2[index].name,
                                  //   textColor: Colors.blueAccent,
                                  //   color: Colors.grey[900],
                                  //   r: 50,
                                  //   margin: EdgeInsets.symmetric(
                                  //       vertical: 5, horizontal: 10),
                                  //   borderColor:  Colors.grey,
                                  //   width: 0.0,
                                  //   toUpper: false ,
                                  //     fz: 20,fontWeight: FontWeight.normal,
                                  //   widthn: 1
                                  // ),

                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              21,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade500),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        cubitChats.list2[index].name,
                                        style: black600.copyWith(
                                            color: Color(0xff7D97EB)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
