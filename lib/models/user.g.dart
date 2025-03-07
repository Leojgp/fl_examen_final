// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UserCollectionReference
    implements
        UserQuery,
        FirestoreCollectionReference<User, UserQuerySnapshot> {
  factory UserCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserCollectionReference;

  static User fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserFromJson({'uid': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    User value,
    SetOptions? options,
  ) {
    return {..._$UserToJson(value)}..remove('uid');
  }

  @override
  CollectionReference<User> get reference;

  @override
  UserDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserDocumentReference> add(User value);
}

class _$UserCollectionReference extends _$UserQuery
    implements UserCollectionReference {
  factory _$UserCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserCollectionReference.fromFirestore,
            toFirestore: UserCollectionReference.toFirestore,
          ),
    );
  }

  _$UserCollectionReference._(
    CollectionReference<User> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<User> get reference =>
      super.reference as CollectionReference<User>;

  @override
  UserDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserDocumentReference> add(User value) {
    return reference.add(value).then((ref) => UserDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserDocumentReference
    extends FirestoreDocumentReference<User, UserDocumentSnapshot> {
  factory UserDocumentReference(DocumentReference<User> reference) =
      _$UserDocumentReference;

  DocumentReference<User> get reference;

  /// A reference to the [UserCollectionReference] containing this document.
  UserCollectionReference get parent {
    return _$UserCollectionReference(reference.firestore);
  }

  @override
  Stream<UserDocumentSnapshot> snapshots();

  @override
  Future<UserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    User model, {
    SetOptions? options,
    FieldValue nameFieldValue,
    FieldValue adminFieldValue,
    FieldValue createdDietsFieldValue,
    FieldValue ageFieldValue,
    FieldValue heightFieldValue,
    FieldValue weightFieldValue,
    FieldValue dietFocusFieldValue,
    FieldValue allergiesFieldValue,
    FieldValue assignedDietsMapFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    User model, {
    SetOptions? options,
    FieldValue nameFieldValue,
    FieldValue adminFieldValue,
    FieldValue createdDietsFieldValue,
    FieldValue ageFieldValue,
    FieldValue heightFieldValue,
    FieldValue weightFieldValue,
    FieldValue dietFocusFieldValue,
    FieldValue allergiesFieldValue,
    FieldValue assignedDietsMapFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    User model, {
    SetOptions? options,
    FieldValue nameFieldValue,
    FieldValue adminFieldValue,
    FieldValue createdDietsFieldValue,
    FieldValue ageFieldValue,
    FieldValue heightFieldValue,
    FieldValue weightFieldValue,
    FieldValue dietFocusFieldValue,
    FieldValue allergiesFieldValue,
    FieldValue assignedDietsMapFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    bool admin,
    FieldValue adminFieldValue,
    List<String>? createdDiets,
    FieldValue createdDietsFieldValue,
    int? age,
    FieldValue ageFieldValue,
    int? height,
    FieldValue heightFieldValue,
    int? weight,
    FieldValue weightFieldValue,
    String? dietFocus,
    FieldValue dietFocusFieldValue,
    List<String>? allergies,
    FieldValue allergiesFieldValue,
    Map<String, String> assignedDietsMap,
    FieldValue assignedDietsMapFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    bool admin,
    FieldValue adminFieldValue,
    List<String>? createdDiets,
    FieldValue createdDietsFieldValue,
    int? age,
    FieldValue ageFieldValue,
    int? height,
    FieldValue heightFieldValue,
    int? weight,
    FieldValue weightFieldValue,
    String? dietFocus,
    FieldValue dietFocusFieldValue,
    List<String>? allergies,
    FieldValue allergiesFieldValue,
    Map<String, String> assignedDietsMap,
    FieldValue assignedDietsMapFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String name,
    FieldValue nameFieldValue,
    bool admin,
    FieldValue adminFieldValue,
    List<String>? createdDiets,
    FieldValue createdDietsFieldValue,
    int? age,
    FieldValue ageFieldValue,
    int? height,
    FieldValue heightFieldValue,
    int? weight,
    FieldValue weightFieldValue,
    String? dietFocus,
    FieldValue dietFocusFieldValue,
    List<String>? allergies,
    FieldValue allergiesFieldValue,
    Map<String, String> assignedDietsMap,
    FieldValue assignedDietsMapFieldValue,
  });
}

class _$UserDocumentReference
    extends FirestoreDocumentReference<User, UserDocumentSnapshot>
    implements UserDocumentReference {
  _$UserDocumentReference(this.reference);

  @override
  final DocumentReference<User> reference;

  /// A reference to the [UserCollectionReference] containing this document.
  UserCollectionReference get parent {
    return _$UserCollectionReference(reference.firestore);
  }

  @override
  Stream<UserDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserDocumentSnapshot._);
  }

  @override
  Future<UserDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserDocumentSnapshot._);
  }

  @override
  Future<UserDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserDocumentSnapshot._);
  }

  Future<void> set(
    User model, {
    SetOptions? options,
    FieldValue? nameFieldValue,
    FieldValue? adminFieldValue,
    FieldValue? createdDietsFieldValue,
    FieldValue? ageFieldValue,
    FieldValue? heightFieldValue,
    FieldValue? weightFieldValue,
    FieldValue? dietFocusFieldValue,
    FieldValue? allergiesFieldValue,
    FieldValue? assignedDietsMapFieldValue,
  }) async {
    final json = {
      ..._$UserToJson(model),
      if (nameFieldValue != null) _$UserFieldMap['name']!: nameFieldValue,
      if (adminFieldValue != null) _$UserFieldMap['admin']!: adminFieldValue,
      if (createdDietsFieldValue != null)
        _$UserFieldMap['createdDiets']!: createdDietsFieldValue,
      if (ageFieldValue != null) _$UserFieldMap['age']!: ageFieldValue,
      if (heightFieldValue != null) _$UserFieldMap['height']!: heightFieldValue,
      if (weightFieldValue != null) _$UserFieldMap['weight']!: weightFieldValue,
      if (dietFocusFieldValue != null)
        _$UserFieldMap['dietFocus']!: dietFocusFieldValue,
      if (allergiesFieldValue != null)
        _$UserFieldMap['allergies']!: allergiesFieldValue,
      if (assignedDietsMapFieldValue != null)
        _$UserFieldMap['assignedDietsMap']!: assignedDietsMapFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    User model, {
    SetOptions? options,
    FieldValue? nameFieldValue,
    FieldValue? adminFieldValue,
    FieldValue? createdDietsFieldValue,
    FieldValue? ageFieldValue,
    FieldValue? heightFieldValue,
    FieldValue? weightFieldValue,
    FieldValue? dietFocusFieldValue,
    FieldValue? allergiesFieldValue,
    FieldValue? assignedDietsMapFieldValue,
  }) {
    final json = {
      ..._$UserToJson(model),
      if (nameFieldValue != null) _$UserFieldMap['name']!: nameFieldValue,
      if (adminFieldValue != null) _$UserFieldMap['admin']!: adminFieldValue,
      if (createdDietsFieldValue != null)
        _$UserFieldMap['createdDiets']!: createdDietsFieldValue,
      if (ageFieldValue != null) _$UserFieldMap['age']!: ageFieldValue,
      if (heightFieldValue != null) _$UserFieldMap['height']!: heightFieldValue,
      if (weightFieldValue != null) _$UserFieldMap['weight']!: weightFieldValue,
      if (dietFocusFieldValue != null)
        _$UserFieldMap['dietFocus']!: dietFocusFieldValue,
      if (allergiesFieldValue != null)
        _$UserFieldMap['allergies']!: allergiesFieldValue,
      if (assignedDietsMapFieldValue != null)
        _$UserFieldMap['assignedDietsMap']!: assignedDietsMapFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    User model, {
    SetOptions? options,
    FieldValue? nameFieldValue,
    FieldValue? adminFieldValue,
    FieldValue? createdDietsFieldValue,
    FieldValue? ageFieldValue,
    FieldValue? heightFieldValue,
    FieldValue? weightFieldValue,
    FieldValue? dietFocusFieldValue,
    FieldValue? allergiesFieldValue,
    FieldValue? assignedDietsMapFieldValue,
  }) {
    final json = {
      ..._$UserToJson(model),
      if (nameFieldValue != null) _$UserFieldMap['name']!: nameFieldValue,
      if (adminFieldValue != null) _$UserFieldMap['admin']!: adminFieldValue,
      if (createdDietsFieldValue != null)
        _$UserFieldMap['createdDiets']!: createdDietsFieldValue,
      if (ageFieldValue != null) _$UserFieldMap['age']!: ageFieldValue,
      if (heightFieldValue != null) _$UserFieldMap['height']!: heightFieldValue,
      if (weightFieldValue != null) _$UserFieldMap['weight']!: weightFieldValue,
      if (dietFocusFieldValue != null)
        _$UserFieldMap['dietFocus']!: dietFocusFieldValue,
      if (allergiesFieldValue != null)
        _$UserFieldMap['allergies']!: allergiesFieldValue,
      if (assignedDietsMapFieldValue != null)
        _$UserFieldMap['assignedDietsMap']!: assignedDietsMapFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? admin = _sentinel,
    FieldValue? adminFieldValue,
    Object? createdDiets = _sentinel,
    FieldValue? createdDietsFieldValue,
    Object? age = _sentinel,
    FieldValue? ageFieldValue,
    Object? height = _sentinel,
    FieldValue? heightFieldValue,
    Object? weight = _sentinel,
    FieldValue? weightFieldValue,
    Object? dietFocus = _sentinel,
    FieldValue? dietFocusFieldValue,
    Object? allergies = _sentinel,
    FieldValue? allergiesFieldValue,
    Object? assignedDietsMap = _sentinel,
    FieldValue? assignedDietsMapFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      admin == _sentinel || adminFieldValue == null,
      "Cannot specify both admin and adminFieldValue",
    );
    assert(
      createdDiets == _sentinel || createdDietsFieldValue == null,
      "Cannot specify both createdDiets and createdDietsFieldValue",
    );
    assert(
      age == _sentinel || ageFieldValue == null,
      "Cannot specify both age and ageFieldValue",
    );
    assert(
      height == _sentinel || heightFieldValue == null,
      "Cannot specify both height and heightFieldValue",
    );
    assert(
      weight == _sentinel || weightFieldValue == null,
      "Cannot specify both weight and weightFieldValue",
    );
    assert(
      dietFocus == _sentinel || dietFocusFieldValue == null,
      "Cannot specify both dietFocus and dietFocusFieldValue",
    );
    assert(
      allergies == _sentinel || allergiesFieldValue == null,
      "Cannot specify both allergies and allergiesFieldValue",
    );
    assert(
      assignedDietsMap == _sentinel || assignedDietsMapFieldValue == null,
      "Cannot specify both assignedDietsMap and assignedDietsMapFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$UserFieldMap['name']!: _$UserPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$UserFieldMap['name']!: nameFieldValue,
      if (admin != _sentinel)
        _$UserFieldMap['admin']!: _$UserPerFieldToJson.admin(admin as bool),
      if (adminFieldValue != null) _$UserFieldMap['admin']!: adminFieldValue,
      if (createdDiets != _sentinel)
        _$UserFieldMap['createdDiets']!:
            _$UserPerFieldToJson.createdDiets(createdDiets as List<String>?),
      if (createdDietsFieldValue != null)
        _$UserFieldMap['createdDiets']!: createdDietsFieldValue,
      if (age != _sentinel)
        _$UserFieldMap['age']!: _$UserPerFieldToJson.age(age as int?),
      if (ageFieldValue != null) _$UserFieldMap['age']!: ageFieldValue,
      if (height != _sentinel)
        _$UserFieldMap['height']!: _$UserPerFieldToJson.height(height as int?),
      if (heightFieldValue != null) _$UserFieldMap['height']!: heightFieldValue,
      if (weight != _sentinel)
        _$UserFieldMap['weight']!: _$UserPerFieldToJson.weight(weight as int?),
      if (weightFieldValue != null) _$UserFieldMap['weight']!: weightFieldValue,
      if (dietFocus != _sentinel)
        _$UserFieldMap['dietFocus']!:
            _$UserPerFieldToJson.dietFocus(dietFocus as String?),
      if (dietFocusFieldValue != null)
        _$UserFieldMap['dietFocus']!: dietFocusFieldValue,
      if (allergies != _sentinel)
        _$UserFieldMap['allergies']!:
            _$UserPerFieldToJson.allergies(allergies as List<String>?),
      if (allergiesFieldValue != null)
        _$UserFieldMap['allergies']!: allergiesFieldValue,
      if (assignedDietsMap != _sentinel)
        _$UserFieldMap['assignedDietsMap']!: _$UserPerFieldToJson
            .assignedDietsMap(assignedDietsMap as Map<String, String>),
      if (assignedDietsMapFieldValue != null)
        _$UserFieldMap['assignedDietsMap']!: assignedDietsMapFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? admin = _sentinel,
    FieldValue? adminFieldValue,
    Object? createdDiets = _sentinel,
    FieldValue? createdDietsFieldValue,
    Object? age = _sentinel,
    FieldValue? ageFieldValue,
    Object? height = _sentinel,
    FieldValue? heightFieldValue,
    Object? weight = _sentinel,
    FieldValue? weightFieldValue,
    Object? dietFocus = _sentinel,
    FieldValue? dietFocusFieldValue,
    Object? allergies = _sentinel,
    FieldValue? allergiesFieldValue,
    Object? assignedDietsMap = _sentinel,
    FieldValue? assignedDietsMapFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      admin == _sentinel || adminFieldValue == null,
      "Cannot specify both admin and adminFieldValue",
    );
    assert(
      createdDiets == _sentinel || createdDietsFieldValue == null,
      "Cannot specify both createdDiets and createdDietsFieldValue",
    );
    assert(
      age == _sentinel || ageFieldValue == null,
      "Cannot specify both age and ageFieldValue",
    );
    assert(
      height == _sentinel || heightFieldValue == null,
      "Cannot specify both height and heightFieldValue",
    );
    assert(
      weight == _sentinel || weightFieldValue == null,
      "Cannot specify both weight and weightFieldValue",
    );
    assert(
      dietFocus == _sentinel || dietFocusFieldValue == null,
      "Cannot specify both dietFocus and dietFocusFieldValue",
    );
    assert(
      allergies == _sentinel || allergiesFieldValue == null,
      "Cannot specify both allergies and allergiesFieldValue",
    );
    assert(
      assignedDietsMap == _sentinel || assignedDietsMapFieldValue == null,
      "Cannot specify both assignedDietsMap and assignedDietsMapFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$UserFieldMap['name']!: _$UserPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$UserFieldMap['name']!: nameFieldValue,
      if (admin != _sentinel)
        _$UserFieldMap['admin']!: _$UserPerFieldToJson.admin(admin as bool),
      if (adminFieldValue != null) _$UserFieldMap['admin']!: adminFieldValue,
      if (createdDiets != _sentinel)
        _$UserFieldMap['createdDiets']!:
            _$UserPerFieldToJson.createdDiets(createdDiets as List<String>?),
      if (createdDietsFieldValue != null)
        _$UserFieldMap['createdDiets']!: createdDietsFieldValue,
      if (age != _sentinel)
        _$UserFieldMap['age']!: _$UserPerFieldToJson.age(age as int?),
      if (ageFieldValue != null) _$UserFieldMap['age']!: ageFieldValue,
      if (height != _sentinel)
        _$UserFieldMap['height']!: _$UserPerFieldToJson.height(height as int?),
      if (heightFieldValue != null) _$UserFieldMap['height']!: heightFieldValue,
      if (weight != _sentinel)
        _$UserFieldMap['weight']!: _$UserPerFieldToJson.weight(weight as int?),
      if (weightFieldValue != null) _$UserFieldMap['weight']!: weightFieldValue,
      if (dietFocus != _sentinel)
        _$UserFieldMap['dietFocus']!:
            _$UserPerFieldToJson.dietFocus(dietFocus as String?),
      if (dietFocusFieldValue != null)
        _$UserFieldMap['dietFocus']!: dietFocusFieldValue,
      if (allergies != _sentinel)
        _$UserFieldMap['allergies']!:
            _$UserPerFieldToJson.allergies(allergies as List<String>?),
      if (allergiesFieldValue != null)
        _$UserFieldMap['allergies']!: allergiesFieldValue,
      if (assignedDietsMap != _sentinel)
        _$UserFieldMap['assignedDietsMap']!: _$UserPerFieldToJson
            .assignedDietsMap(assignedDietsMap as Map<String, String>),
      if (assignedDietsMapFieldValue != null)
        _$UserFieldMap['assignedDietsMap']!: assignedDietsMapFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? admin = _sentinel,
    FieldValue? adminFieldValue,
    Object? createdDiets = _sentinel,
    FieldValue? createdDietsFieldValue,
    Object? age = _sentinel,
    FieldValue? ageFieldValue,
    Object? height = _sentinel,
    FieldValue? heightFieldValue,
    Object? weight = _sentinel,
    FieldValue? weightFieldValue,
    Object? dietFocus = _sentinel,
    FieldValue? dietFocusFieldValue,
    Object? allergies = _sentinel,
    FieldValue? allergiesFieldValue,
    Object? assignedDietsMap = _sentinel,
    FieldValue? assignedDietsMapFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      admin == _sentinel || adminFieldValue == null,
      "Cannot specify both admin and adminFieldValue",
    );
    assert(
      createdDiets == _sentinel || createdDietsFieldValue == null,
      "Cannot specify both createdDiets and createdDietsFieldValue",
    );
    assert(
      age == _sentinel || ageFieldValue == null,
      "Cannot specify both age and ageFieldValue",
    );
    assert(
      height == _sentinel || heightFieldValue == null,
      "Cannot specify both height and heightFieldValue",
    );
    assert(
      weight == _sentinel || weightFieldValue == null,
      "Cannot specify both weight and weightFieldValue",
    );
    assert(
      dietFocus == _sentinel || dietFocusFieldValue == null,
      "Cannot specify both dietFocus and dietFocusFieldValue",
    );
    assert(
      allergies == _sentinel || allergiesFieldValue == null,
      "Cannot specify both allergies and allergiesFieldValue",
    );
    assert(
      assignedDietsMap == _sentinel || assignedDietsMapFieldValue == null,
      "Cannot specify both assignedDietsMap and assignedDietsMapFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$UserFieldMap['name']!: _$UserPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$UserFieldMap['name']!: nameFieldValue,
      if (admin != _sentinel)
        _$UserFieldMap['admin']!: _$UserPerFieldToJson.admin(admin as bool),
      if (adminFieldValue != null) _$UserFieldMap['admin']!: adminFieldValue,
      if (createdDiets != _sentinel)
        _$UserFieldMap['createdDiets']!:
            _$UserPerFieldToJson.createdDiets(createdDiets as List<String>?),
      if (createdDietsFieldValue != null)
        _$UserFieldMap['createdDiets']!: createdDietsFieldValue,
      if (age != _sentinel)
        _$UserFieldMap['age']!: _$UserPerFieldToJson.age(age as int?),
      if (ageFieldValue != null) _$UserFieldMap['age']!: ageFieldValue,
      if (height != _sentinel)
        _$UserFieldMap['height']!: _$UserPerFieldToJson.height(height as int?),
      if (heightFieldValue != null) _$UserFieldMap['height']!: heightFieldValue,
      if (weight != _sentinel)
        _$UserFieldMap['weight']!: _$UserPerFieldToJson.weight(weight as int?),
      if (weightFieldValue != null) _$UserFieldMap['weight']!: weightFieldValue,
      if (dietFocus != _sentinel)
        _$UserFieldMap['dietFocus']!:
            _$UserPerFieldToJson.dietFocus(dietFocus as String?),
      if (dietFocusFieldValue != null)
        _$UserFieldMap['dietFocus']!: dietFocusFieldValue,
      if (allergies != _sentinel)
        _$UserFieldMap['allergies']!:
            _$UserPerFieldToJson.allergies(allergies as List<String>?),
      if (allergiesFieldValue != null)
        _$UserFieldMap['allergies']!: allergiesFieldValue,
      if (assignedDietsMap != _sentinel)
        _$UserFieldMap['assignedDietsMap']!: _$UserPerFieldToJson
            .assignedDietsMap(assignedDietsMap as Map<String, String>),
      if (assignedDietsMapFieldValue != null)
        _$UserFieldMap['assignedDietsMap']!: assignedDietsMapFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserQuery implements QueryReference<User, UserQuerySnapshot> {
  @override
  UserQuery limit(int limit);

  @override
  UserQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  UserQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereAdmin({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereCreatedDiets({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    String? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  });

  UserQuery whereAge({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereHeight({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereWeight({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereDietFocus({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereAllergies({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    String? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  });

  UserQuery whereAssignedDietsMap({
    Map<String, String>? isEqualTo,
    Map<String, String>? isNotEqualTo,
    Map<String, String>? isLessThan,
    Map<String, String>? isLessThanOrEqualTo,
    Map<String, String>? isGreaterThan,
    Map<String, String>? isGreaterThanOrEqualTo,
    List<Map<String, String>>? whereIn,
    List<Map<String, String>>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  UserQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByAdmin({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByCreatedDiets({
    bool descending = false,
    List<String>? startAt,
    List<String>? startAfter,
    List<String>? endAt,
    List<String>? endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByAge({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByHeight({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByWeight({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByDietFocus({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByAllergies({
    bool descending = false,
    List<String>? startAt,
    List<String>? startAfter,
    List<String>? endAt,
    List<String>? endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByAssignedDietsMap({
    bool descending = false,
    Map<String, String> startAt,
    Map<String, String> startAfter,
    Map<String, String> endAt,
    Map<String, String> endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });
}

class _$UserQuery extends QueryReference<User, UserQuerySnapshot>
    implements UserQuery {
  _$UserQuery(
    this._collection, {
    required Query<User> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(UserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserQuery limit(int limit) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery limitToLast(int limit) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereAdmin({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['admin']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.admin(isEqualTo as bool)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.admin(isNotEqualTo as bool)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.admin(isLessThan as bool)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.admin(isLessThanOrEqualTo as bool)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.admin(isGreaterThan as bool)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.admin(isGreaterThanOrEqualTo as bool)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.admin(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.admin(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereCreatedDiets({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['createdDiets']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.createdDiets(isEqualTo as List<String>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.createdDiets(isNotEqualTo as List<String>?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.createdDiets(isLessThan as List<String>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .createdDiets(isLessThanOrEqualTo as List<String>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.createdDiets(isGreaterThan as List<String>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .createdDiets(isGreaterThanOrEqualTo as List<String>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$UserPerFieldToJson.createdDiets([arrayContains as String])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$UserPerFieldToJson.createdDiets(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereAge({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['age']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.age(isEqualTo as int?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.age(isNotEqualTo as int?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.age(isLessThan as int?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.age(isLessThanOrEqualTo as int?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.age(isGreaterThan as int?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.age(isGreaterThanOrEqualTo as int?)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.age(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.age(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereHeight({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['height']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.height(isEqualTo as int?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.height(isNotEqualTo as int?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.height(isLessThan as int?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.height(isLessThanOrEqualTo as int?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.height(isGreaterThan as int?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.height(isGreaterThanOrEqualTo as int?)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.height(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.height(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereWeight({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['weight']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.weight(isEqualTo as int?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.weight(isNotEqualTo as int?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.weight(isLessThan as int?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.weight(isLessThanOrEqualTo as int?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.weight(isGreaterThan as int?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.weight(isGreaterThanOrEqualTo as int?)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.weight(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.weight(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereDietFocus({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['dietFocus']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.dietFocus(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.dietFocus(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.dietFocus(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.dietFocus(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.dietFocus(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.dietFocus(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.dietFocus(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.dietFocus(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereAllergies({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['allergies']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.allergies(isEqualTo as List<String>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.allergies(isNotEqualTo as List<String>?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.allergies(isLessThan as List<String>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .allergies(isLessThanOrEqualTo as List<String>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.allergies(isGreaterThan as List<String>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .allergies(isGreaterThanOrEqualTo as List<String>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$UserPerFieldToJson.allergies([arrayContains as String])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$UserPerFieldToJson.allergies(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereAssignedDietsMap({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<Map<String, String>>? whereIn,
    List<Map<String, String>>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['assignedDietsMap']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson
                .assignedDietsMap(isEqualTo as Map<String, String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson
                .assignedDietsMap(isNotEqualTo as Map<String, String>)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson
                .assignedDietsMap(isLessThan as Map<String, String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .assignedDietsMap(isLessThanOrEqualTo as Map<String, String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson
                .assignedDietsMap(isGreaterThan as Map<String, String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .assignedDietsMap(isGreaterThanOrEqualTo as Map<String, String>)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.assignedDietsMap(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserPerFieldToJson.assignedDietsMap(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByAdmin({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['admin']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByCreatedDiets({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserFieldMap['createdDiets']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByAge({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['age']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByHeight({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['height']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByWeight({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['weight']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByDietFocus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['dietFocus']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByAllergies({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['allergies']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByAssignedDietsMap({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserFieldMap['assignedDietsMap']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserDocumentSnapshot extends FirestoreDocumentSnapshot<User> {
  UserDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<User> snapshot;

  @override
  UserDocumentReference get reference {
    return UserDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final User? data;
}

class UserQuerySnapshot
    extends FirestoreQuerySnapshot<User, UserQueryDocumentSnapshot> {
  UserQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<User> snapshot,
  ) {
    final docs = snapshot.docs.map(UserQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserDocumentSnapshot._,
      );
    }).toList();

    return UserQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<User> snapshot;

  @override
  final List<UserQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserDocumentSnapshot>> docChanges;
}

class UserQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<User>
    implements UserDocumentSnapshot {
  UserQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<User> snapshot;

  @override
  final User data;

  @override
  UserDocumentReference get reference {
    return UserDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

void _$assertUser(User instance) {
  const Min(0).validate(instance.age, 'age');
  const Min(0).validate(instance.height, 'height');
  const Min(0).validate(instance.weight, 'weight');
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String,
      admin: json['admin'] as bool,
      name: json['name'] as String,
      createdDiets: (json['createdDiets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      age: (json['age'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      dietFocus: json['dietFocus'] as String?,
      allergies: (json['allergies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      assignedDietsMap:
          (json['assignedDietsMap'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as String),
              ) ??
              const {},
    );

const _$UserFieldMap = <String, String>{
  'uid': 'uid',
  'name': 'name',
  'admin': 'admin',
  'createdDiets': 'createdDiets',
  'age': 'age',
  'height': 'height',
  'weight': 'weight',
  'dietFocus': 'dietFocus',
  'allergies': 'allergies',
  'assignedDietsMap': 'assignedDietsMap',
};

// ignore: unused_element
abstract class _$UserPerFieldToJson {
  // ignore: unused_element
  static Object? uid(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? admin(bool instance) => instance;
  // ignore: unused_element
  static Object? createdDiets(List<String>? instance) => instance;
  // ignore: unused_element
  static Object? age(int? instance) => instance;
  // ignore: unused_element
  static Object? height(int? instance) => instance;
  // ignore: unused_element
  static Object? weight(int? instance) => instance;
  // ignore: unused_element
  static Object? dietFocus(String? instance) => instance;
  // ignore: unused_element
  static Object? allergies(List<String>? instance) => instance;
  // ignore: unused_element
  static Object? assignedDietsMap(Map<String, String> instance) => instance;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'admin': instance.admin,
      'createdDiets': instance.createdDiets,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'dietFocus': instance.dietFocus,
      'allergies': instance.allergies,
      'assignedDietsMap': instance.assignedDietsMap,
    };
