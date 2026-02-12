import 'package:blog_app/core/utils/use_case.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/usecases/get_current_user_use_case.dart';
import 'package:blog_app/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:blog_app/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  AuthCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.getCurrentUserUseCase,
  }) : super(AuthInitial());
  Future<void> signIn({required SignInUseCaseParams params}) async {
    emit(AuthLoading());
    final res = await signInUseCase.call(params);
    res.fold((l) => emit(AuthError(l.errMessage)), (r) => emit(AuthSuccess(r)));
  }

  Future<void> signUp({required SignUpUseCaseParam params}) async {
    emit(AuthLoading());
    final res = await signUpUseCase.call(params);
    res.fold((l) => emit(AuthError(l.errMessage)), (r) => emit(AuthSuccess(r)));
  }

  Future<void> getCurrentUser() async {
    final res = await getCurrentUserUseCase.call(NoParam());
    res.fold((l) => emit(AuthInitial()), (r) => emit(AuthSuccess(r)));
  }
}
