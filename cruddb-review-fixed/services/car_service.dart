import '../crudcar.dart';
import '../models/car.dart';

/// # CarService
/// The service to perform the Car CRUD operations
///
/// @author TintLwinOo
class CarService {
  /// getAllCars
  ///
  /// Get all cars from database.
  ///
  /// @return [Future<List<Car>>]
  Future<List<Car>> getAllCars() async {
    final data = await entityManager.database.query('car');
    return data.map((car) => Car.fromJson(car)).toList();
  }

  /// getcarById
  ///
  /// Get car by id.
  ///
  /// Parameters:
  /// - id [int]
  ///
  /// @return [Future<User?>]
  Future<Car?> getCarById(int id) async {
    final data = await entityManager.database
        .query('car', where: 'id = ?', whereArgs: [id]);
    if (data.length == 0) return null;
    return Car.fromJson(data.single);
  }

  /// createCar
  ///
  /// Create the new car.
  ///
  /// Parameters:
  /// - car [Car]
  Future<void> createCar(Car car) async {
    await entityManager.database.insert(car.getClassName(), car.toJson());
  }

  /// updateCar
  ///
  /// Update the car.
  ///
  /// Parameters:
  /// - car [Car]
  Future<void> updateCar(Car car) async {
    await entityManager.database.update(car.getClassName(), car.toJson(),
        where: 'id = ?', whereArgs: [car.id]);
  }

  /// deleteCar
  ///
  /// Delete the car.
  ///
  /// Parameters
  /// - car [Car]
  Future<void> deleteCar(int id) async {
    await entityManager.database
        .delete('car', where: 'id = ?', whereArgs: [id]);
  }
}
