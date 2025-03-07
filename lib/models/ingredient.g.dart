// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

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
abstract class IngredientCollectionReference
    implements
        IngredientQuery,
        FirestoreCollectionReference<Ingredient, IngredientQuerySnapshot> {
  factory IngredientCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$IngredientCollectionReference;

  static Ingredient fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$IngredientFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Ingredient value,
    SetOptions? options,
  ) {
    return {..._$IngredientToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Ingredient> get reference;

  @override
  IngredientDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<IngredientDocumentReference> add(Ingredient value);
}

class _$IngredientCollectionReference extends _$IngredientQuery
    implements IngredientCollectionReference {
  factory _$IngredientCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$IngredientCollectionReference._(
      firestore.collection('ingredients').withConverter(
            fromFirestore: IngredientCollectionReference.fromFirestore,
            toFirestore: IngredientCollectionReference.toFirestore,
          ),
    );
  }

  _$IngredientCollectionReference._(
    CollectionReference<Ingredient> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Ingredient> get reference =>
      super.reference as CollectionReference<Ingredient>;

  @override
  IngredientDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return IngredientDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<IngredientDocumentReference> add(Ingredient value) {
    return reference.add(value).then((ref) => IngredientDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$IngredientCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class IngredientDocumentReference
    extends FirestoreDocumentReference<Ingredient, IngredientDocumentSnapshot> {
  factory IngredientDocumentReference(DocumentReference<Ingredient> reference) =
      _$IngredientDocumentReference;

  DocumentReference<Ingredient> get reference;

  /// A reference to the [IngredientCollectionReference] containing this document.
  IngredientCollectionReference get parent {
    return _$IngredientCollectionReference(reference.firestore);
  }

  @override
  Stream<IngredientDocumentSnapshot> snapshots();

  @override
  Future<IngredientDocumentSnapshot> get([GetOptions? options]);

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
    Ingredient model, {
    SetOptions? options,
    FieldValue nameFieldValue,
    FieldValue unitFieldValue,
    FieldValue caloriesPer100FieldValue,
    FieldValue imageUrlFieldValue,
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
    Ingredient model, {
    SetOptions? options,
    FieldValue nameFieldValue,
    FieldValue unitFieldValue,
    FieldValue caloriesPer100FieldValue,
    FieldValue imageUrlFieldValue,
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
    Ingredient model, {
    SetOptions? options,
    FieldValue nameFieldValue,
    FieldValue unitFieldValue,
    FieldValue caloriesPer100FieldValue,
    FieldValue imageUrlFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    String unit,
    FieldValue unitFieldValue,
    double caloriesPer100,
    FieldValue caloriesPer100FieldValue,
    String imageUrl,
    FieldValue imageUrlFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    String unit,
    FieldValue unitFieldValue,
    double caloriesPer100,
    FieldValue caloriesPer100FieldValue,
    String imageUrl,
    FieldValue imageUrlFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String name,
    FieldValue nameFieldValue,
    String unit,
    FieldValue unitFieldValue,
    double caloriesPer100,
    FieldValue caloriesPer100FieldValue,
    String imageUrl,
    FieldValue imageUrlFieldValue,
  });
}

class _$IngredientDocumentReference
    extends FirestoreDocumentReference<Ingredient, IngredientDocumentSnapshot>
    implements IngredientDocumentReference {
  _$IngredientDocumentReference(this.reference);

  @override
  final DocumentReference<Ingredient> reference;

  /// A reference to the [IngredientCollectionReference] containing this document.
  IngredientCollectionReference get parent {
    return _$IngredientCollectionReference(reference.firestore);
  }

  @override
  Stream<IngredientDocumentSnapshot> snapshots() {
    return reference.snapshots().map(IngredientDocumentSnapshot._);
  }

  @override
  Future<IngredientDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(IngredientDocumentSnapshot._);
  }

  @override
  Future<IngredientDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(IngredientDocumentSnapshot._);
  }

  Future<void> set(
    Ingredient model, {
    SetOptions? options,
    FieldValue? nameFieldValue,
    FieldValue? unitFieldValue,
    FieldValue? caloriesPer100FieldValue,
    FieldValue? imageUrlFieldValue,
  }) async {
    final json = {
      ..._$IngredientToJson(model),
      if (nameFieldValue != null) _$IngredientFieldMap['name']!: nameFieldValue,
      if (unitFieldValue != null) _$IngredientFieldMap['unit']!: unitFieldValue,
      if (caloriesPer100FieldValue != null)
        _$IngredientFieldMap['caloriesPer100']!: caloriesPer100FieldValue,
      if (imageUrlFieldValue != null)
        _$IngredientFieldMap['imageUrl']!: imageUrlFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    Ingredient model, {
    SetOptions? options,
    FieldValue? nameFieldValue,
    FieldValue? unitFieldValue,
    FieldValue? caloriesPer100FieldValue,
    FieldValue? imageUrlFieldValue,
  }) {
    final json = {
      ..._$IngredientToJson(model),
      if (nameFieldValue != null) _$IngredientFieldMap['name']!: nameFieldValue,
      if (unitFieldValue != null) _$IngredientFieldMap['unit']!: unitFieldValue,
      if (caloriesPer100FieldValue != null)
        _$IngredientFieldMap['caloriesPer100']!: caloriesPer100FieldValue,
      if (imageUrlFieldValue != null)
        _$IngredientFieldMap['imageUrl']!: imageUrlFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    Ingredient model, {
    SetOptions? options,
    FieldValue? nameFieldValue,
    FieldValue? unitFieldValue,
    FieldValue? caloriesPer100FieldValue,
    FieldValue? imageUrlFieldValue,
  }) {
    final json = {
      ..._$IngredientToJson(model),
      if (nameFieldValue != null) _$IngredientFieldMap['name']!: nameFieldValue,
      if (unitFieldValue != null) _$IngredientFieldMap['unit']!: unitFieldValue,
      if (caloriesPer100FieldValue != null)
        _$IngredientFieldMap['caloriesPer100']!: caloriesPer100FieldValue,
      if (imageUrlFieldValue != null)
        _$IngredientFieldMap['imageUrl']!: imageUrlFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? unit = _sentinel,
    FieldValue? unitFieldValue,
    Object? caloriesPer100 = _sentinel,
    FieldValue? caloriesPer100FieldValue,
    Object? imageUrl = _sentinel,
    FieldValue? imageUrlFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      unit == _sentinel || unitFieldValue == null,
      "Cannot specify both unit and unitFieldValue",
    );
    assert(
      caloriesPer100 == _sentinel || caloriesPer100FieldValue == null,
      "Cannot specify both caloriesPer100 and caloriesPer100FieldValue",
    );
    assert(
      imageUrl == _sentinel || imageUrlFieldValue == null,
      "Cannot specify both imageUrl and imageUrlFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$IngredientFieldMap['name']!:
            _$IngredientPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$IngredientFieldMap['name']!: nameFieldValue,
      if (unit != _sentinel)
        _$IngredientFieldMap['unit']!:
            _$IngredientPerFieldToJson.unit(unit as String),
      if (unitFieldValue != null) _$IngredientFieldMap['unit']!: unitFieldValue,
      if (caloriesPer100 != _sentinel)
        _$IngredientFieldMap['caloriesPer100']!:
            _$IngredientPerFieldToJson.caloriesPer100(caloriesPer100 as double),
      if (caloriesPer100FieldValue != null)
        _$IngredientFieldMap['caloriesPer100']!: caloriesPer100FieldValue,
      if (imageUrl != _sentinel)
        _$IngredientFieldMap['imageUrl']!:
            _$IngredientPerFieldToJson.imageUrl(imageUrl as String),
      if (imageUrlFieldValue != null)
        _$IngredientFieldMap['imageUrl']!: imageUrlFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? unit = _sentinel,
    FieldValue? unitFieldValue,
    Object? caloriesPer100 = _sentinel,
    FieldValue? caloriesPer100FieldValue,
    Object? imageUrl = _sentinel,
    FieldValue? imageUrlFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      unit == _sentinel || unitFieldValue == null,
      "Cannot specify both unit and unitFieldValue",
    );
    assert(
      caloriesPer100 == _sentinel || caloriesPer100FieldValue == null,
      "Cannot specify both caloriesPer100 and caloriesPer100FieldValue",
    );
    assert(
      imageUrl == _sentinel || imageUrlFieldValue == null,
      "Cannot specify both imageUrl and imageUrlFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$IngredientFieldMap['name']!:
            _$IngredientPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$IngredientFieldMap['name']!: nameFieldValue,
      if (unit != _sentinel)
        _$IngredientFieldMap['unit']!:
            _$IngredientPerFieldToJson.unit(unit as String),
      if (unitFieldValue != null) _$IngredientFieldMap['unit']!: unitFieldValue,
      if (caloriesPer100 != _sentinel)
        _$IngredientFieldMap['caloriesPer100']!:
            _$IngredientPerFieldToJson.caloriesPer100(caloriesPer100 as double),
      if (caloriesPer100FieldValue != null)
        _$IngredientFieldMap['caloriesPer100']!: caloriesPer100FieldValue,
      if (imageUrl != _sentinel)
        _$IngredientFieldMap['imageUrl']!:
            _$IngredientPerFieldToJson.imageUrl(imageUrl as String),
      if (imageUrlFieldValue != null)
        _$IngredientFieldMap['imageUrl']!: imageUrlFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? unit = _sentinel,
    FieldValue? unitFieldValue,
    Object? caloriesPer100 = _sentinel,
    FieldValue? caloriesPer100FieldValue,
    Object? imageUrl = _sentinel,
    FieldValue? imageUrlFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      unit == _sentinel || unitFieldValue == null,
      "Cannot specify both unit and unitFieldValue",
    );
    assert(
      caloriesPer100 == _sentinel || caloriesPer100FieldValue == null,
      "Cannot specify both caloriesPer100 and caloriesPer100FieldValue",
    );
    assert(
      imageUrl == _sentinel || imageUrlFieldValue == null,
      "Cannot specify both imageUrl and imageUrlFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$IngredientFieldMap['name']!:
            _$IngredientPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$IngredientFieldMap['name']!: nameFieldValue,
      if (unit != _sentinel)
        _$IngredientFieldMap['unit']!:
            _$IngredientPerFieldToJson.unit(unit as String),
      if (unitFieldValue != null) _$IngredientFieldMap['unit']!: unitFieldValue,
      if (caloriesPer100 != _sentinel)
        _$IngredientFieldMap['caloriesPer100']!:
            _$IngredientPerFieldToJson.caloriesPer100(caloriesPer100 as double),
      if (caloriesPer100FieldValue != null)
        _$IngredientFieldMap['caloriesPer100']!: caloriesPer100FieldValue,
      if (imageUrl != _sentinel)
        _$IngredientFieldMap['imageUrl']!:
            _$IngredientPerFieldToJson.imageUrl(imageUrl as String),
      if (imageUrlFieldValue != null)
        _$IngredientFieldMap['imageUrl']!: imageUrlFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is IngredientDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class IngredientQuery
    implements QueryReference<Ingredient, IngredientQuerySnapshot> {
  @override
  IngredientQuery limit(int limit);

  @override
  IngredientQuery limitToLast(int limit);

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
  IngredientQuery whereFieldPath(
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

  IngredientQuery whereDocumentId({
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

  IngredientQuery whereName({
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

  IngredientQuery whereUnit({
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

  IngredientQuery whereCaloriesPer100({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    List<double>? whereIn,
    List<double>? whereNotIn,
    bool? isNull,
  });

  IngredientQuery whereImageUrl({
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
  IngredientQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  });

  IngredientQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  });

  IngredientQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  });

  IngredientQuery orderByUnit({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  });

  IngredientQuery orderByCaloriesPer100({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  });

  IngredientQuery orderByImageUrl({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  });
}

class _$IngredientQuery
    extends QueryReference<Ingredient, IngredientQuerySnapshot>
    implements IngredientQuery {
  _$IngredientQuery(
    this._collection, {
    required Query<Ingredient> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<IngredientQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(IngredientQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<IngredientQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(IngredientQuerySnapshot._fromQuerySnapshot);
  }

  @override
  IngredientQuery limit(int limit) {
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery limitToLast(int limit) {
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery whereFieldPath(
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
    return _$IngredientQuery(
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
  IngredientQuery whereDocumentId({
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
    return _$IngredientQuery(
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
  IngredientQuery whereName({
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
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$IngredientFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$IngredientPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$IngredientPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$IngredientPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$IngredientPerFieldToJson.name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$IngredientPerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$IngredientPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery whereUnit({
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
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$IngredientFieldMap['unit']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.unit(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.unit(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$IngredientPerFieldToJson.unit(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$IngredientPerFieldToJson.unit(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$IngredientPerFieldToJson.unit(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$IngredientPerFieldToJson.unit(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$IngredientPerFieldToJson.unit(e)),
        whereNotIn: whereNotIn?.map((e) => _$IngredientPerFieldToJson.unit(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery whereCaloriesPer100({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<double>? whereIn,
    List<double>? whereNotIn,
    bool? isNull,
  }) {
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$IngredientFieldMap['caloriesPer100']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.caloriesPer100(isEqualTo as double)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.caloriesPer100(isNotEqualTo as double)
            : null,
        isLessThan: isLessThan != null
            ? _$IngredientPerFieldToJson.caloriesPer100(isLessThan as double)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$IngredientPerFieldToJson
                .caloriesPer100(isLessThanOrEqualTo as double)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$IngredientPerFieldToJson.caloriesPer100(isGreaterThan as double)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$IngredientPerFieldToJson
                .caloriesPer100(isGreaterThanOrEqualTo as double)
            : null,
        whereIn:
            whereIn?.map((e) => _$IngredientPerFieldToJson.caloriesPer100(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$IngredientPerFieldToJson.caloriesPer100(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery whereImageUrl({
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
    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$IngredientFieldMap['imageUrl']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.imageUrl(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$IngredientPerFieldToJson.imageUrl(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$IngredientPerFieldToJson.imageUrl(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$IngredientPerFieldToJson.imageUrl(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$IngredientPerFieldToJson.imageUrl(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$IngredientPerFieldToJson
                .imageUrl(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$IngredientPerFieldToJson.imageUrl(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$IngredientPerFieldToJson.imageUrl(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  IngredientQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
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

    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  IngredientQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
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

    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  IngredientQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$IngredientFieldMap['name']!,
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

    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  IngredientQuery orderByUnit({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$IngredientFieldMap['unit']!,
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

    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  IngredientQuery orderByCaloriesPer100({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$IngredientFieldMap['caloriesPer100']!,
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

    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  IngredientQuery orderByImageUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IngredientDocumentSnapshot? startAtDocument,
    IngredientDocumentSnapshot? endAtDocument,
    IngredientDocumentSnapshot? endBeforeDocument,
    IngredientDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$IngredientFieldMap['imageUrl']!, descending: descending);
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

    return _$IngredientQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$IngredientQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class IngredientDocumentSnapshot extends FirestoreDocumentSnapshot<Ingredient> {
  IngredientDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Ingredient> snapshot;

  @override
  IngredientDocumentReference get reference {
    return IngredientDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Ingredient? data;
}

class IngredientQuerySnapshot extends FirestoreQuerySnapshot<Ingredient,
    IngredientQueryDocumentSnapshot> {
  IngredientQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory IngredientQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Ingredient> snapshot,
  ) {
    final docs = snapshot.docs.map(IngredientQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        IngredientDocumentSnapshot._,
      );
    }).toList();

    return IngredientQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<IngredientDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    IngredientDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<IngredientDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Ingredient> snapshot;

  @override
  final List<IngredientQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<IngredientDocumentSnapshot>> docChanges;
}

class IngredientQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Ingredient>
    implements IngredientDocumentSnapshot {
  IngredientQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Ingredient> snapshot;

  @override
  final Ingredient data;

  @override
  IngredientDocumentReference get reference {
    return IngredientDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      name: json['name'] as String,
      unit: json['unit'] as String,
      caloriesPer100: (json['caloriesPer100'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      id: json['id'] as String,
    );

const _$IngredientFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'unit': 'unit',
  'caloriesPer100': 'caloriesPer100',
  'imageUrl': 'imageUrl',
};

// ignore: unused_element
abstract class _$IngredientPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? unit(String instance) => instance;
  // ignore: unused_element
  static Object? caloriesPer100(double instance) => instance;
  // ignore: unused_element
  static Object? imageUrl(String instance) => instance;
}

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'caloriesPer100': instance.caloriesPer100,
      'imageUrl': instance.imageUrl,
    };
