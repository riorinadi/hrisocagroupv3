import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "eventName" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "logoEvent" field.
  String? _logoEvent;
  String get logoEvent => _logoEvent ?? '';
  bool hasLogoEvent() => _logoEvent != null;

  // "eventDesc" field.
  String? _eventDesc;
  String get eventDesc => _eventDesc ?? '';
  bool hasEventDesc() => _eventDesc != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "totalDays" field.
  int? _totalDays;
  int get totalDays => _totalDays ?? 0;
  bool hasTotalDays() => _totalDays != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _eventName = snapshotData['eventName'] as String?;
    _logoEvent = snapshotData['logoEvent'] as String?;
    _eventDesc = snapshotData['eventDesc'] as String?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _totalDays = castToType<int>(snapshotData['totalDays']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  DateTime? createDate,
  String? eventName,
  String? logoEvent,
  String? eventDesc,
  DateTime? startDate,
  DateTime? endDate,
  int? totalDays,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'eventName': eventName,
      'logoEvent': logoEvent,
      'eventDesc': eventDesc,
      'startDate': startDate,
      'endDate': endDate,
      'totalDays': totalDays,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.eventName == e2?.eventName &&
        e1?.logoEvent == e2?.logoEvent &&
        e1?.eventDesc == e2?.eventDesc &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.totalDays == e2?.totalDays;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.eventName,
        e?.logoEvent,
        e?.eventDesc,
        e?.startDate,
        e?.endDate,
        e?.totalDays
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
