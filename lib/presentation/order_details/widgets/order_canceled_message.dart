import 'package:foody/common_imports.dart';

class OrderCanceledMessage extends StatelessWidget {
  const OrderCanceledMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.red.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.cancel_outlined,
            color: Colors.red,
            size: 24.w,
          ),
          GapW(12.w),
          Expanded(
            child: AppText(
              l10n.ordersOrderCanceled,
              typography: AppTypography.bodyMediumSemiBold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

