import 'dart:io';
import 'models/config/entity_manager.dart';
import 'models/car.dart';
import 'services/car_service.dart';

/// The current project path
final projectPath = Directory.current.path;

/// the entiry manager
final entityManager = EntityManager();

/// the user service
final carService = CarService();

/// main function
Future<void> main() async {
  await entityManager.initDatabase([Car.empty()]);
  await showOption();
}

/// Command
///
/// The asynchronous function to run the command
Future<void> showOption() async {
  print('Car CRUD operation');
  print('------------------');
  print('There are 4 options to control:');
  print('1. list - display the list of users.');
  print('2. create - create a new user.');
  print('3. update - update an existing user.');
  print('4. delete - delete an existing user.');

  while (true) {
    print('Enter the option: ');
    final option = stdin.readLineSync();
    if (option == 'exit') {
      print('Leaving the command.');
      break;
    }
    await executeCar(option);
  }
}

// Execute
///
/// To execute the command options.
///
/// Parameters
///  - [String] option
Future<void> executeCar(String? option) async {
  switch (option) {
    case 'list':
      final cars = await carService.getAllCars();
      if (cars.isEmpty) {
        print('First create the car!');
      } else {
        print(cars);
      }
      break;
    case 'create':
      await createCar();
      break;
    case 'update':
      await updateCar();
      break;
    case 'delete':
      await deleteCar();
      break;
    default:
      print('Invalid option');
      break;
  }
}

/// CreateCar
///
/// The asynchronous function to create user
Future<void> createCar() async {
  print('Creating a new Car');
  print('-------------------');

  final car = Car.empty();

  print('Enter the name of the new car: ');
  car.name = stdin.readLineSync();

  print('Enter the model of the new car: ');
  final modelInput = stdin.readLineSync();
  car.model = modelInput ?? '';

  await carService.createCar(car);

  print('Successfully created the new Car.');
}

/// updateUser
///
/// The asynchronous function to update user
Future<void> updateCar() async {
  print('Updating a Car');
  print('----------------');

  print('Enter the car ID: ');
  final idInput = stdin.readLineSync();
  final id = int.tryParse(idInput ?? '') ?? 0;

  final car = await carService.getCarById(id);
  if (car == null) {
    print('Car not found');
    return;
  }

  print('Enter the car name: ');
  final nameInput = stdin.readLineSync();
  if (nameInput?.isNotEmpty == true) {
    car.name = nameInput!;
  }

  print('Enter the car model: ');
  final modelInput = stdin.readLineSync();
  if (modelInput?.isNotEmpty == true) {
    car.model = modelInput;
  }

  await carService.updateCar(car);
  print('Updated the car!');
}

/// DeleteUser
///
/// The asynchronous function to deleate user
Future<void> deleteCar() async {
  print('Deleting a car');
  print('----------------');

  print('Enter the car ID: ');
  final idInput = stdin.readLineSync();
  final id = int.tryParse(idInput ?? '') ?? 0;

  final car = await carService.getCarById(id);
  if (car == null) {
    print('Car not found');
    return;
  }

  await carService.deleteCar(id);
  print('Deleted the car!');
}
