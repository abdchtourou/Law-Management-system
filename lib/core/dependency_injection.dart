import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/data/datasources/local/auth_local_data_source.dart';
import '../features/auth/data/datasources/remote/auth_remote_data_source.dart';
import '../features/auth/data/repositories_impl/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/get_current_user.dart';
import '../features/auth/domain/usecases/sign_in.dart';
import '../features/auth/domain/usecases/sign_out.dart';
import '../features/auth/domain/usecases/sign_up.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../features/home/data/model/isar/home_isar_model.dart';
import '../features/home/data/repo/home_repo_impl.dart';
import 'network/api_client.dart';
import 'network/network_info.dart';
import '../features/home/data/datasource/local/home_local_data_source.dart';
import '../features/home/data/datasource/remote/home_remote_data_source.dart';
import '../features/home/domain/repo/home_repo.dart';
import '../features/home/domain/usecase/get_home_stream_use_case.dart';
import '../features/home/domain/usecase/sync_home_use_case.dart';
import '../features/home/presentation/cubit/home_cubit.dart';
import '../features/user/data/models/isar/user_isar_model.dart';
import '../features/user/data/datasource/local/user_local_data_source.dart';
import '../features/user/data/datasource/remote/user_remote_data_source.dart';
import '../features/user/data/repo/user_repo_impl.dart';
import '../features/user/domain/repo/user_repo.dart';
import '../features/user/domain/usecase/get_all_users_use_case.dart';
import '../features/user/domain/usecase/sync_users_use_case.dart';
import '../features/user/domain/usecase/create_user_use_case.dart';
import '../features/user/domain/usecase/create_client_use_case.dart';
import '../features/user/presentation/cubit/create_user_cubit.dart';
import '../features/user/presentation/cubit/create_client_cubit.dart';
import '../features/user/presentation/cubit/user_management_cubit.dart';
import 'package:path_provider/path_provider.dart';

/// Service locator instance
final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Initialize Isar (using empty string for directory uses the default location)
  final isar = await Isar.open(
    [HomeIsarModelSchema, UserIsarModelSchema],
    directory: (await getApplicationDocumentsDirectory())
        .path, // Use writable directory
  );
  sl.registerLazySingleton<Isar>(() => isar);

  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: sl<SharedPreferences>()),
  );

  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(
      dio: sl<Dio>(),
      authLocalDataSource: sl<AuthLocalDataSource>(),
    ),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiClient: sl<ApiClient>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      localDataSource: sl<AuthLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => SignIn(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SignUp(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SignOut(sl<AuthRepository>()));
  sl.registerLazySingleton(() => GetCurrentUser(sl<AuthRepository>()));

  // Cubit
  sl.registerFactory(
    () => AuthCubit(
      signInUseCase: sl<SignIn>(),
      signUpUseCase: sl<SignUp>(),
      signOutUseCase: sl<SignOut>(),
      getCurrentUserUseCase: sl<GetCurrentUser>(),
    ),
  );

  // Home
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(sl<Isar>()),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiClient: sl<ApiClient>()),
  );
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      remoteDataSource: sl<HomeRemoteDataSource>(),
      localDataSource: sl<HomeLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<GetHomeStreamUseCase>(
    () => GetHomeStreamUseCase(homeRepo: sl<HomeRepo>()),
  );
  sl.registerLazySingleton<SyncHomeUseCase>(
    () => SyncHomeUseCase(homeRepo: sl<HomeRepo>()),
  );

  // User Feature
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sl<Isar>()),
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(sl<ApiClient>()),
  );
  sl.registerLazySingleton<UserRepo>(
    () => UserRepoImpl(
      remoteDataSource: sl<UserRemoteDataSource>(),
      localDataSource: sl<UserLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<GetAllUsersUseCase>(
    () => GetAllUsersUseCase(userRepo: sl<UserRepo>()),
  );
  sl.registerLazySingleton<SyncUsersUseCase>(
    () => SyncUsersUseCase(userRepo: sl<UserRepo>()),
  );
  sl.registerLazySingleton<CreateUserUseCase>(
    () => CreateUserUseCase(sl<UserRepo>()),
  );
  sl.registerLazySingleton<CreateClientUseCase>(
    () => CreateClientUseCase(userRepo: sl<UserRepo>()),
  );

  sl.registerFactory<CreateUserCubit>(
    () => CreateUserCubit(createUserUseCase: sl<CreateUserUseCase>()),
  );
  sl.registerFactory<CreateClientCubit>(
    () => CreateClientCubit(createClientUseCase: sl<CreateClientUseCase>()),
  );

  sl.registerFactory<UserManagementCubit>(
    () => UserManagementCubit(
      getAllUsersUseCase: sl<GetAllUsersUseCase>(),
      syncUsersUseCase: sl<SyncUsersUseCase>(),
    ),
  );

  // Home Cubit (Updated)
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      getHomeStreamUseCase: sl<GetHomeStreamUseCase>(),
      syncHomeUseCase: sl<SyncHomeUseCase>(),
      getAllUsersUseCase: sl<GetAllUsersUseCase>(),
      syncUsersUseCase: sl<SyncUsersUseCase>(),
    ),
  );
}
