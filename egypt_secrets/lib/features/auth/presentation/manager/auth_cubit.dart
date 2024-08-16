import 'package:dio/dio.dart';
import 'package:egypt_secrets/core/constants/app_constants.dart';
import 'package:egypt_secrets/core/services/api_services.dart';
import 'package:egypt_secrets/core/services/local_storage.dart';
import 'package:egypt_secrets/features/auth/data/models/post_auth_response/post_auth_response.dart';
import 'package:egypt_secrets/features/auth/presentation/manager/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static String gName = "";

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      await Dio().post('${ApiConstat.baseUrl}login', data: {
        'email': email,
        'password': password,
      }).then((value) {
        var res = PostAuthResponse.fromJson(value.data);
        emit(LoginSuccessState(res));
      });
    } catch (e) {
      emit(LoginErrorState("Email or password is wrong"));
    }
  }

  void register(
      {required String name,
      required String email,
      required String password,
      required String passwordConfirmation}) async {
    emit(RegisterLoadingState());
    try {
      gName = name;
      await Dio().post('${ApiConstat.baseUrl}register', data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation
      }).then((value) {
        var res = PostAuthResponse.fromJson(value.data);
        emit(RegisterSuccessState(res));
      });
    } catch (e) {
      emit(RegisterErrorState("error in registeration"));
    }
  }

  getProfile() {
    ApiServices.get(
      url: 'profile',
      headers: {
        'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
      },
    ).then((value) {
      gName = value!.name;
    });
  }
}
