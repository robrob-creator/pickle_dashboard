import 'package:pickle/controllers/my_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPageController extends MyController {
  GoogleMapController? mapController;

  GoogleMapPageController();

  void onGoogleMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onSelect(int index) {}

  @override
  String getTag() {
    return "google_map_controller";
  }
}
