import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shop_go/core/exception/server_exception.dart';
import 'package:shop_go/core/network/netwrok_manager.dart';
import 'package:shop_go/feature/login/model/login_request_model.dart';
import 'package:shop_go/feature/login/model/token_model.dart';
import 'package:shop_go/feature/login/service/i_login_service.dart';

class LoginService extends ILoginService {
  @override
  BaseResponseData<TokenModel> logIn({required LoginRequestModel model}) async {
    try {
      final response = await NetworkManager.instance
          .dioPost(path: 'token/', model: model, responseModel: const TokenModel());
      if (response is ServerException) {
        return Left(ServerException(message: response.message, statusCode: response.statusCode));
      } else {
        return Right(response);
      }
    } on DioException catch (e) {
      return Left(ServerException(message: e.message.toString(), statusCode: '505'));
    }
  }
}
