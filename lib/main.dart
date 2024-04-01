import 'package:flutter_localizations/flutter_localizations.dart';
import '/core/common/cubits/locale_cubit/language_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/core/local_data/shared_preference_helper.dart';
import '/core/utils/enums.dart';
import '/core/common/cubits/app_user/app_user_cubit.dart';
import '/features/authentication/presentation/cubit/auth_cubit.dart';
import '/features/authentication/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/common/cubits/theme/theme_cubit.dart';
import 'core/theme/theme.dart';
import 'l10n/l10n.dart';
import 'inti.dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppUserCubit>(
          create: (_) => serviceLocator<AppUserCubit>(),
        ),
        BlocProvider<AuthCubit>(
          create: (_) => serviceLocator<AuthCubit>(),
        ),
        BlocProvider<LanguageCubit>(
          create: (_) => serviceLocator<LanguageCubit>(),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => serviceLocator<ThemeCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, localeState) {
              if (localeState is LanguageLoaded && themeState is ThemeLoaded) {
                return MyApp(
                  local: localeState.locale,
                  themeMode: themeState.theme,
                );
              }
              return const SizedBox();
            },
          );
        },
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.local, required this.themeMode});

  final Locale local;
  final ThemeModes themeMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AppUserCubit>().checkLoginSession();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paultry Farms',
      theme: widget.themeMode == ThemeModes.light ? lightTheme : darkTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      locale: widget.local,
      debugShowCheckedModeBanner: false,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return Container();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
