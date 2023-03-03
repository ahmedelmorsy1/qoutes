import 'package:qoutes/barell_file.dart';

abstract class Failure extends Equatable{
    @override
  List<Object?> get props => [];
}
class ServerFailure extends Failure{}
class CacheFailure extends Failure{}