import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/app/configs/constants/spacements.dart';
import 'package:target_sistemas_prova/app/configs/theme/app_color_style.dart';
import 'package:target_sistemas_prova/app/data/dependencies/dependencies_injection.dart';
import 'package:target_sistemas_prova/app/modules/home/home.store.dart';
import 'package:target_sistemas_prova/app/modules/home/widgets/card_annotation_tile.dart';
import 'package:target_sistemas_prova/app/shared/widgets/custom_text_form_field.dart';
import 'package:target_sistemas_prova/app/shared/widgets/safe_scroll_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_sistemas_prova/app/utils/utils.dart';

final homeStore = DependenciesInjection.get<HomeStore>();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                children: [
                  Container(
                    width: double.maxFinite,
                    height: size.height * .6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Spacements.XS),
                      color: AppColors.light,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Spacements.S),
                        child: Observer(
                          builder: (_) => !homeStore.listCardEmpty
                              ? Column(
                                  children: homeStore.listCard
                                          ?.map(
                                            (card) => CardAnnotationTile(
                                              card: card,
                                              onTapEdit: () {
                                                homeStore.selectedCard(card);
                                              },
                                              onTapDelete: () async {
                                                var res = await Utils.showDialogChooseOption(
                                                  context,
                                                  title: 'Realmente deseja deletar essa informação?',
                                                );
                                                if (res ?? false) {
                                                  homeStore.deleteCard(card);
                                                }
                                              },
                                            ),
                                          )
                                          .toList() ??
                                      [],
                                )
                              : SizedBox(
                                  height: size.height * .6,
                                  child: Center(
                                    child: Text(
                                      'Lista vazia',
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacements.XL),
                  Form(
                    key: homeStore.formKey,
                    child: Observer(
                      builder: (_) => CustomTextFormField(
                        hintText: 'Digite seu texto aqui',
                        autoFocus: true,
                        padding: const EdgeInsets.symmetric(
                          vertical: Spacements.S,
                          horizontal: Spacements.XS,
                        ),
                        textController: homeStore.textCard,
                        validator: homeStore.validatorTextCard,
                        focusNode: homeStore.focusCard,
                        onEditingComplete: homeStore.cardSelected == null ? homeStore.createCard : homeStore.editCard,
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacements.XS),
                  Observer(
                    builder: (_) => homeStore.cardSelected != null
                        ? Text(
                            'Atenção, você está editando uma infomação existente',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: AppColors.warning,
                                  backgroundColor: AppColors.light,
                                ),
                          )
                        : const SizedBox(),
                  ),
                  const Spacer(),
                  Observer(
                    builder: (_) => homeStore.msgResponse != null
                        ? Column(
                            children: [
                              Text(
                                homeStore.msgResponse!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.error,
                                    ),
                              ),
                              const SizedBox(height: Spacements.S),
                            ],
                          )
                        : const SizedBox(),
                  ),
                  TextButton(
                    onPressed: homeStore.openPrivacyPolicy,
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
