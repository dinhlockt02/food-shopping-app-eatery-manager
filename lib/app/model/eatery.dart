import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_shopping_app/app/model/address_eatery.dart';
import 'package:food_shopping_app/core/values/consts.dart';

class EateryType {
  static const TYPE_MEAL = EateryCollectionConsts.TYPE_MEAL;
  static const TYPE_DRINK = EateryCollectionConsts.TYPE_DRINK;
  static const TYPE_COFFEE = EateryCollectionConsts.TYPE_COFFEE;
  static const TYPE_OTHER = EateryCollectionConsts.TYPE_OTHER;
  static const TYPE_FAST_FOOD = EateryCollectionConsts.TYPE_FAST_FOOD;

  static const TYPE_VALUES = [
    TYPE_MEAL,
    TYPE_DRINK,
    TYPE_COFFEE,
    TYPE_OTHER,
    TYPE_FAST_FOOD
  ];

  String _value = TYPE_OTHER;
  String get value {
    return _value;
  }

  EateryType({String? value}) {
    if (TYPE_VALUES.contains(value) || value != null) {
      _value = value!;
    }
  }
}

class Eatery {
  final String id;
  final AddressEatery addressEatery;
  final double averageRatingCount;
  final String description;
  final String email;
  final String name;
  final String password;
  final String photoUrl;
  final String username;
  final String workTime;
  final EateryType type;
  const Eatery({
    required this.id,
    required this.addressEatery,
    required this.averageRatingCount,
    required this.description,
    required this.email,
    required this.name,
    required this.password,
    required this.photoUrl,
    required this.username,
    required this.workTime,
    required this.type,
  });

  Eatery copyWith({
    String? id,
    AddressEatery? addressEatery,
    double? averageRatingCount,
    String? description,
    String? email,
    String? name,
    String? password,
    String? photoUrl,
    String? username,
    String? workTime,
    EateryType? type,
  }) {
    return Eatery(
      id: id ?? this.id,
      addressEatery: addressEatery ?? this.addressEatery,
      averageRatingCount: averageRatingCount ?? this.averageRatingCount,
      description: description ?? this.description,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      photoUrl: photoUrl ?? this.photoUrl,
      username: username ?? this.username,
      workTime: workTime ?? this.workTime,
      type: type ?? this.type,
    );
  }

  factory Eatery.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Eatery(
      id: snapshot.id,
      addressEatery: AddressEatery(
          address: data?[EateryCollectionConsts.ADDRESS_EATERY]
                  [EateryCollectionConsts.ADDRESS] ??
              "",
          geoPointLocation: data?[EateryCollectionConsts.ADDRESS_EATERY]
                  [EateryCollectionConsts.GEOPOINT_LOCATION] ??
              const GeoPoint(0, 0)),
      averageRatingCount:
          data?[EateryCollectionConsts.AVERAGE_RATING_COUNT] ?? 0,
      description: data?[EateryCollectionConsts.DESCRIPTION] ?? "",
      email: data?[EateryCollectionConsts.EMAIL] ?? "",
      name: data?[EateryCollectionConsts.NAME] ?? "",
      password: data?[EateryCollectionConsts.PASSWORD] ?? "",
      photoUrl: data?[EateryCollectionConsts.PHOTO_URL] ?? "",
      username: data?[EateryCollectionConsts.USERNAME] ?? "",
      workTime: data?[EateryCollectionConsts.WORKTIME] ?? "",
      type: EateryType(
          value: (data?[EateryCollectionConsts.TYPE] as String?) ?? ""),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      EateryCollectionConsts.ADDRESS_EATERY: (addressEatery).toFirestore(),
      EateryCollectionConsts.AVERAGE_RATING_COUNT: averageRatingCount,
      EateryCollectionConsts.DESCRIPTION: description,
      EateryCollectionConsts.EMAIL: email,
      EateryCollectionConsts.NAME: name,
      EateryCollectionConsts.PASSWORD: password,
      EateryCollectionConsts.PHOTO_URL: photoUrl,
      EateryCollectionConsts.USERNAME: username,
      EateryCollectionConsts.WORKTIME: workTime,
      EateryCollectionConsts.TYPE: type.value,
    };
  }
}
