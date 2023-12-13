import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/app/configs/constants/spacements.dart';
import 'package:target_sistemas_prova/app/configs/theme/app_color_style.dart';
import 'package:target_sistemas_prova/app/data/models/card/card.model.dart';

class CardAnnotationTile extends StatelessWidget {
  final CardModel card;
  final VoidCallback? onTapEdit;
  final VoidCallback? onTapDelete;

  const CardAnnotationTile({
    super.key,
    required this.card,
    this.onTapEdit,
    this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacements.XXS,
        vertical: Spacements.XS,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.midGray, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              card.text!,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onTapEdit,
                icon: const Icon(
                  Icons.border_color,
                  color: AppColors.black,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: onTapDelete,
                icon: const Icon(
                  Icons.cancel_rounded,
                  color: AppColors.error,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
