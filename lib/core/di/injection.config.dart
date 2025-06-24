// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:untitled1/core/cubit/cubit.dart' as _i369;
import 'package:untitled1/core/repository/products_repository.dart' as _i960;
import 'package:untitled1/core/repository/products_repository_impl.dart'
    as _i314;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i960.ProductsRepository>(
      () => _i314.ProductsRepositoryImpl(),
    );
    gh.factory<_i369.ProductsCubit>(
      () => _i369.ProductsCubit(gh<_i960.ProductsRepository>()),
    );
    return this;
  }
}
