import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/local_data/shared_preference_helper.dart';
import '../../domain/repositories/auth.repository.dart';
import '../datasources/auth.remote.datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(
    this.remoteDataSource,
  );

  @override
  Future<Either<Failure, dynamic>> login({
    required String mobile,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      var response = await remoteDataSource.login(mobile, password);
      if (response['success']) {
        await LocalData.setToken(response['accessToken']);
        await LocalData.setLoginFlag(true);
        return Right(response);
      } else {
        return Left(Failure(response['message'].toString()));
      }
    } catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }
}
