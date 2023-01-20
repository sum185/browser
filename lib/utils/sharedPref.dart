import 'package:shared_preferences/shared_preferences.dart';

void addBookMark(List<String> urls)async{
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setStringList('bookmark', urls);
}

Future<List<String>?> readBookMarkUrls()async{
  SharedPreferences shr = await  SharedPreferences.getInstance();
  List<String>? urls= shr.getStringList('bookmark');
  return urls;
}