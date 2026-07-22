
import 'package:blodbank/features/auth/data/data_sources/auth_data_source.dart';
import 'package:blodbank/features/auth/domain/repositories/auth_repository.dart';








class AuthRepositoryImpl implements AuthRepository {
   final AuthDataSource  authDataSource;
   AuthRepositoryImpl(this.authDataSource);
}