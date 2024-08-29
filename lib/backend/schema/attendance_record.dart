import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceRecord extends FirestoreRecord {
  AttendanceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "checkinTime" field.
  DateTime? _checkinTime;
  DateTime? get checkinTime => _checkinTime;
  bool hasCheckinTime() => _checkinTime != null;

  // "checkoutTime" field.
  DateTime? _checkoutTime;
  DateTime? get checkoutTime => _checkoutTime;
  bool hasCheckoutTime() => _checkoutTime != null;

  // "isCheckout" field.
  bool? _isCheckout;
  bool get isCheckout => _isCheckout ?? false;
  bool hasIsCheckout() => _isCheckout != null;

  // "officeRef" field.
  DocumentReference? _officeRef;
  DocumentReference? get officeRef => _officeRef;
  bool hasOfficeRef() => _officeRef != null;

  // "selfie" field.
  String? _selfie;
  String get selfie => _selfie ?? '';
  bool hasSelfie() => _selfie != null;

  // "selfieOut" field.
  String? _selfieOut;
  String get selfieOut => _selfieOut ?? '';
  bool hasSelfieOut() => _selfieOut != null;

  // "userRefs" field.
  List<DocumentReference>? _userRefs;
  List<DocumentReference> get userRefs => _userRefs ?? const [];
  bool hasUserRefs() => _userRefs != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _checkinTime = snapshotData['checkinTime'] as DateTime?;
    _checkoutTime = snapshotData['checkoutTime'] as DateTime?;
    _isCheckout = snapshotData['isCheckout'] as bool?;
    _officeRef = snapshotData['officeRef'] as DocumentReference?;
    _selfie = snapshotData['selfie'] as String?;
    _selfieOut = snapshotData['selfieOut'] as String?;
    _userRefs = getDataList(snapshotData['userRefs']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendance');

  static Stream<AttendanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceRecord.fromSnapshot(s));

  static Future<AttendanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceRecord.fromSnapshot(s));

  static AttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceRecordData({
  DocumentReference? userRef,
  DateTime? checkinTime,
  DateTime? checkoutTime,
  bool? isCheckout,
  DocumentReference? officeRef,
  String? selfie,
  String? selfieOut,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'checkinTime': checkinTime,
      'checkoutTime': checkoutTime,
      'isCheckout': isCheckout,
      'officeRef': officeRef,
      'selfie': selfie,
      'selfieOut': selfieOut,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendanceRecordDocumentEquality implements Equality<AttendanceRecord> {
  const AttendanceRecordDocumentEquality();

  @override
  bool equals(AttendanceRecord? e1, AttendanceRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.checkinTime == e2?.checkinTime &&
        e1?.checkoutTime == e2?.checkoutTime &&
        e1?.isCheckout == e2?.isCheckout &&
        e1?.officeRef == e2?.officeRef &&
        e1?.selfie == e2?.selfie &&
        e1?.selfieOut == e2?.selfieOut &&
        listEquality.equals(e1?.userRefs, e2?.userRefs);
  }

  @override
  int hash(AttendanceRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.checkinTime,
        e?.checkoutTime,
        e?.isCheckout,
        e?.officeRef,
        e?.selfie,
        e?.selfieOut,
        e?.userRefs
      ]);

  @override
  bool isValidKey(Object? o) => o is AttendanceRecord;
}
