import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeaveRecord extends FirestoreRecord {
  LeaveRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "totalDays" field.
  int? _totalDays;
  int get totalDays => _totalDays ?? 0;
  bool hasTotalDays() => _totalDays != null;

  // "approverUid" field.
  String? _approverUid;
  String get approverUid => _approverUid ?? '';
  bool hasApproverUid() => _approverUid != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _reason = snapshotData['reason'] as String?;
    _status = snapshotData['status'] as String?;
    _totalDays = castToType<int>(snapshotData['totalDays']);
    _approverUid = snapshotData['approverUid'] as String?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('leave');

  static Stream<LeaveRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeaveRecord.fromSnapshot(s));

  static Future<LeaveRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeaveRecord.fromSnapshot(s));

  static LeaveRecord fromSnapshot(DocumentSnapshot snapshot) => LeaveRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeaveRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeaveRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeaveRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeaveRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeaveRecordData({
  DocumentReference? userRef,
  DateTime? startDate,
  DateTime? endDate,
  String? reason,
  String? status,
  int? totalDays,
  String? approverUid,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'startDate': startDate,
      'endDate': endDate,
      'reason': reason,
      'status': status,
      'totalDays': totalDays,
      'approverUid': approverUid,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeaveRecordDocumentEquality implements Equality<LeaveRecord> {
  const LeaveRecordDocumentEquality();

  @override
  bool equals(LeaveRecord? e1, LeaveRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.reason == e2?.reason &&
        e1?.status == e2?.status &&
        e1?.totalDays == e2?.totalDays &&
        e1?.approverUid == e2?.approverUid &&
        e1?.category == e2?.category;
  }

  @override
  int hash(LeaveRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.startDate,
        e?.endDate,
        e?.reason,
        e?.status,
        e?.totalDays,
        e?.approverUid,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is LeaveRecord;
}
