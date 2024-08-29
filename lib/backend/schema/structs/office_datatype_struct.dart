// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class OfficeDatatypeStruct extends FFFirebaseStruct {
  OfficeDatatypeStruct({
    String? name,
    double? distance,
    DocumentReference? officeRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _distance = distance,
        _officeRef = officeRef,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  set distance(double? val) => _distance = val;

  void incrementDistance(double amount) => distance = distance + amount;

  bool hasDistance() => _distance != null;

  // "officeRef" field.
  DocumentReference? _officeRef;
  DocumentReference? get officeRef => _officeRef;
  set officeRef(DocumentReference? val) => _officeRef = val;

  bool hasOfficeRef() => _officeRef != null;

  static OfficeDatatypeStruct fromMap(Map<String, dynamic> data) =>
      OfficeDatatypeStruct(
        name: data['name'] as String?,
        distance: castToType<double>(data['distance']),
        officeRef: data['officeRef'] as DocumentReference?,
      );

  static OfficeDatatypeStruct? maybeFromMap(dynamic data) => data is Map
      ? OfficeDatatypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'distance': _distance,
        'officeRef': _officeRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'distance': serializeParam(
          _distance,
          ParamType.double,
        ),
        'officeRef': serializeParam(
          _officeRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static OfficeDatatypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      OfficeDatatypeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        distance: deserializeParam(
          data['distance'],
          ParamType.double,
          false,
        ),
        officeRef: deserializeParam(
          data['officeRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['office'],
        ),
      );

  @override
  String toString() => 'OfficeDatatypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OfficeDatatypeStruct &&
        name == other.name &&
        distance == other.distance &&
        officeRef == other.officeRef;
  }

  @override
  int get hashCode => const ListEquality().hash([name, distance, officeRef]);
}

OfficeDatatypeStruct createOfficeDatatypeStruct({
  String? name,
  double? distance,
  DocumentReference? officeRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OfficeDatatypeStruct(
      name: name,
      distance: distance,
      officeRef: officeRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OfficeDatatypeStruct? updateOfficeDatatypeStruct(
  OfficeDatatypeStruct? officeDatatype, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    officeDatatype
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOfficeDatatypeStructData(
  Map<String, dynamic> firestoreData,
  OfficeDatatypeStruct? officeDatatype,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (officeDatatype == null) {
    return;
  }
  if (officeDatatype.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && officeDatatype.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final officeDatatypeData =
      getOfficeDatatypeFirestoreData(officeDatatype, forFieldValue);
  final nestedData =
      officeDatatypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = officeDatatype.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOfficeDatatypeFirestoreData(
  OfficeDatatypeStruct? officeDatatype, [
  bool forFieldValue = false,
]) {
  if (officeDatatype == null) {
    return {};
  }
  final firestoreData = mapToFirestore(officeDatatype.toMap());

  // Add any Firestore field values
  officeDatatype.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOfficeDatatypeListFirestoreData(
  List<OfficeDatatypeStruct>? officeDatatypes,
) =>
    officeDatatypes
        ?.map((e) => getOfficeDatatypeFirestoreData(e, true))
        .toList() ??
    [];
