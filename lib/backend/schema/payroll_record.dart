import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PayrollRecord extends FirestoreRecord {
  PayrollRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "periode" field.
  DateTime? _periode;
  DateTime? get periode => _periode;
  bool hasPeriode() => _periode != null;

  // "attended" field.
  int? _attended;
  int get attended => _attended ?? 0;
  bool hasAttended() => _attended != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _periode = snapshotData['periode'] as DateTime?;
    _attended = castToType<int>(snapshotData['attended']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payroll');

  static Stream<PayrollRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PayrollRecord.fromSnapshot(s));

  static Future<PayrollRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PayrollRecord.fromSnapshot(s));

  static PayrollRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PayrollRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PayrollRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PayrollRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PayrollRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PayrollRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPayrollRecordData({
  DocumentReference? userRef,
  DateTime? periode,
  int? attended,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'periode': periode,
      'attended': attended,
    }.withoutNulls,
  );

  return firestoreData;
}

class PayrollRecordDocumentEquality implements Equality<PayrollRecord> {
  const PayrollRecordDocumentEquality();

  @override
  bool equals(PayrollRecord? e1, PayrollRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.periode == e2?.periode &&
        e1?.attended == e2?.attended;
  }

  @override
  int hash(PayrollRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.periode, e?.attended]);

  @override
  bool isValidKey(Object? o) => o is PayrollRecord;
}
