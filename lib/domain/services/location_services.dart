// import 'dart:async';
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';
// import 'package:packerin/data/model/location_model.dart';

// class PackerinLocationService {
//   Location location = Location();
//   PackerinLocationModel currentLocation;

//   StreamController<PackerinLocationModel> locationController =
//       StreamController<PackerinLocationModel>.broadcast();

//   Stream<PackerinLocationModel> get getStreamData => locationController.stream;

//   PackerinLocationService() {
//     location.requestPermission().then((LocationPermission) {
//       if (LocationPermission == PermissionStatus.granted) {
//         location.onLocationChanged.listen((locationValue) {
//           locationController.add(PackerinLocationModel(
//               latitude: locationValue.latitude,
//               longitude: locationValue.longitude));
//         });
//       }
//     });
//   }
// }
