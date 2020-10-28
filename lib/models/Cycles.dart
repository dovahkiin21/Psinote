import 'package:cloud_firestore/cloud_firestore.dart';

class Cycles {
  String name;
  String location;
  String pricePerHr;
  GeoPoint coordinates;

  Cycles(this.name, this.location, this.coordinates, this.pricePerHr);
}
