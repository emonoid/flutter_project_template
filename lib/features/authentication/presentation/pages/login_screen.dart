import '/core/common/cubits/theme/theme_cubit.dart';
import '/core/common/widgets/qtec_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/common/cubits/locale_cubit/language_cubit.dart';
import '../../../../core/common/widgets/qtec_button.dart';
import '../../../../core/utils/enums.dart';
import '/core/utils/extensions/extensions.dart';
import '/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widgets/sneak_bar.dart';
import '../../../../core/theme/color.pallete.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  var authKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            height: context.height,
            width: context.width,
            padding: const EdgeInsets.all(20),
            child: Form(
              key: authKey,
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailed) {
                    QtecSneakBar.customSnackBar(
                      context: context,
                      snackText: state.message,
                      snackBackgroundColor: ColorPallete.redColor,
                    );
                  }
                  if (state is AuthSuccess) {
                    // context.push(const SideNavigation());
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      QtecTextWidget(
                          text: AppLocalizations.of(context)!.welcome),
                      const SizedBox(height: 20),
                      QtecButton(
                        onTap: state is AuthLoading == false
                            ? () async {
                                FocusScope.of(context).unfocus();
                                // if (authKey.currentState!.validate()) {
                                //   context.read<AuthCubit>().login(
                                //         mobile: _mobileTextController.text,
                                //         password:
                                //             _passwordTextController.text,
                                //       );
                                // }
                                if (await context
                                        .read<LanguageCubit>()
                                        .getLocal ==
                                    const Locale('bn')) {
                                  if (context.mounted) {
                                    context
                                        .read<LanguageCubit>()
                                        .changeLanguage(const Locale('en'));
                                  }
                                } else {
                                  if (context.mounted) {
                                    context
                                        .read<LanguageCubit>()
                                        .changeLanguage(const Locale('bn'));
                                  }
                                }

                                if (await context.read<ThemeCubit>().getTheme ==
                                    ThemeModes.light) {
                                  if (context.mounted) {
                                    context
                                        .read<ThemeCubit>()
                                        .changeTheme(ThemeModes.dark);
                                  }
                                } else {
                                  if (context.mounted) {
                                    context
                                        .read<ThemeCubit>()
                                        .changeTheme(ThemeModes.light);
                                  }
                                }
                              }
                            : null,
                        isLoading: state is AuthLoading,
                        buttonHeight: 50,
                        borderRadius: 15,
                        borderColor: ColorPallete.scaffoldBackGroundColor,
                        gradient: ColorPallete.blueButtonGradient,
                        textColor: ColorPallete.whiteColor,
                        fontSize: 16,
                        buttonText: 'Change Language'.toUpperCase(),
                        showIcon: false,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
