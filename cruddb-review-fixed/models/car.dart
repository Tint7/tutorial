import 'config/table.dart';

/// # Carr
/// The car table.
///
/// @author TintLwinOo
class Car extends Table {
  /// The car id
  int? id;

  /// The car name
  String? name;

  /// The car model
  String? model;

  /// ## Constructor
  /// The car constructor with all arguments
  ///
  /// [Parameters]:
  ///  - id       [int]
  ///  - name     [String]
  ///  - model      [String]
  Car(this.id, this.name, this.model) : super();

  /// ## Constructor
  /// The named constructor for car
  Car.empty();

  /// fromJson
  ///
  /// the class factory method to convert json object to class member object
  ///
  /// Parameters:
  /// - json [Map<String, dynamic>]
  ///
  /// @return [Car]
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(json['id'], json['name'], json['model']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'id': this.id, 'name': this.name, 'model': this.model};
  }

  @override
  String getClassName() {
    return "car";
  }

  @override
  String createQuery() {
    return '''
    CREATE TABLE car (
      id INTEGER PRIMARY KEY,
      name VARCHAR(100),
      model VARCHAR(100)
    )
    ''';
  }

  @override
  String toString() {
    return '${this.toJson()}';
  }
}
