import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_script_admin/models/location.dart';

Future<void> addNewLocation(Location newLocation) async {
  try {
    await FirebaseFirestore.instance
        .collection('locations')
        .doc(newLocation.id)
        .set({
      'id': newLocation.id,
      'name': newLocation.name,
      'city': newLocation.city,
      'region': newLocation.region,
      'images': newLocation.images,
      'rating': newLocation.rating,
      'category': newLocation.category,
      'operatingDays': newLocation.operatingDays,
      'openingTime': newLocation.openingTime,
      'closingTime': Timestamp.fromDate(newLocation.closingTime),
      'description': newLocation.description,
      'websiteLink': newLocation.websiteLink,
    });
  } catch (error) {
    rethrow;
  }
}
