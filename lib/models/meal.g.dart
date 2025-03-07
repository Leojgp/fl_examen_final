// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

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
abstract class MealCollectionReference
    implements
        MealQuery,
        FirestoreCollectionReference<Meal, MealQuerySnapshot> {
  factory MealCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$MealCollectionReference;

  static Meal fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$MealFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Meal value,
    SetOptions? options,
  ) {
    return {..._$MealToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Meal> get reference;

  @override
  MealDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MealDocumentReference> add(Meal value);
}

class _$MealCollectionReference extends _$MealQuery
    implements MealCollectionReference {
  factory _$MealCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$MealCollectionReference._(
      firestore.collection('meals').withConverter(
            fromFirestore: MealCollectionReference.fromFirestore,
            toFirestore: MealCollectionReference.toFirestore,
          ),
    );
  }

  _$MealCollectionReference._(
    CollectionReference<Meal> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Meal> get reference =>
      super.reference as CollectionReference<Meal>;

  @override
  MealDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return MealDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MealDocumentReference> add(Meal value) {
    return reference.add(value).then((ref) => MealDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MealCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MealDocumentReference
    extends FirestoreDocumentReference<Meal, MealDocumentSnapshot> {
  factory MealDocumentReference(DocumentReference<Meal> reference) =
      _$MealDocumentReference;

  DocumentReference<Meal> get reference;

  /// A reference to the [MealCollectionReference] containing this document.
  MealCollectionReference get parent {
    return _$MealCollectionReference(reference.firestore);
  }

  @override
  Stream<MealDocumentSnapshot> snapshots();

  @override
  Future<MealDocumentSnapshot> get([GetOptions? options]);

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
    Meal model, {
    SetOptions? options,
    FieldValue imageFieldValue,
    FieldValue nameFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue ingredientsIdsWithQuantityFieldValue,
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
    Meal model, {
    SetOptions? options,
    FieldValue imageFieldValue,
    FieldValue nameFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue ingredientsIdsWithQuantityFieldValue,
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
    Meal model, {
    SetOptions? options,
    FieldValue imageFieldValue,
    FieldValue nameFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue ingredientsIdsWithQuantityFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    Uri image,
    FieldValue imageFieldValue,
    String name,
    FieldValue nameFieldValue,
    Timestamp createdAt,
    FieldValue createdAtFieldValue,
    List<Map<int, String>> ingredientsIdsWithQuantity,
    FieldValue ingredientsIdsWithQuantityFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    Uri image,
    FieldValue imageFieldValue,
    String name,
    FieldValue nameFieldValue,
    Timestamp createdAt,
    FieldValue createdAtFieldValue,
    List<Map<int, String>> ingredientsIdsWithQuantity,
    FieldValue ingredientsIdsWithQuantityFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    Uri image,
    FieldValue imageFieldValue,
    String name,
    FieldValue nameFieldValue,
    Timestamp createdAt,
    FieldValue createdAtFieldValue,
    List<Map<int, String>> ingredientsIdsWithQuantity,
    FieldValue ingredientsIdsWithQuantityFieldValue,
  });
}

class _$MealDocumentReference
    extends FirestoreDocumentReference<Meal, MealDocumentSnapshot>
    implements MealDocumentReference {
  _$MealDocumentReference(this.reference);

  @override
  final DocumentReference<Meal> reference;

  /// A reference to the [MealCollectionReference] containing this document.
  MealCollectionReference get parent {
    return _$MealCollectionReference(reference.firestore);
  }

  @override
  Stream<MealDocumentSnapshot> snapshots() {
    return reference.snapshots().map(MealDocumentSnapshot._);
  }

  @override
  Future<MealDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(MealDocumentSnapshot._);
  }

  @override
  Future<MealDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(MealDocumentSnapshot._);
  }

  Future<void> set(
    Meal model, {
    SetOptions? options,
    FieldValue? imageFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? ingredientsIdsWithQuantityFieldValue,
  }) async {
    final json = {
      ..._$MealToJson(model),
      if (imageFieldValue != null) _$MealFieldMap['image']!: imageFieldValue,
      if (nameFieldValue != null) _$MealFieldMap['name']!: nameFieldValue,
      if (createdAtFieldValue != null)
        _$MealFieldMap['createdAt']!: createdAtFieldValue,
      if (ingredientsIdsWithQuantityFieldValue != null)
        _$MealFieldMap['ingredientsIdsWithQuantity']!:
            ingredientsIdsWithQuantityFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    Meal model, {
    SetOptions? options,
    FieldValue? imageFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? ingredientsIdsWithQuantityFieldValue,
  }) {
    final json = {
      ..._$MealToJson(model),
      if (imageFieldValue != null) _$MealFieldMap['image']!: imageFieldValue,
      if (nameFieldValue != null) _$MealFieldMap['name']!: nameFieldValue,
      if (createdAtFieldValue != null)
        _$MealFieldMap['createdAt']!: createdAtFieldValue,
      if (ingredientsIdsWithQuantityFieldValue != null)
        _$MealFieldMap['ingredientsIdsWithQuantity']!:
            ingredientsIdsWithQuantityFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    Meal model, {
    SetOptions? options,
    FieldValue? imageFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? ingredientsIdsWithQuantityFieldValue,
  }) {
    final json = {
      ..._$MealToJson(model),
      if (imageFieldValue != null) _$MealFieldMap['image']!: imageFieldValue,
      if (nameFieldValue != null) _$MealFieldMap['name']!: nameFieldValue,
      if (createdAtFieldValue != null)
        _$MealFieldMap['createdAt']!: createdAtFieldValue,
      if (ingredientsIdsWithQuantityFieldValue != null)
        _$MealFieldMap['ingredientsIdsWithQuantity']!:
            ingredientsIdsWithQuantityFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? image = _sentinel,
    FieldValue? imageFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? ingredientsIdsWithQuantity = _sentinel,
    FieldValue? ingredientsIdsWithQuantityFieldValue,
  }) async {
    assert(
      image == _sentinel || imageFieldValue == null,
      "Cannot specify both image and imageFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      ingredientsIdsWithQuantity == _sentinel ||
          ingredientsIdsWithQuantityFieldValue == null,
      "Cannot specify both ingredientsIdsWithQuantity and ingredientsIdsWithQuantityFieldValue",
    );
    final json = {
      if (image != _sentinel)
        _$MealFieldMap['image']!: _$MealPerFieldToJson.image(image as Uri),
      if (imageFieldValue != null) _$MealFieldMap['image']!: imageFieldValue,
      if (name != _sentinel)
        _$MealFieldMap['name']!: _$MealPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$MealFieldMap['name']!: nameFieldValue,
      if (createdAt != _sentinel)
        _$MealFieldMap['createdAt']!:
            _$MealPerFieldToJson.createdAt(createdAt as Timestamp),
      if (createdAtFieldValue != null)
        _$MealFieldMap['createdAt']!: createdAtFieldValue,
      if (ingredientsIdsWithQuantity != _sentinel)
        _$MealFieldMap['ingredientsIdsWithQuantity']!:
            _$MealPerFieldToJson.ingredientsIdsWithQuantity(
                ingredientsIdsWithQuantity as List<Map<int, String>>),
      if (ingredientsIdsWithQuantityFieldValue != null)
        _$MealFieldMap['ingredientsIdsWithQuantity']!:
            ingredientsIdsWithQuantityFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? image = _sentinel,
    FieldValue? imageFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? ingredientsIdsWithQuantity = _sentinel,
    FieldValue? ingredientsIdsWithQuantityFieldValue,
  }) {
    assert(
      image == _sentinel || imageFieldValue == null,
      "Cannot specify both image and imageFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      ingredientsIdsWithQuantity == _sentinel ||
          ingredientsIdsWithQuantityFieldValue == null,
      "Cannot specify both ingredientsIdsWithQuantity and ingredientsIdsWithQuantityFieldValue",
    );
    final json = {
      if (image != _sentinel)
        _$MealFieldMap['image']!: _$MealPerFieldToJson.image(image as Uri),
      if (imageFieldValue != null) _$MealFieldMap['image']!: imageFieldValue,
      if (name != _sentinel)
        _$MealFieldMap['name']!: _$MealPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$MealFieldMap['name']!: nameFieldValue,
      if (createdAt != _sentinel)
        _$MealFieldMap['createdAt']!:
            _$MealPerFieldToJson.createdAt(createdAt as Timestamp),
      if (createdAtFieldValue != null)
        _$MealFieldMap['createdAt']!: createdAtFieldValue,
      if (ingredientsIdsWithQuantity != _sentinel)
        _$MealFieldMap['ingredientsIdsWithQuantity']!:
            _$MealPerFieldToJson.ingredientsIdsWithQuantity(
                ingredientsIdsWithQuantity as List<Map<int, String>>),
      if (ingredientsIdsWithQuantityFieldValue != null)
        _$MealFieldMap['ingredientsIdsWithQuantity']!:
            ingredientsIdsWithQuantityFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? image = _sentinel,
    FieldValue? imageFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? ingredientsIdsWithQuantity = _sentinel,
    FieldValue? ingredientsIdsWithQuantityFieldValue,
  }) {
    assert(
      image == _sentinel || imageFieldValue == null,
      "Cannot specify both image and imageFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      ingredientsIdsWithQuantity == _sentinel ||
          ingredientsIdsWithQuantityFieldValue == null,
      "Cannot specify both ingredientsIdsWithQuantity and ingredientsIdsWithQuantityFieldValue",
    );
    final json = {
      if (image != _sentinel)
        _$MealFieldMap['image']!: _$MealPerFieldToJson.image(image as Uri),
      if (imageFieldValue != null) _$MealFieldMap['image']!: imageFieldValue,
      if (name != _sentinel)
        _$MealFieldMap['name']!: _$MealPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$MealFieldMap['name']!: nameFieldValue,
      if (createdAt != _sentinel)
        _$MealFieldMap['createdAt']!:
            _$MealPerFieldToJson.createdAt(createdAt as Timestamp),
      if (createdAtFieldValue != null)
        _$MealFieldMap['createdAt']!: createdAtFieldValue,
      if (ingredientsIdsWithQuantity != _sentinel)
        _$MealFieldMap['ingredientsIdsWithQuantity']!:
            _$MealPerFieldToJson.ingredientsIdsWithQuantity(
                ingredientsIdsWithQuantity as List<Map<int, String>>),
      if (ingredientsIdsWithQuantityFieldValue != null)
        _$MealFieldMap['ingredientsIdsWithQuantity']!:
            ingredientsIdsWithQuantityFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is MealDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class MealQuery implements QueryReference<Meal, MealQuerySnapshot> {
  @override
  MealQuery limit(int limit);

  @override
  MealQuery limitToLast(int limit);

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
  MealQuery whereFieldPath(
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

  MealQuery whereDocumentId({
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

  MealQuery whereImage({
    Uri? isEqualTo,
    Uri? isNotEqualTo,
    Uri? isLessThan,
    Uri? isLessThanOrEqualTo,
    Uri? isGreaterThan,
    Uri? isGreaterThanOrEqualTo,
    List<Uri>? whereIn,
    List<Uri>? whereNotIn,
    bool? isNull,
  });

  MealQuery whereName({
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

  MealQuery whereCreatedAt({
    Timestamp? isEqualTo,
    Timestamp? isNotEqualTo,
    Timestamp? isLessThan,
    Timestamp? isLessThanOrEqualTo,
    Timestamp? isGreaterThan,
    Timestamp? isGreaterThanOrEqualTo,
    List<Timestamp>? whereIn,
    List<Timestamp>? whereNotIn,
    bool? isNull,
  });

  MealQuery whereIngredientsIdsWithQuantity({
    List<Map<int, String>>? isEqualTo,
    List<Map<int, String>>? isNotEqualTo,
    List<Map<int, String>>? isLessThan,
    List<Map<int, String>>? isLessThanOrEqualTo,
    List<Map<int, String>>? isGreaterThan,
    List<Map<int, String>>? isGreaterThanOrEqualTo,
    Map<int, String>? arrayContains,
    List<Map<int, String>>? arrayContainsAny,
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
  MealQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
  });

  MealQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
  });

  MealQuery orderByImage({
    bool descending = false,
    Uri startAt,
    Uri startAfter,
    Uri endAt,
    Uri endBefore,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
  });

  MealQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
  });

  MealQuery orderByCreatedAt({
    bool descending = false,
    Timestamp startAt,
    Timestamp startAfter,
    Timestamp endAt,
    Timestamp endBefore,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
  });

  MealQuery orderByIngredientsIdsWithQuantity({
    bool descending = false,
    List<Map<int, String>> startAt,
    List<Map<int, String>> startAfter,
    List<Map<int, String>> endAt,
    List<Map<int, String>> endBefore,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
  });
}

class _$MealQuery extends QueryReference<Meal, MealQuerySnapshot>
    implements MealQuery {
  _$MealQuery(
    this._collection, {
    required Query<Meal> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<MealQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(MealQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<MealQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(MealQuerySnapshot._fromQuerySnapshot);
  }

  @override
  MealQuery limit(int limit) {
    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MealQuery limitToLast(int limit) {
    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MealQuery whereFieldPath(
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
    return _$MealQuery(
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
  MealQuery whereDocumentId({
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
    return _$MealQuery(
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
  MealQuery whereImage({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<Uri>? whereIn,
    List<Uri>? whereNotIn,
    bool? isNull,
  }) {
    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MealFieldMap['image']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$MealPerFieldToJson.image(isEqualTo as Uri)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$MealPerFieldToJson.image(isNotEqualTo as Uri)
            : null,
        isLessThan: isLessThan != null
            ? _$MealPerFieldToJson.image(isLessThan as Uri)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MealPerFieldToJson.image(isLessThanOrEqualTo as Uri)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MealPerFieldToJson.image(isGreaterThan as Uri)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MealPerFieldToJson.image(isGreaterThanOrEqualTo as Uri)
            : null,
        whereIn: whereIn?.map((e) => _$MealPerFieldToJson.image(e)),
        whereNotIn: whereNotIn?.map((e) => _$MealPerFieldToJson.image(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MealQuery whereName({
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
    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MealFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$MealPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$MealPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$MealPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MealPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MealPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MealPerFieldToJson.name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$MealPerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$MealPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MealQuery whereCreatedAt({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<Timestamp>? whereIn,
    List<Timestamp>? whereNotIn,
    bool? isNull,
  }) {
    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MealFieldMap['createdAt']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$MealPerFieldToJson.createdAt(isEqualTo as Timestamp)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$MealPerFieldToJson.createdAt(isNotEqualTo as Timestamp)
            : null,
        isLessThan: isLessThan != null
            ? _$MealPerFieldToJson.createdAt(isLessThan as Timestamp)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MealPerFieldToJson.createdAt(isLessThanOrEqualTo as Timestamp)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MealPerFieldToJson.createdAt(isGreaterThan as Timestamp)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MealPerFieldToJson
                .createdAt(isGreaterThanOrEqualTo as Timestamp)
            : null,
        whereIn: whereIn?.map((e) => _$MealPerFieldToJson.createdAt(e)),
        whereNotIn: whereNotIn?.map((e) => _$MealPerFieldToJson.createdAt(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MealQuery whereIngredientsIdsWithQuantity({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Map<int, String>>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MealFieldMap['ingredientsIdsWithQuantity']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$MealPerFieldToJson
                .ingredientsIdsWithQuantity(isEqualTo as List<Map<int, String>>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$MealPerFieldToJson.ingredientsIdsWithQuantity(
                isNotEqualTo as List<Map<int, String>>)
            : null,
        isLessThan: isLessThan != null
            ? _$MealPerFieldToJson.ingredientsIdsWithQuantity(
                isLessThan as List<Map<int, String>>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MealPerFieldToJson.ingredientsIdsWithQuantity(
                isLessThanOrEqualTo as List<Map<int, String>>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MealPerFieldToJson.ingredientsIdsWithQuantity(
                isGreaterThan as List<Map<int, String>>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MealPerFieldToJson.ingredientsIdsWithQuantity(
                isGreaterThanOrEqualTo as List<Map<int, String>>)
            : null,
        arrayContains: arrayContains != null
            ? (_$MealPerFieldToJson.ingredientsIdsWithQuantity(
                    [arrayContains as Map<int, String>]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$MealPerFieldToJson.ingredientsIdsWithQuantity(arrayContainsAny)
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
  MealQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
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

    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MealQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
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

    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MealQuery orderByImage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$MealFieldMap['image']!,
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

    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MealQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$MealFieldMap['name']!,
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

    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MealQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$MealFieldMap['createdAt']!,
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

    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MealQuery orderByIngredientsIdsWithQuantity({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MealDocumentSnapshot? startAtDocument,
    MealDocumentSnapshot? endAtDocument,
    MealDocumentSnapshot? endBeforeDocument,
    MealDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$MealFieldMap['ingredientsIdsWithQuantity']!,
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

    return _$MealQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$MealQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MealDocumentSnapshot extends FirestoreDocumentSnapshot<Meal> {
  MealDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Meal> snapshot;

  @override
  MealDocumentReference get reference {
    return MealDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Meal? data;
}

class MealQuerySnapshot
    extends FirestoreQuerySnapshot<Meal, MealQueryDocumentSnapshot> {
  MealQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory MealQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Meal> snapshot,
  ) {
    final docs = snapshot.docs.map(MealQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        MealDocumentSnapshot._,
      );
    }).toList();

    return MealQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<MealDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    MealDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<MealDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Meal> snapshot;

  @override
  final List<MealQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MealDocumentSnapshot>> docChanges;
}

class MealQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Meal>
    implements MealDocumentSnapshot {
  MealQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Meal> snapshot;

  @override
  final Meal data;

  @override
  MealDocumentReference get reference {
    return MealDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      id: json['id'] as String,
      image: Uri.parse(json['image'] as String),
      name: json['name'] as String,
      createdAt: const FirestoreTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
      ingredientsIdsWithQuantity:
          (json['ingredientsIdsWithQuantity'] as List<dynamic>)
              .map((e) => (e as Map<String, dynamic>).map(
                    (k, e) => MapEntry(int.parse(k), e as String),
                  ))
              .toList(),
    );

const _$MealFieldMap = <String, String>{
  'id': 'id',
  'image': 'image',
  'name': 'name',
  'createdAt': 'createdAt',
  'ingredientsIdsWithQuantity': 'ingredientsIdsWithQuantity',
};

// ignore: unused_element
abstract class _$MealPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? image(Uri instance) => instance.toString();
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? createdAt(Timestamp instance) =>
      const FirestoreTimestampConverter().toJson(instance);
  // ignore: unused_element
  static Object? ingredientsIdsWithQuantity(List<Map<int, String>> instance) =>
      instance.map((e) => e.map((k, e) => MapEntry(k.toString(), e))).toList();
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image.toString(),
      'name': instance.name,
      'createdAt':
          const FirestoreTimestampConverter().toJson(instance.createdAt),
      'ingredientsIdsWithQuantity': instance.ingredientsIdsWithQuantity
          .map((e) => e.map((k, e) => MapEntry(k.toString(), e)))
          .toList(),
    };
