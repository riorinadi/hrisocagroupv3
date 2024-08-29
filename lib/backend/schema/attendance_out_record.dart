import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceOutRecord extends FirestoreRecord {
  AttendanceOutRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "checkOutTime" field.
  DateTime? _checkOutTime;
  DateTime? get checkOutTime => _checkOutTime;
  bool hasCheckOutTime() => _checkOutTime != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _checkOutTime = snapshotData['checkOutTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendanceOut');

  static Stream<AttendanceOutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceOutRecord.fromSnapshot(s));

  static Future<AttendanceOutRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceOutRecord.fromSnapshot(s));

  static AttendanceOutRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceOutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceOutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceOutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendanceOutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceOutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceOutRecordData({
  DocumentReference? userRef,
  DateTime? checkOutTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'checkOutTime': checkOutTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendanceOutRecordDocumentEquality
    implements Equality<AttendanceOutRecord> {
  const AttendanceOutRecordDocumentEquality();

  @override
  bool equals(AttendanceOutRecord? e1, AttendanceOutRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.checkOutTime == e2?.checkOutTime;
  }

  @override
  int hash(AttendanceOutRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.checkOutTime]);

  @override
  bool isValidKey(Object? o) => o is AttendanceOutRecord;
}
