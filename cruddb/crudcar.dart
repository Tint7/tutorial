import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';

main() async {
  // Init ffi loader if needed.
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(
      r"C:\Users\Tint Lwin Oo\OneDrive\Desktop\SQLiteDB\crudcar.db");
  await db.execute('''
  CREATE TABLE IF NOT EXISTS Car (
        id INTEGER PRIMARY KEY,
        name TEXT,
        model TEXT
  )
  ''');

  getOption(db);
}

void getOption(Database db) async {
  var next = true;
  do {
    var option = [
      "list     - to display the list of cars",
      "create   - to create a new car",
      "update   - to update a car",
      "delete   - to delete a car"
    ];
    for (var i = 0; i < option.length; i++) {
      int no = i + 1;
      print("$no. " + option[i]);
    }
    stdout.write("Enter a command above you want: ");
    String getoption = stdin.readLineSync()!.toLowerCase();

    switch (getoption) {
      case "list":
        Future<void> listCars() async {
          // Query the 'Car' table
          List<Map<String, dynamic>> result = await db.query('Car');
          if (result.isEmpty) {
            print("No cars found.");
          } else {
            for (var element in result) {
              print("ID: ${element['id']}");
              print("NAME: ${element['name']}");
              print("MODEL: ${element['model']}");
              print("\n");
            }
          }
        }

        await listCars();
        break;

      case "create":
        createCar() async {
          stdout.write("Enter a new car brand name: ");
          String name = stdin.readLineSync()!.toUpperCase();
          stdout.write("Enter a new car model: ");
          String model = stdin.readLineSync()!.toUpperCase();

          // Insert data into the 'Car' table
          await db
              .insert('Car', <String, String>{'name': name, 'model': model});
          print("You created a new car successfully!");
          print("\n");
        }
        await createCar();
        break;

      case "update":
        updateCar() async {
          stdout.write("Enter ID of the car to update: ");
          String sid = stdin.readLineSync()!;
          int id = int.parse(sid);

          // Check if car exists in the database
          List<Map<String, dynamic>> result = await db.query(
            'Car',
            where: 'id = ?',
            whereArgs: [id],
          );

          if (result.isEmpty) {
            print("Car with ID $id does not exist.");
          } else {
            stdout.write("Enter new car brand name: ");
            String name = stdin.readLineSync()!.toUpperCase();
            stdout.write("Enter new car model: ");
            String model = stdin.readLineSync()!.toUpperCase();

            // Update the car in the database
            await db.update(
              'Car',
              {'name': name, 'model': model},
              where: 'id = ?',
              whereArgs: [id],
            );

            print("Car with ID $id has been updated!");
            print("\n");
          }
        }

        await updateCar();
        break;

      case "delete":
        deleteCar() async {
          stdout.write("Enter ID of the car to delete: ");
          String sid = stdin.readLineSync()!;
          int id = int.parse(sid);

          // Check if car exists in the database
          List<Map<String, dynamic>> result = await db.query(
            'Car',
            where: 'id = ?',
            whereArgs: [id],
          );

          if (result.isEmpty) {
            print("Car with ID $id does not exist.");
          } else {
            // Delete the car from the database
            await db.delete(
              'Car',
              where: 'id = ?',
              whereArgs: [id],
            );

            print("Car with ID $id has been deleted!");
            print("\n");
          }
        }

        await deleteCar();
        break;

      default:
        {
          print("Invalid choice!");
          next = false;
        }
        break;
    }
  } while (next == true);
}
