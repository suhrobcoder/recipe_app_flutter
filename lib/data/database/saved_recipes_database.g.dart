// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_recipes_database.dart';

// ignore_for_file: type=lint
class $RecipesTable extends Recipes with TableInfo<$RecipesTable, RecipeTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _vegetarianMeta =
      const VerificationMeta('vegetarian');
  @override
  late final GeneratedColumn<bool> vegetarian =
      GeneratedColumn<bool>('vegetarian', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("vegetarian" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _readyInMinutesMeta =
      const VerificationMeta('readyInMinutes');
  @override
  late final GeneratedColumn<int> readyInMinutes = GeneratedColumn<int>(
      'ready_in_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _instructionsMeta =
      const VerificationMeta('instructions');
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
      'instructions', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cuisinesMeta =
      const VerificationMeta('cuisines');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> cuisines =
      GeneratedColumn<String>('cuisines', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($RecipesTable.$convertercuisines);
  static const VerificationMeta _dietsMeta = const VerificationMeta('diets');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> diets =
      GeneratedColumn<String>('diets', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($RecipesTable.$converterdiets);
  static const VerificationMeta _servingsMeta =
      const VerificationMeta('servings');
  @override
  late final GeneratedColumn<int> servings = GeneratedColumn<int>(
      'servings', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        summary,
        image,
        vegetarian,
        readyInMinutes,
        instructions,
        cuisines,
        diets,
        servings
      ];
  @override
  String get aliasedName => _alias ?? 'recipes';
  @override
  String get actualTableName => 'recipes';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('vegetarian')) {
      context.handle(
          _vegetarianMeta,
          vegetarian.isAcceptableOrUnknown(
              data['vegetarian']!, _vegetarianMeta));
    } else if (isInserting) {
      context.missing(_vegetarianMeta);
    }
    if (data.containsKey('ready_in_minutes')) {
      context.handle(
          _readyInMinutesMeta,
          readyInMinutes.isAcceptableOrUnknown(
              data['ready_in_minutes']!, _readyInMinutesMeta));
    }
    if (data.containsKey('instructions')) {
      context.handle(
          _instructionsMeta,
          instructions.isAcceptableOrUnknown(
              data['instructions']!, _instructionsMeta));
    }
    context.handle(_cuisinesMeta, const VerificationResult.success());
    context.handle(_dietsMeta, const VerificationResult.success());
    if (data.containsKey('servings')) {
      context.handle(_servingsMeta,
          servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta));
    } else if (isInserting) {
      context.missing(_servingsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      vegetarian: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}vegetarian'])!,
      readyInMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ready_in_minutes']),
      instructions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}instructions']),
      cuisines: $RecipesTable.$convertercuisines.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cuisines'])!),
      diets: $RecipesTable.$converterdiets.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}diets'])!),
      servings: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}servings'])!,
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertercuisines =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterdiets =
      const StringListConverter();
}

class RecipeTable extends DataClass implements Insertable<RecipeTable> {
  final int id;
  final String title;
  final String summary;
  final String? image;
  final bool vegetarian;
  final int? readyInMinutes;
  final String? instructions;
  final List<String> cuisines;
  final List<String> diets;
  final int servings;
  const RecipeTable(
      {required this.id,
      required this.title,
      required this.summary,
      this.image,
      required this.vegetarian,
      this.readyInMinutes,
      this.instructions,
      required this.cuisines,
      required this.diets,
      required this.servings});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['summary'] = Variable<String>(summary);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['vegetarian'] = Variable<bool>(vegetarian);
    if (!nullToAbsent || readyInMinutes != null) {
      map['ready_in_minutes'] = Variable<int>(readyInMinutes);
    }
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    {
      final converter = $RecipesTable.$convertercuisines;
      map['cuisines'] = Variable<String>(converter.toSql(cuisines));
    }
    {
      final converter = $RecipesTable.$converterdiets;
      map['diets'] = Variable<String>(converter.toSql(diets));
    }
    map['servings'] = Variable<int>(servings);
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      title: Value(title),
      summary: Value(summary),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      vegetarian: Value(vegetarian),
      readyInMinutes: readyInMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(readyInMinutes),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
      cuisines: Value(cuisines),
      diets: Value(diets),
      servings: Value(servings),
    );
  }

  factory RecipeTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeTable(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      summary: serializer.fromJson<String>(json['summary']),
      image: serializer.fromJson<String?>(json['image']),
      vegetarian: serializer.fromJson<bool>(json['vegetarian']),
      readyInMinutes: serializer.fromJson<int?>(json['readyInMinutes']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      cuisines: serializer.fromJson<List<String>>(json['cuisines']),
      diets: serializer.fromJson<List<String>>(json['diets']),
      servings: serializer.fromJson<int>(json['servings']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'summary': serializer.toJson<String>(summary),
      'image': serializer.toJson<String?>(image),
      'vegetarian': serializer.toJson<bool>(vegetarian),
      'readyInMinutes': serializer.toJson<int?>(readyInMinutes),
      'instructions': serializer.toJson<String?>(instructions),
      'cuisines': serializer.toJson<List<String>>(cuisines),
      'diets': serializer.toJson<List<String>>(diets),
      'servings': serializer.toJson<int>(servings),
    };
  }

  RecipeTable copyWith(
          {int? id,
          String? title,
          String? summary,
          Value<String?> image = const Value.absent(),
          bool? vegetarian,
          Value<int?> readyInMinutes = const Value.absent(),
          Value<String?> instructions = const Value.absent(),
          List<String>? cuisines,
          List<String>? diets,
          int? servings}) =>
      RecipeTable(
        id: id ?? this.id,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        image: image.present ? image.value : this.image,
        vegetarian: vegetarian ?? this.vegetarian,
        readyInMinutes:
            readyInMinutes.present ? readyInMinutes.value : this.readyInMinutes,
        instructions:
            instructions.present ? instructions.value : this.instructions,
        cuisines: cuisines ?? this.cuisines,
        diets: diets ?? this.diets,
        servings: servings ?? this.servings,
      );
  @override
  String toString() {
    return (StringBuffer('RecipeTable(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('image: $image, ')
          ..write('vegetarian: $vegetarian, ')
          ..write('readyInMinutes: $readyInMinutes, ')
          ..write('instructions: $instructions, ')
          ..write('cuisines: $cuisines, ')
          ..write('diets: $diets, ')
          ..write('servings: $servings')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, summary, image, vegetarian,
      readyInMinutes, instructions, cuisines, diets, servings);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeTable &&
          other.id == this.id &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.image == this.image &&
          other.vegetarian == this.vegetarian &&
          other.readyInMinutes == this.readyInMinutes &&
          other.instructions == this.instructions &&
          other.cuisines == this.cuisines &&
          other.diets == this.diets &&
          other.servings == this.servings);
}

class RecipesCompanion extends UpdateCompanion<RecipeTable> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> summary;
  final Value<String?> image;
  final Value<bool> vegetarian;
  final Value<int?> readyInMinutes;
  final Value<String?> instructions;
  final Value<List<String>> cuisines;
  final Value<List<String>> diets;
  final Value<int> servings;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.image = const Value.absent(),
    this.vegetarian = const Value.absent(),
    this.readyInMinutes = const Value.absent(),
    this.instructions = const Value.absent(),
    this.cuisines = const Value.absent(),
    this.diets = const Value.absent(),
    this.servings = const Value.absent(),
  });
  RecipesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String summary,
    this.image = const Value.absent(),
    required bool vegetarian,
    this.readyInMinutes = const Value.absent(),
    this.instructions = const Value.absent(),
    required List<String> cuisines,
    required List<String> diets,
    required int servings,
  })  : title = Value(title),
        summary = Value(summary),
        vegetarian = Value(vegetarian),
        cuisines = Value(cuisines),
        diets = Value(diets),
        servings = Value(servings);
  static Insertable<RecipeTable> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? summary,
    Expression<String>? image,
    Expression<bool>? vegetarian,
    Expression<int>? readyInMinutes,
    Expression<String>? instructions,
    Expression<String>? cuisines,
    Expression<String>? diets,
    Expression<int>? servings,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (summary != null) 'summary': summary,
      if (image != null) 'image': image,
      if (vegetarian != null) 'vegetarian': vegetarian,
      if (readyInMinutes != null) 'ready_in_minutes': readyInMinutes,
      if (instructions != null) 'instructions': instructions,
      if (cuisines != null) 'cuisines': cuisines,
      if (diets != null) 'diets': diets,
      if (servings != null) 'servings': servings,
    });
  }

  RecipesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? summary,
      Value<String?>? image,
      Value<bool>? vegetarian,
      Value<int?>? readyInMinutes,
      Value<String?>? instructions,
      Value<List<String>>? cuisines,
      Value<List<String>>? diets,
      Value<int>? servings}) {
    return RecipesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      image: image ?? this.image,
      vegetarian: vegetarian ?? this.vegetarian,
      readyInMinutes: readyInMinutes ?? this.readyInMinutes,
      instructions: instructions ?? this.instructions,
      cuisines: cuisines ?? this.cuisines,
      diets: diets ?? this.diets,
      servings: servings ?? this.servings,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (vegetarian.present) {
      map['vegetarian'] = Variable<bool>(vegetarian.value);
    }
    if (readyInMinutes.present) {
      map['ready_in_minutes'] = Variable<int>(readyInMinutes.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (cuisines.present) {
      final converter = $RecipesTable.$convertercuisines;
      map['cuisines'] = Variable<String>(converter.toSql(cuisines.value));
    }
    if (diets.present) {
      final converter = $RecipesTable.$converterdiets;
      map['diets'] = Variable<String>(converter.toSql(diets.value));
    }
    if (servings.present) {
      map['servings'] = Variable<int>(servings.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('image: $image, ')
          ..write('vegetarian: $vegetarian, ')
          ..write('readyInMinutes: $readyInMinutes, ')
          ..write('instructions: $instructions, ')
          ..write('cuisines: $cuisines, ')
          ..write('diets: $diets, ')
          ..write('servings: $servings')
          ..write(')'))
        .toString();
  }
}

class $EquipmentsTable extends Equipments
    with TableInfo<$EquipmentsTable, EquipmentTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, image];
  @override
  String get aliasedName => _alias ?? 'equipments';
  @override
  String get actualTableName => 'equipments';
  @override
  VerificationContext validateIntegrity(Insertable<EquipmentTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EquipmentTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
    );
  }

  @override
  $EquipmentsTable createAlias(String alias) {
    return $EquipmentsTable(attachedDatabase, alias);
  }
}

class EquipmentTable extends DataClass implements Insertable<EquipmentTable> {
  final int id;
  final String name;
  final String? image;
  const EquipmentTable({required this.id, required this.name, this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    return map;
  }

  EquipmentsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentsCompanion(
      id: Value(id),
      name: Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory EquipmentTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String?>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String?>(image),
    };
  }

  EquipmentTable copyWith(
          {int? id,
          String? name,
          Value<String?> image = const Value.absent()}) =>
      EquipmentTable(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image.present ? image.value : this.image,
      );
  @override
  String toString() {
    return (StringBuffer('EquipmentTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image);
}

class EquipmentsCompanion extends UpdateCompanion<EquipmentTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> image;
  const EquipmentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
  });
  EquipmentsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.image = const Value.absent(),
  }) : name = Value(name);
  static Insertable<EquipmentTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
    });
  }

  EquipmentsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String?>? image}) {
    return EquipmentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $IngredientsTable extends Ingredients
    with TableInfo<$IngredientsTable, IngredientTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, image];
  @override
  String get aliasedName => _alias ?? 'ingredients';
  @override
  String get actualTableName => 'ingredients';
  @override
  VerificationContext validateIntegrity(Insertable<IngredientTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IngredientTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
    );
  }

  @override
  $IngredientsTable createAlias(String alias) {
    return $IngredientsTable(attachedDatabase, alias);
  }
}

class IngredientTable extends DataClass implements Insertable<IngredientTable> {
  final int id;
  final String name;
  final String? image;
  const IngredientTable({required this.id, required this.name, this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    return map;
  }

  IngredientsCompanion toCompanion(bool nullToAbsent) {
    return IngredientsCompanion(
      id: Value(id),
      name: Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory IngredientTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String?>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String?>(image),
    };
  }

  IngredientTable copyWith(
          {int? id,
          String? name,
          Value<String?> image = const Value.absent()}) =>
      IngredientTable(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image.present ? image.value : this.image,
      );
  @override
  String toString() {
    return (StringBuffer('IngredientTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image);
}

class IngredientsCompanion extends UpdateCompanion<IngredientTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> image;
  const IngredientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
  });
  IngredientsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.image = const Value.absent(),
  }) : name = Value(name);
  static Insertable<IngredientTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
    });
  }

  IngredientsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String?>? image}) {
    return IngredientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $InstructionStepsTable extends InstructionSteps
    with TableInfo<$InstructionStepsTable, InstructionStepTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InstructionStepsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
      'number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stepMeta = const VerificationMeta('step');
  @override
  late final GeneratedColumn<String> step = GeneratedColumn<String>(
      'step', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, recipeId, number, step];
  @override
  String get aliasedName => _alias ?? 'instruction_steps';
  @override
  String get actualTableName => 'instruction_steps';
  @override
  VerificationContext validateIntegrity(
      Insertable<InstructionStepTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('step')) {
      context.handle(
          _stepMeta, step.isAcceptableOrUnknown(data['step']!, _stepMeta));
    } else if (isInserting) {
      context.missing(_stepMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InstructionStepTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InstructionStepTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}recipe_id'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number'])!,
      step: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}step'])!,
    );
  }

  @override
  $InstructionStepsTable createAlias(String alias) {
    return $InstructionStepsTable(attachedDatabase, alias);
  }
}

class InstructionStepTable extends DataClass
    implements Insertable<InstructionStepTable> {
  final int id;
  final int recipeId;
  final int number;
  final String step;
  const InstructionStepTable(
      {required this.id,
      required this.recipeId,
      required this.number,
      required this.step});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['number'] = Variable<int>(number);
    map['step'] = Variable<String>(step);
    return map;
  }

  InstructionStepsCompanion toCompanion(bool nullToAbsent) {
    return InstructionStepsCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      number: Value(number),
      step: Value(step),
    );
  }

  factory InstructionStepTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InstructionStepTable(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      number: serializer.fromJson<int>(json['number']),
      step: serializer.fromJson<String>(json['step']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'number': serializer.toJson<int>(number),
      'step': serializer.toJson<String>(step),
    };
  }

  InstructionStepTable copyWith(
          {int? id, int? recipeId, int? number, String? step}) =>
      InstructionStepTable(
        id: id ?? this.id,
        recipeId: recipeId ?? this.recipeId,
        number: number ?? this.number,
        step: step ?? this.step,
      );
  @override
  String toString() {
    return (StringBuffer('InstructionStepTable(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('number: $number, ')
          ..write('step: $step')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recipeId, number, step);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstructionStepTable &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.number == this.number &&
          other.step == this.step);
}

class InstructionStepsCompanion extends UpdateCompanion<InstructionStepTable> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<int> number;
  final Value<String> step;
  const InstructionStepsCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.number = const Value.absent(),
    this.step = const Value.absent(),
  });
  InstructionStepsCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required int number,
    required String step,
  })  : recipeId = Value(recipeId),
        number = Value(number),
        step = Value(step);
  static Insertable<InstructionStepTable> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<int>? number,
    Expression<String>? step,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (number != null) 'number': number,
      if (step != null) 'step': step,
    });
  }

  InstructionStepsCompanion copyWith(
      {Value<int>? id,
      Value<int>? recipeId,
      Value<int>? number,
      Value<String>? step}) {
    return InstructionStepsCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      number: number ?? this.number,
      step: step ?? this.step,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (step.present) {
      map['step'] = Variable<String>(step.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InstructionStepsCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('number: $number, ')
          ..write('step: $step')
          ..write(')'))
        .toString();
  }
}

class $InstructionStepEquipmentRelationTable
    extends InstructionStepEquipmentRelation
    with
        TableInfo<$InstructionStepEquipmentRelationTable,
            InstructionStepEquipmentRelationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InstructionStepEquipmentRelationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _instructionStepIdMeta =
      const VerificationMeta('instructionStepId');
  @override
  late final GeneratedColumn<int> instructionStepId = GeneratedColumn<int>(
      'instruction_step_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES instruction_steps (id)'));
  static const VerificationMeta _equipmentIdMeta =
      const VerificationMeta('equipmentId');
  @override
  late final GeneratedColumn<int> equipmentId = GeneratedColumn<int>(
      'equipment_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES equipments (id)'));
  @override
  List<GeneratedColumn> get $columns => [instructionStepId, equipmentId];
  @override
  String get aliasedName => _alias ?? 'instruction_step_equipment_relation';
  @override
  String get actualTableName => 'instruction_step_equipment_relation';
  @override
  VerificationContext validateIntegrity(
      Insertable<InstructionStepEquipmentRelationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('instruction_step_id')) {
      context.handle(
          _instructionStepIdMeta,
          instructionStepId.isAcceptableOrUnknown(
              data['instruction_step_id']!, _instructionStepIdMeta));
    } else if (isInserting) {
      context.missing(_instructionStepIdMeta);
    }
    if (data.containsKey('equipment_id')) {
      context.handle(
          _equipmentIdMeta,
          equipmentId.isAcceptableOrUnknown(
              data['equipment_id']!, _equipmentIdMeta));
    } else if (isInserting) {
      context.missing(_equipmentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  InstructionStepEquipmentRelationData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InstructionStepEquipmentRelationData(
      instructionStepId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}instruction_step_id'])!,
      equipmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}equipment_id'])!,
    );
  }

  @override
  $InstructionStepEquipmentRelationTable createAlias(String alias) {
    return $InstructionStepEquipmentRelationTable(attachedDatabase, alias);
  }
}

class InstructionStepEquipmentRelationData extends DataClass
    implements Insertable<InstructionStepEquipmentRelationData> {
  final int instructionStepId;
  final int equipmentId;
  const InstructionStepEquipmentRelationData(
      {required this.instructionStepId, required this.equipmentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['instruction_step_id'] = Variable<int>(instructionStepId);
    map['equipment_id'] = Variable<int>(equipmentId);
    return map;
  }

  InstructionStepEquipmentRelationCompanion toCompanion(bool nullToAbsent) {
    return InstructionStepEquipmentRelationCompanion(
      instructionStepId: Value(instructionStepId),
      equipmentId: Value(equipmentId),
    );
  }

  factory InstructionStepEquipmentRelationData.fromJson(
      Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InstructionStepEquipmentRelationData(
      instructionStepId: serializer.fromJson<int>(json['instructionStepId']),
      equipmentId: serializer.fromJson<int>(json['equipmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'instructionStepId': serializer.toJson<int>(instructionStepId),
      'equipmentId': serializer.toJson<int>(equipmentId),
    };
  }

  InstructionStepEquipmentRelationData copyWith(
          {int? instructionStepId, int? equipmentId}) =>
      InstructionStepEquipmentRelationData(
        instructionStepId: instructionStepId ?? this.instructionStepId,
        equipmentId: equipmentId ?? this.equipmentId,
      );
  @override
  String toString() {
    return (StringBuffer('InstructionStepEquipmentRelationData(')
          ..write('instructionStepId: $instructionStepId, ')
          ..write('equipmentId: $equipmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(instructionStepId, equipmentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstructionStepEquipmentRelationData &&
          other.instructionStepId == this.instructionStepId &&
          other.equipmentId == this.equipmentId);
}

class InstructionStepEquipmentRelationCompanion
    extends UpdateCompanion<InstructionStepEquipmentRelationData> {
  final Value<int> instructionStepId;
  final Value<int> equipmentId;
  final Value<int> rowid;
  const InstructionStepEquipmentRelationCompanion({
    this.instructionStepId = const Value.absent(),
    this.equipmentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InstructionStepEquipmentRelationCompanion.insert({
    required int instructionStepId,
    required int equipmentId,
    this.rowid = const Value.absent(),
  })  : instructionStepId = Value(instructionStepId),
        equipmentId = Value(equipmentId);
  static Insertable<InstructionStepEquipmentRelationData> custom({
    Expression<int>? instructionStepId,
    Expression<int>? equipmentId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (instructionStepId != null) 'instruction_step_id': instructionStepId,
      if (equipmentId != null) 'equipment_id': equipmentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InstructionStepEquipmentRelationCompanion copyWith(
      {Value<int>? instructionStepId,
      Value<int>? equipmentId,
      Value<int>? rowid}) {
    return InstructionStepEquipmentRelationCompanion(
      instructionStepId: instructionStepId ?? this.instructionStepId,
      equipmentId: equipmentId ?? this.equipmentId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (instructionStepId.present) {
      map['instruction_step_id'] = Variable<int>(instructionStepId.value);
    }
    if (equipmentId.present) {
      map['equipment_id'] = Variable<int>(equipmentId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InstructionStepEquipmentRelationCompanion(')
          ..write('instructionStepId: $instructionStepId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InstructionStepIngredientRelationTable
    extends InstructionStepIngredientRelation
    with
        TableInfo<$InstructionStepIngredientRelationTable,
            InstructionStepIngredientRelationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InstructionStepIngredientRelationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _instructionStepIdMeta =
      const VerificationMeta('instructionStepId');
  @override
  late final GeneratedColumn<int> instructionStepId = GeneratedColumn<int>(
      'instruction_step_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES instruction_steps (id)'));
  static const VerificationMeta _ingredientIdMeta =
      const VerificationMeta('ingredientId');
  @override
  late final GeneratedColumn<int> ingredientId = GeneratedColumn<int>(
      'ingredient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES ingredients (id)'));
  @override
  List<GeneratedColumn> get $columns => [instructionStepId, ingredientId];
  @override
  String get aliasedName => _alias ?? 'instruction_step_ingredient_relation';
  @override
  String get actualTableName => 'instruction_step_ingredient_relation';
  @override
  VerificationContext validateIntegrity(
      Insertable<InstructionStepIngredientRelationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('instruction_step_id')) {
      context.handle(
          _instructionStepIdMeta,
          instructionStepId.isAcceptableOrUnknown(
              data['instruction_step_id']!, _instructionStepIdMeta));
    } else if (isInserting) {
      context.missing(_instructionStepIdMeta);
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
          _ingredientIdMeta,
          ingredientId.isAcceptableOrUnknown(
              data['ingredient_id']!, _ingredientIdMeta));
    } else if (isInserting) {
      context.missing(_ingredientIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  InstructionStepIngredientRelationData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InstructionStepIngredientRelationData(
      instructionStepId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}instruction_step_id'])!,
      ingredientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ingredient_id'])!,
    );
  }

  @override
  $InstructionStepIngredientRelationTable createAlias(String alias) {
    return $InstructionStepIngredientRelationTable(attachedDatabase, alias);
  }
}

class InstructionStepIngredientRelationData extends DataClass
    implements Insertable<InstructionStepIngredientRelationData> {
  final int instructionStepId;
  final int ingredientId;
  const InstructionStepIngredientRelationData(
      {required this.instructionStepId, required this.ingredientId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['instruction_step_id'] = Variable<int>(instructionStepId);
    map['ingredient_id'] = Variable<int>(ingredientId);
    return map;
  }

  InstructionStepIngredientRelationCompanion toCompanion(bool nullToAbsent) {
    return InstructionStepIngredientRelationCompanion(
      instructionStepId: Value(instructionStepId),
      ingredientId: Value(ingredientId),
    );
  }

  factory InstructionStepIngredientRelationData.fromJson(
      Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InstructionStepIngredientRelationData(
      instructionStepId: serializer.fromJson<int>(json['instructionStepId']),
      ingredientId: serializer.fromJson<int>(json['ingredientId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'instructionStepId': serializer.toJson<int>(instructionStepId),
      'ingredientId': serializer.toJson<int>(ingredientId),
    };
  }

  InstructionStepIngredientRelationData copyWith(
          {int? instructionStepId, int? ingredientId}) =>
      InstructionStepIngredientRelationData(
        instructionStepId: instructionStepId ?? this.instructionStepId,
        ingredientId: ingredientId ?? this.ingredientId,
      );
  @override
  String toString() {
    return (StringBuffer('InstructionStepIngredientRelationData(')
          ..write('instructionStepId: $instructionStepId, ')
          ..write('ingredientId: $ingredientId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(instructionStepId, ingredientId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstructionStepIngredientRelationData &&
          other.instructionStepId == this.instructionStepId &&
          other.ingredientId == this.ingredientId);
}

class InstructionStepIngredientRelationCompanion
    extends UpdateCompanion<InstructionStepIngredientRelationData> {
  final Value<int> instructionStepId;
  final Value<int> ingredientId;
  final Value<int> rowid;
  const InstructionStepIngredientRelationCompanion({
    this.instructionStepId = const Value.absent(),
    this.ingredientId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InstructionStepIngredientRelationCompanion.insert({
    required int instructionStepId,
    required int ingredientId,
    this.rowid = const Value.absent(),
  })  : instructionStepId = Value(instructionStepId),
        ingredientId = Value(ingredientId);
  static Insertable<InstructionStepIngredientRelationData> custom({
    Expression<int>? instructionStepId,
    Expression<int>? ingredientId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (instructionStepId != null) 'instruction_step_id': instructionStepId,
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InstructionStepIngredientRelationCompanion copyWith(
      {Value<int>? instructionStepId,
      Value<int>? ingredientId,
      Value<int>? rowid}) {
    return InstructionStepIngredientRelationCompanion(
      instructionStepId: instructionStepId ?? this.instructionStepId,
      ingredientId: ingredientId ?? this.ingredientId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (instructionStepId.present) {
      map['instruction_step_id'] = Variable<int>(instructionStepId.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<int>(ingredientId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InstructionStepIngredientRelationCompanion(')
          ..write('instructionStepId: $instructionStepId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$SavedRecipesDatabase extends GeneratedDatabase {
  _$SavedRecipesDatabase(QueryExecutor e) : super(e);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $EquipmentsTable equipments = $EquipmentsTable(this);
  late final $IngredientsTable ingredients = $IngredientsTable(this);
  late final $InstructionStepsTable instructionSteps =
      $InstructionStepsTable(this);
  late final $InstructionStepEquipmentRelationTable
      instructionStepEquipmentRelation =
      $InstructionStepEquipmentRelationTable(this);
  late final $InstructionStepIngredientRelationTable
      instructionStepIngredientRelation =
      $InstructionStepIngredientRelationTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        recipes,
        equipments,
        ingredients,
        instructionSteps,
        instructionStepEquipmentRelation,
        instructionStepIngredientRelation
      ];
}
