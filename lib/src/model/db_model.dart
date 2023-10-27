import 'package:sqfentity_gen/sqfentity_gen.dart';
part 'db_model.g.dart';

const tableCategory = SqfEntityTable(
    tableName: 'products',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_unique,
    useSoftDeleting: true,
    modelName: null,
    fields: [
      SqfEntityField('title', DbType.text, isNotNull: true, isUnique: true),
      SqfEntityField('description', DbType.text),
      SqfEntityField('image_url', DbType.text),
      SqfEntityField(
        'selling_price',
        DbType.real,
        isNotNull: true,
      ),
      SqfEntityField(
        'cost_price',
        DbType.real,
        isNotNull: true,
      ),
      SqfEntityField(
        'quantity',
        DbType.integer,
        isNotNull: true,
      ),
      SqfEntityField(
        'created_at',
        DbType.time,
        isNotNull: true,
      ),
      SqfEntityField(
        'updated_at',
        DbType.time,
        isNotNull: true,
      ),
    ]);
@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
    modelName: 'MyProductManager',
    databaseName: 'product_manager.db',
    databaseTables: [tableCategory]);
