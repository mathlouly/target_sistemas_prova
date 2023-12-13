import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/app/configs/constants/spacements.dart';
import 'package:target_sistemas_prova/app/configs/theme/app_color_style.dart';
import 'package:target_sistemas_prova/app/data/dependencies/dependencies_injection.dart';
import 'package:target_sistemas_prova/app/modules/sign_in/sign_in.store.dart';
import 'package:target_sistemas_prova/app/shared/widgets/custom_text_form_field.dart';
import 'package:target_sistemas_prova/app/shared/widgets/primary_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_sistemas_prova/app/shared/widgets/safe_scroll_view.dart';

final signInStore = DependenciesInjection.get<SignInStore>();

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(1, 1),
            stops: [0, .5],
          ),
        ),
        child: SafeArea(
          child: SafeScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacements.M,
                vertical: Spacements.XS,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Form(
                    key: signInStore.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          title: 'Usuário',
                          hintText: 'Digite seu usuário',
                          prefixIcon: Icons.person,
                          textController: signInStore.textUsername,
                          validator: signInStore.validatorUsername,
                        ),
                        const SizedBox(height: Spacements.S),
                        CustomTextFormField(
                          title: 'Senha',
                          hintText: 'Digite sua senha',
                          isPassword: true,
                          prefixIcon: Icons.lock,
                          textController: signInStore.textPassword,
                          validator: signInStore.validatorPassword,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacements.L),
                  Observer(
                    builder: (_) => PrimaryButton(
                      text: 'Entrar',
                      elevation: 4,
                      width: 120,
                      height: 24,
                      loading: signInStore.loading,
                      onPressed: signInStore.submit,
                    ),
                  ),
                  Observer(
                    builder: (_) => signInStore.msgResponse != null
                        ? Column(
                            children: [
                              const SizedBox(height: Spacements.S),
                              Text(
                                signInStore.msgResponse!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.error,
                                    ),
                              )
                            ],
                          )
                        : const SizedBox(),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: signInStore.openPrivacyPolicy,
                    child: Text(
                      'Política de Privacidade',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.light),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
