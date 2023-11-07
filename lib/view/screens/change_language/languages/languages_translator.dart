import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:travel_journel/languages/english.dart';
import 'package:travel_journel/languages/japanese.dart';

class Languages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en_US" : english,
    "ja_JP" : japanese
  };
}