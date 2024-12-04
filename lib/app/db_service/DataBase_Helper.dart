
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'mtouch.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE product(id INTEGER PRIMARY KEY AUTOINCREMENT,productName TEXT, price TEXT, offerPrice TEXT,avlProductQty TEXT,productDescription TEXT)',
        );
      },
    );
  }

  Future<int> addProduct({String? price,String? productName,String? offerPrice,String? avlProductQty,String? productDescription}) async {
    final db = await database;
    return await db.insert(
      'product',
      {'price': price, 'productName': productName,'offerPrice':offerPrice,'avlProductQty':avlProductQty,'productDescription':productDescription},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<Map<String, dynamic>?> getProductDetails(String productName) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'product',
      where: 'productName = ?',
      whereArgs: [productName],
    );

    return result.isNotEmpty ? result.first : null; // Return the first match or null if no match
  }

 /* Future<Map<String, dynamic>?> loginUser(String username, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty ? result.first : null;
  }*/

  Future<void> closeDatabase() async {
    final db = await database;
    await db.close();
    _database = null;
  }
  Future<int> deleteProductByName(String productName) async {
    final db = await database;
    return await db.delete(
      'product',
      where: 'productName = ?',
      whereArgs: [productName],
    );
  }
  Future<int> updateProductByName(String productName, Map<String, dynamic> updates) async {
    final db = await database; // Assume this is your SQLite instance

    return await db.update(
      'product',
      updates,
      where: 'productName = ?',
      whereArgs: [productName],
    );
  }

}