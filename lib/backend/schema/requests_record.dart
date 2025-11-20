import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestsRecord extends FirestoreRecord {
  RequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "homeowner_ref" field.
  String? _homeownerRef;
  String get homeownerRef => _homeownerRef ?? '';
  bool hasHomeownerRef() => _homeownerRef != null;

  // "job_ref" field.
  DocumentReference? _jobRef;
  DocumentReference? get jobRef => _jobRef;
  bool hasJobRef() => _jobRef != null;

  // "homeowner_email" field.
  String? _homeownerEmail;
  String get homeownerEmail => _homeownerEmail ?? '';
  bool hasHomeownerEmail() => _homeownerEmail != null;

  // "contractor_ref" field.
  DocumentReference? _contractorRef;
  DocumentReference? get contractorRef => _contractorRef;
  bool hasContractorRef() => _contractorRef != null;

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  // "req_title" field.
  String? _reqTitle;
  String get reqTitle => _reqTitle ?? '';
  bool hasReqTitle() => _reqTitle != null;

  // "req_desc" field.
  String? _reqDesc;
  String get reqDesc => _reqDesc ?? '';
  bool hasReqDesc() => _reqDesc != null;

  // "declined" field.
  bool? _declined;
  bool get declined => _declined ?? false;
  bool hasDeclined() => _declined != null;

  void _initializeFields() {
    _homeownerRef = snapshotData['homeowner_ref'] as String?;
    _jobRef = snapshotData['job_ref'] as DocumentReference?;
    _homeownerEmail = snapshotData['homeowner_email'] as String?;
    _contractorRef = snapshotData['contractor_ref'] as DocumentReference?;
    _accepted = snapshotData['accepted'] as bool?;
    _reqTitle = snapshotData['req_title'] as String?;
    _reqDesc = snapshotData['req_desc'] as String?;
    _declined = snapshotData['declined'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requests');

  static Stream<RequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsRecord.fromSnapshot(s));

  static Future<RequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsRecord.fromSnapshot(s));

  static RequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsRecordData({
  String? homeownerRef,
  DocumentReference? jobRef,
  String? homeownerEmail,
  DocumentReference? contractorRef,
  bool? accepted,
  String? reqTitle,
  String? reqDesc,
  bool? declined,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'homeowner_ref': homeownerRef,
      'job_ref': jobRef,
      'homeowner_email': homeownerEmail,
      'contractor_ref': contractorRef,
      'accepted': accepted,
      'req_title': reqTitle,
      'req_desc': reqDesc,
      'declined': declined,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsRecordDocumentEquality implements Equality<RequestsRecord> {
  const RequestsRecordDocumentEquality();

  @override
  bool equals(RequestsRecord? e1, RequestsRecord? e2) {
    return e1?.homeownerRef == e2?.homeownerRef &&
        e1?.jobRef == e2?.jobRef &&
        e1?.homeownerEmail == e2?.homeownerEmail &&
        e1?.contractorRef == e2?.contractorRef &&
        e1?.accepted == e2?.accepted &&
        e1?.reqTitle == e2?.reqTitle &&
        e1?.reqDesc == e2?.reqDesc &&
        e1?.declined == e2?.declined;
  }

  @override
  int hash(RequestsRecord? e) => const ListEquality().hash([
        e?.homeownerRef,
        e?.jobRef,
        e?.homeownerEmail,
        e?.contractorRef,
        e?.accepted,
        e?.reqTitle,
        e?.reqDesc,
        e?.declined
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestsRecord;
}
