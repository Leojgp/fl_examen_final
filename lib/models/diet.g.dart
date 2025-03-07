// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet.dart';

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
abstract class DietCollectionReference
    implements
        DietQuery,
        FirestoreCollectionReference<Diet, DietQuerySnapshot> {
  factory DietCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$DietCollectionReference;

  static Diet fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$DietFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Diet value,
    SetOptions? options,
  ) {
    return {..._$DietToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Diet> get reference;

  @override
  DietDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<DietDocumentReference> add(Diet value);
}

class _$DietCollectionReference extends _$DietQuery
    implements DietCollectionReference {
  factory _$DietCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$DietCollectionReference._(
      firestore.collection('diet').withConverter(
            fromFirestore: DietCollectionReference.fromFirestore,
            toFirestore: DietCollectionReference.toFirestore,
          ),
    );
  }

  _$DietCollectionReference._(
    CollectionReference<Diet> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Diet> get reference =>
      super.reference as CollectionReference<Diet>;

  @override
  DietDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return DietDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<DietDocumentReference> add(Diet value) {
    return reference.add(value).then((ref) => DietDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$DietCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class DietDocumentReference
    extends FirestoreDocumentReference<Diet, DietDocumentSnapshot> {
  factory DietDocumentReference(DocumentReference<Diet> reference) =
      _$DietDocumentReference;

  DocumentReference<Diet> get reference;

  /// A reference to the [DietCollectionReference] containing this document.
  DietCollectionReference get parent {
    return _$DietCollectionReference(reference.firestore);
  }

  @override
  Stream<DietDocumentSnapshot> snapshots();

  @override
  Future<DietDocumentSnapshot> get([GetOptions? options]);

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
    Diet model, {
    SetOptions? options,
    FieldValue typeFieldValue,
    FieldValue mealsIDsFieldValue,
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
    Diet model, {
    SetOptions? options,
    FieldValue typeFieldValue,
    FieldValue mealsIDsFieldValue,
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
    Diet model, {
    SetOptions? options,
    FieldValue typeFieldValue,
    FieldValue mealsIDsFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String type,
    FieldValue typeFieldValue,
    List<String> mealsIDs,
    FieldValue mealsIDsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String type,
    FieldValue typeFieldValue,
    List<String> mealsIDs,
    FieldValue mealsIDsFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String type,
    FieldValue typeFieldValue,
    List<String> mealsIDs,
    FieldValue mealsIDsFieldValue,
  });
}

class _$DietDocumentReference
    extends FirestoreDocumentReference<Diet, DietDocumentSnapshot>
    implements DietDocumentReference {
  _$DietDocumentReference(this.reference);

  @override
  final DocumentReference<Diet> reference;

  /// A reference to the [DietCollectionReference] containing this document.
  DietCollectionReference get parent {
    return _$DietCollectionReference(reference.firestore);
  }

  @override
  Stream<DietDocumentSnapshot> snapshots() {
    return reference.snapshots().map(DietDocumentSnapshot._);
  }

  @override
  Future<DietDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(DietDocumentSnapshot._);
  }

  @override
  Future<DietDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(DietDocumentSnapshot._);
  }

  Future<void> set(
    Diet model, {
    SetOptions? options,
    FieldValue? typeFieldValue,
    FieldValue? mealsIDsFieldValue,
  }) async {
    final json = {
      ..._$DietToJson(model),
      if (typeFieldValue != null) _$DietFieldMap['type']!: typeFieldValue,
      if (mealsIDsFieldValue != null)
        _$DietFieldMap['mealsIDs']!: mealsIDsFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    Diet model, {
    SetOptions? options,
    FieldValue? typeFieldValue,
    FieldValue? mealsIDsFieldValue,
  }) {
    final json = {
      ..._$DietToJson(model),
      if (typeFieldValue != null) _$DietFieldMap['type']!: typeFieldValue,
      if (mealsIDsFieldValue != null)
        _$DietFieldMap['mealsIDs']!: mealsIDsFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    Diet model, {
    SetOptions? options,
    FieldValue? typeFieldValue,
    FieldValue? mealsIDsFieldValue,
  }) {
    final json = {
      ..._$DietToJson(model),
      if (typeFieldValue != null) _$DietFieldMap['type']!: typeFieldValue,
      if (mealsIDsFieldValue != null)
        _$DietFieldMap['mealsIDs']!: mealsIDsFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? mealsIDs = _sentinel,
    FieldValue? mealsIDsFieldValue,
  }) async {
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      mealsIDs == _sentinel || mealsIDsFieldValue == null,
      "Cannot specify both mealsIDs and mealsIDsFieldValue",
    );
    final json = {
      if (type != _sentinel)
        _$DietFieldMap['type']!: _$DietPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$DietFieldMap['type']!: typeFieldValue,
      if (mealsIDs != _sentinel)
        _$DietFieldMap['mealsIDs']!:
            _$DietPerFieldToJson.mealsIDs(mealsIDs as List<String>),
      if (mealsIDsFieldValue != null)
        _$DietFieldMap['mealsIDs']!: mealsIDsFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? mealsIDs = _sentinel,
    FieldValue? mealsIDsFieldValue,
  }) {
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      mealsIDs == _sentinel || mealsIDsFieldValue == null,
      "Cannot specify both mealsIDs and mealsIDsFieldValue",
    );
    final json = {
      if (type != _sentinel)
        _$DietFieldMap['type']!: _$DietPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$DietFieldMap['type']!: typeFieldValue,
      if (mealsIDs != _sentinel)
        _$DietFieldMap['mealsIDs']!:
            _$DietPerFieldToJson.mealsIDs(mealsIDs as List<String>),
      if (mealsIDsFieldValue != null)
        _$DietFieldMap['mealsIDs']!: mealsIDsFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? mealsIDs = _sentinel,
    FieldValue? mealsIDsFieldValue,
  }) {
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      mealsIDs == _sentinel || mealsIDsFieldValue == null,
      "Cannot specify both mealsIDs and mealsIDsFieldValue",
    );
    final json = {
      if (type != _sentinel)
        _$DietFieldMap['type']!: _$DietPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$DietFieldMap['type']!: typeFieldValue,
      if (mealsIDs != _sentinel)
        _$DietFieldMap['mealsIDs']!:
            _$DietPerFieldToJson.mealsIDs(mealsIDs as List<String>),
      if (mealsIDsFieldValue != null)
        _$DietFieldMap['mealsIDs']!: mealsIDsFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is DietDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class DietQuery implements QueryReference<Diet, DietQuerySnapshot> {
  @override
  DietQuery limit(int limit);

  @override
  DietQuery limitToLast(int limit);

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
  DietQuery whereFieldPath(
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

  DietQuery whereDocumentId({
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

  DietQuery whereType({
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

  DietQuery whereMealsIDs({
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
  DietQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    DietDocumentSnapshot? startAtDocument,
    DietDocumentSnapshot? endAtDocument,
    DietDocumentSnapshot? endBeforeDocument,
    DietDocumentSnapshot? startAfterDocument,
  });

  DietQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    DietDocumentSnapshot? startAtDocument,
    DietDocumentSnapshot? endAtDocument,
    DietDocumentSnapshot? endBeforeDocument,
    DietDocumentSnapshot? startAfterDocument,
  });

  DietQuery orderByType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    DietDocumentSnapshot? startAtDocument,
    DietDocumentSnapshot? endAtDocument,
    DietDocumentSnapshot? endBeforeDocument,
    DietDocumentSnapshot? startAfterDocument,
  });

  DietQuery orderByMealsIDs({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    DietDocumentSnapshot? startAtDocument,
    DietDocumentSnapshot? endAtDocument,
    DietDocumentSnapshot? endBeforeDocument,
    DietDocumentSnapshot? startAfterDocument,
  });
}

class _$DietQuery extends QueryReference<Diet, DietQuerySnapshot>
    implements DietQuery {
  _$DietQuery(
    this._collection, {
    required Query<Diet> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<DietQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(DietQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<DietQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(DietQuerySnapshot._fromQuerySnapshot);
  }

  @override
  DietQuery limit(int limit) {
    return _$DietQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  DietQuery limitToLast(int limit) {
    return _$DietQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  DietQuery whereFieldPath(
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
    return _$DietQuery(
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
  DietQuery whereDocumentId({
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
    return _$DietQuery(
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
  DietQuery whereType({
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
    return _$DietQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$DietFieldMap['type']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$DietPerFieldToJson.type(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$DietPerFieldToJson.type(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$DietPerFieldToJson.type(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$DietPerFieldToJson.type(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$DietPerFieldToJson.type(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$DietPerFieldToJson.type(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$DietPerFieldToJson.type(e)),
        whereNotIn: whereNotIn?.map((e) => _$DietPerFieldToJson.type(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  DietQuery whereMealsIDs({
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
    return _$DietQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$DietFieldMap['mealsIDs']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$DietPerFieldToJson.mealsIDs(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$DietPerFieldToJson.mealsIDs(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$DietPerFieldToJson.mealsIDs(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$DietPerFieldToJson.mealsIDs(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$DietPerFieldToJson.mealsIDs(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$DietPerFieldToJson
                .mealsIDs(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$DietPerFieldToJson.mealsIDs([arrayContains as String])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$DietPerFieldToJson.mealsIDs(arrayContainsAny)
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
  DietQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DietDocumentSnapshot? startAtDocument,
    DietDocumentSnapshot? endAtDocument,
    DietDocumentSnapshot? endBeforeDocument,
    DietDocumentSnapshot? startAfterDocument,
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

    return _$DietQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  DietQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DietDocumentSnapshot? startAtDocument,
    DietDocumentSnapshot? endAtDocument,
    DietDocumentSnapshot? endBeforeDocument,
    DietDocumentSnapshot? startAfterDocument,
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

    return _$DietQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  DietQuery orderByType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DietDocumentSnapshot? startAtDocument,
    DietDocumentSnapshot? endAtDocument,
    DietDocumentSnapshot? endBeforeDocument,
    DietDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$DietFieldMap['type']!,
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

    return _$DietQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  DietQuery orderByMealsIDs({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DietDocumentSnapshot? startAtDocument,
    DietDocumentSnapshot? endAtDocument,
    DietDocumentSnapshot? endBeforeDocument,
    DietDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$DietFieldMap['mealsIDs']!,
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

    return _$DietQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$DietQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class DietDocumentSnapshot extends FirestoreDocumentSnapshot<Diet> {
  DietDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Diet> snapshot;

  @override
  DietDocumentReference get reference {
    return DietDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Diet? data;
}

class DietQuerySnapshot
    extends FirestoreQuerySnapshot<Diet, DietQueryDocumentSnapshot> {
  DietQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory DietQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Diet> snapshot,
  ) {
    final docs = snapshot.docs.map(DietQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        DietDocumentSnapshot._,
      );
    }).toList();

    return DietQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<DietDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    DietDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<DietDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Diet> snapshot;

  @override
  final List<DietQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<DietDocumentSnapshot>> docChanges;
}

class DietQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Diet>
    implements DietDocumentSnapshot {
  DietQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Diet> snapshot;

  @override
  final Diet data;

  @override
  DietDocumentReference get reference {
    return DietDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diet _$DietFromJson(Map<String, dynamic> json) => Diet(
      type: json['type'] as String,
      mealsIDs:
          (json['mealsIDs'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as String,
    );

const _$DietFieldMap = <String, String>{
  'id': 'id',
  'type': 'type',
  'mealsIDs': 'mealsIDs',
};

// ignore: unused_element
abstract class _$DietPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? type(String instance) => instance;
  // ignore: unused_element
  static Object? mealsIDs(List<String> instance) => instance;
}

Map<String, dynamic> _$DietToJson(Diet instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'mealsIDs': instance.mealsIDs,
    };
