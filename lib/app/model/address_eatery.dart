import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_shopping_app/core/values/consts.dart';

class AddressEatery {
  final String address;
  final GeoPoint geoPointLocation;
  const AddressEatery({required this.address, required this.geoPointLocation});

  Map<String, dynamic> toFirestore() {
    return {
      EateryCollectionConsts.ADDRESS: address,
      EateryCollectionConsts.GEOPOINT_LOCATION: geoPointLocation
    };
  }
}
