
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/utility/exception/custom_exception.dart';

abstract class IdModel {
  String? id;
}


abstract class BaseFirebaseModel<T extends IdModel> {

  T fromJson(Map<String, dynamic> json);

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value != null) {
      value.addEntries([MapEntry('id', snapshot.id)]);
      return fromJson(value);
    } else {
      throw FirebaseCustomException('$snapshot data is null');
    }
  }
}
