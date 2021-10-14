import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';
import '../helpers/db_helper.dart';


class GreatPlaces with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items{
    return[..._items];
  }

  void addPlace(String pickedTitle, File pickedImage){
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: null,
        image: pickedImage
    );
    _items.add(newPlace);
    notifyListeners();
    DBhelper.insert('user_places', {
      'id': newPlace.id!,
      'title': newPlace.title!,
      'image':newPlace.image!.path}
      );
  }
  Future<void> fetchAndSetplaces() async{
    final dataList = await DBhelper.getData("user_places");
    _items = dataList.map((item) => Place(
        id: item['id'],
        title: item['title'],
        image: File(item['image']),
    location: null
    )).toList();
    notifyListeners();
}
}