import 'dart:math';

void main() {
  var generalvar;
  String brand = "BMW";

  //for variable
  void variable() {
    generalvar = "Rock Star";
    print(generalvar);
  }

  //for operator
  void operator() {
    generalvar = 2022;
    print(++generalvar);
  }

  //for library
  void library() {
    var rectangle = MutableRectangle(20, 50, 20, 40);
    generalvar = rectangle.width * rectangle.height;
    print("Area of Rectangle: ${generalvar}");
  }

  //functioncall
  variable();
  operator();
  library();

  //objectcreate
  Car car = new Vehicle();
  car.moveForward(50, "${brand}>Car");

  Cycle cycle = new Vehicle();
  cycle.moveForward(100, "${brand}>Cycle");

  Ebike ebike = new Vehicle();
  ebike.moveForward(50, "${brand}>Ebike");

  //assert
  assert(Vehicle.speed != 0);

  //as
  (Employee as Person).name = "Mg Mg";

  //enumcall
  print(Status.pending.index);

  //loop
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }

  for (final c in callbacks) {
    c();
  }
  //switch,case
  var grade = "A";
  switch (grade) {
    case "A":
      {
        print("Excellent");
      }
      break;

    case "B":
      {
        print("Good");
      }
      break;

    case "C":
      {
        print("Fair");
      }
      break;

    case "D":
      {
        print("Poor");
      }
      break;

    default:
      {
        print("Invalid choice");
      }
      break;
  }

  //for dowhile
  bool b = false;
  do {
    print("Hello");
  } while (b == true);

  //forloop
  for (int i = 0; i < 10; i++) {
    if (i < 5) {
      continue;
    }
    print(i);
  }

  // ignore: unused_element
  Stream<int> foo() async* {
    //async*=>fetchingdat,R/W
    for (int i = 0; i < 10; i++) {
      await Future.delayed(
          const Duration(seconds: 1)); //await to get complete result of async*
      yield i; //appends a value to the output stream of the async* function
    }
  }

  //try,on,catch
  try {
    // ···
  } on Exception catch (e) {
    print('Exception details:\n $e');
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  }
}

//interface
interface class Cycle {
  void moveForward(int speed, String brand) {}
}

//abrstract,extends,with
abstract class Car extends Cycle with Ebike {
  void moveForward(int speed, String brand);
}

//mixin
mixin class Ebike {
  void moveForward(int speed, String brand) {}
}

// implements
class Vehicle implements Car {
  static const speed = 0; //intital variable cannot change
  dynamic speed1; //chaging
  @override
  void moveForward(int speed, String brand) {
    if (speed >= 60) {
      print("${brand}: Safe Drive!");
    } else {
      print("${brand}: Normal Situation!");
    }
  }
}

//enumclass
enum Status {
  pending,
  completed,
  rejected,
}

//get,set,return,this
class Employee {
  late String name;
}

class Person {
  late String name;

  String get getName {
    return name;
  }

  set setName(String name) {
    name = this.name;
  }
}

//forcovariant
class Animal {
  void chase(Animal x) {}
}

class Mouse extends Animal {}

class Cat extends Animal {
  //  covariant keyword can be placed
  //in either the superclass or the subclass method.
  // Usually the superclass method is the best place to put it.
  //The covariant keyword applies to a single parameter
  //and is also supported on setters and fields.
  @override
  void chase(covariant Mouse x) {}
}
