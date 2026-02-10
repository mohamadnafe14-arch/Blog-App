import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:blog_app/features/auth/data/data_sources/remote_auth_data_source.dart';
import 'package:blog_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:blog_app/features/auth/domain/repos/auth_repo.dart';
import 'package:blog_app/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:blog_app/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<SupabaseClient>(
    SupabaseClient(AppSecrets.supaBaseUrl, AppSecrets.supaKey),
  );
  getIt.registerSingleton<RemoteAuthDataSource>(
    RemoteAuthDataSourceImpl(getIt.get<SupabaseClient>()),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(getIt.get<RemoteAuthDataSource>()),
  );
  getIt.registerSingleton<SignInUseCase>(
    SignInUseCase(getIt.get<AuthRepo>()),
  );
  getIt.registerSingleton<SignUpUseCase>(
    SignUpUseCase(getIt.get<AuthRepo>()),
  );
  
}
