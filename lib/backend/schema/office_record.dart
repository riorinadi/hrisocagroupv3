import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OfficeRecord extends FirestoreRecord {
  OfficeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "latlong" field.
  LatLng? _latlong;
  LatLng? get latlong => _latlong;
  bool hasLatlong() => _latlong != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _latlong = snapshotData['latlong'] as LatLng?;
    _location = snapshotData['location'] as String?;
    _logo = snapshotData['logo'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('office');

  static Stream<OfficeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OfficeRecord.fromSnapshot(s));

  static Future<OfficeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OfficeRecord.fromSnapshot(s));

  static OfficeRecord fromSnapshot(DocumentSnapshot snapshot) => OfficeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OfficeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OfficeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OfficeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OfficeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOfficeRecordData({
  String? name,
  LatLng? latlong,
  String? location,
  String? logo,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'latlong': latlong,
      'location': location,
      'logo': logo,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class OfficeRecordDocumentEquality implements Equality<OfficeRecord> {
  const OfficeRecordDocumentEquality();

  @override
  bool equals(OfficeRecord? e1, OfficeRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.latlong == e2?.latlong &&
        e1?.location == e2?.location &&
        e1?.logo == e2?.logo &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(OfficeRecord? e) => const ListEquality()
      .hash([e?.name, e?.latlong, e?.location, e?.logo, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is OfficeRecord;
}
