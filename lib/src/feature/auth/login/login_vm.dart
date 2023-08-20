import 'dart:ffi';

import 'package:asyncstate/asyncstate.dart';
import 'package:dwbarbershop/src/core/exceptions/service_exception.dart';
import 'package:dwbarbershop/src/core/fp/either.dart';
import 'package:dwbarbershop/src/core/providers/application_providers.dart';
import 'package:dwbarbershop/src/feature/auth/login/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVm extends _$LoginVm {
  @override
  LoginState build() => LoginState.initial();

  Future<void> login(String email, String password) async {

    final loaderHandle = AsyncLoaderHandler() ..start();
    final loginService = ref.watch(userLoginServiceProvider);

    final result = await loginService.execute(email, password);

    switch (result) {
      case Success():
        // buscar os dados do usuario logado
        // Fazer uma analise para qual o tipo de login
        break;
      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
            status: LoginStateStatus.error, errorMessage: () => message);
    }
    loaderHandle.close();
  }
}
