import 'package:flutter_assignment/core/error/faliures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SucessType, Params> {
  Future<Either<Faliure, SucessType>> call(Params params);
}

class NoPrams{}
