import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Collection to manage all users, both homeowner/business and contractor.
class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "is_homeowner" field.
  bool? _isHomeowner;
  bool get isHomeowner => _isHomeowner ?? false;
  bool hasIsHomeowner() => _isHomeowner != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "name_first" field.
  String? _nameFirst;
  String get nameFirst => _nameFirst ?? '';
  bool hasNameFirst() => _nameFirst != null;

  // "name_last" field.
  String? _nameLast;
  String get nameLast => _nameLast ?? '';
  bool hasNameLast() => _nameLast != null;

  // "times_logged_in" field.
  int? _timesLoggedIn;
  int get timesLoggedIn => _timesLoggedIn ?? 0;
  bool hasTimesLoggedIn() => _timesLoggedIn != null;

  // "type_of_work" field.
  String? _typeOfWork;
  String get typeOfWork => _typeOfWork ?? '';
  bool hasTypeOfWork() => _typeOfWork != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "num_messages_posted" field.
  int? _numMessagesPosted;
  int get numMessagesPosted => _numMessagesPosted ?? 0;
  bool hasNumMessagesPosted() => _numMessagesPosted != null;

  // "contractor_birthday" field.
  DateTime? _contractorBirthday;
  DateTime? get contractorBirthday => _contractorBirthday;
  bool hasContractorBirthday() => _contractorBirthday != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _isHomeowner = snapshotData['is_homeowner'] as bool?;
    _isVerified = snapshotData['is_verified'] as bool?;
    _nameFirst = snapshotData['name_first'] as String?;
    _nameLast = snapshotData['name_last'] as String?;
    _timesLoggedIn = castToType<int>(snapshotData['times_logged_in']);
    _typeOfWork = snapshotData['type_of_work'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _numMessagesPosted = castToType<int>(snapshotData['num_messages_posted']);
    _contractorBirthday = snapshotData['contractor_birthday'] as DateTime?;
    _businessName = snapshotData['business_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  bool? isHomeowner,
  bool? isVerified,
  String? nameFirst,
  String? nameLast,
  int? timesLoggedIn,
  String? typeOfWork,
  String? phoneNumber,
  String? displayName,
  int? numMessagesPosted,
  DateTime? contractorBirthday,
  String? businessName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'is_homeowner': isHomeowner,
      'is_verified': isVerified,
      'name_first': nameFirst,
      'name_last': nameLast,
      'times_logged_in': timesLoggedIn,
      'type_of_work': typeOfWork,
      'phone_number': phoneNumber,
      'display_name': displayName,
      'num_messages_posted': numMessagesPosted,
      'contractor_birthday': contractorBirthday,
      'business_name': businessName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isHomeowner == e2?.isHomeowner &&
        e1?.isVerified == e2?.isVerified &&
        e1?.nameFirst == e2?.nameFirst &&
        e1?.nameLast == e2?.nameLast &&
        e1?.timesLoggedIn == e2?.timesLoggedIn &&
        e1?.typeOfWork == e2?.typeOfWork &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.displayName == e2?.displayName &&
        e1?.numMessagesPosted == e2?.numMessagesPosted &&
        e1?.contractorBirthday == e2?.contractorBirthday &&
        e1?.businessName == e2?.businessName;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.isHomeowner,
        e?.isVerified,
        e?.nameFirst,
        e?.nameLast,
        e?.timesLoggedIn,
        e?.typeOfWork,
        e?.phoneNumber,
        e?.displayName,
        e?.numMessagesPosted,
        e?.contractorBirthday,
        e?.businessName
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
