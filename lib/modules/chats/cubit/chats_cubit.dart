import 'package:flutter/material.dart';
import 'package:signal_cone/model/model.dart';
import 'package:signal_cone/modules/chats/cubit/chats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signal_cone/modules/help/help_screen.dart';
import 'package:signal_cone/shared/components/components.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(InitialState());

  static ChatsCubit get(context) => BlocProvider.of(context);


  var clears;


  GlobalKey keyWidget = GlobalKey<ScaffoldState>();

  List<PopupMenu> menues = <PopupMenu>[PopupMenu(
    name: 'New group  ',
  ), PopupMenu(
    name: 'Mark all read ',
  ), PopupMenu(
    name: 'Invite friends ',
  ), PopupMenu(
    name: 'Settings ',
  ),
  ];
  var select;

  List<GetStarted> list2 = [
    GetStarted(
        name: "New group",
        url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKx9bIBgz2Weh6-bdGi_atqLi7P8UZA7r0YQ&usqp=CAU'),
    GetStarted(
        name: "Invite friends",
        url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQptU6AGl3gX1FhW4e0SfLFfspEwLGzTmEgQQ&usqp=CAU'),
    GetStarted(
        name: "Use SMS",
        url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn1xsPQYmHgcLP1UFUAOfrQPNbchx8ApXKfQ&usqp=CAU'),
  ];


  void selectItem(PopupMenu itm, context) {
    emit(InitialLoading());
    select = itm;
    emit(Check());
    if (select == menues[3]) {
      emit(InitialSuccess());
      navigateTo(context: context, widget: HelpScreen());
    }
    print(select.name);
  }

  void clear(int i) {
    emit(InitialRemove());
    list2.removeAt(i);
    if(list2.isEmpty){
    }
  }


}
