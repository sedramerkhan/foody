import 'package:foody/common_imports.dart';
import 'package:foody/core/api_response/no_data/try_again_widget.dart';
import 'package:foody/presentation/order_details/order_details_view_model.dart';

class OrderDetailsErrorState extends StatelessWidget {
  final String message;
  final String orderId;

  const OrderDetailsErrorState({
    super.key,
    required this.message,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: TryAgain(
        message: message,
        icon: Icon(
          Icons.error_outline,
          size: 64.w,
          color: AppColors.textSecondaryAlt,
        ),
        onTapButton: () {
          final viewModel = Provider.of<OrderDetailsViewModel>(context, listen: false);
          viewModel.loadOrderDetails(orderId);
        },
      ),
    );
  }
}

