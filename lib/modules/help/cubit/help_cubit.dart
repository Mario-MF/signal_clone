import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:signal_cone/modules/help/cubit/help_state.dart';

class HelpCubit extends Cubit<HelpState>{
  HelpCubit() : super(InitialState());
  static HelpCubit get(context)=> BlocProvider.of(context);

  bool check = true;
  var parser = EmojiParser();

  changeCheckBox(bool val) {
    emit(InitialChangeVal());
      check = val;
  }





}