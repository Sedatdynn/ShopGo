import 'package:shop_go/core/exception/server_exception.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shop_go/feature/login/model/login_request_model.dart';
import 'package:shop_go/feature/login/model/token_model.dart';

abstract class ILoginService {
  BaseResponseData<TokenModel> logIn({required LoginRequestModel model});
}

typedef BaseResponseData<T> = Future<Either<ServerException, T>>;
