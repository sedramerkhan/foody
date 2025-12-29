import 'package:foody/common_imports.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';
import 'package:foody/presentation/home/home_view_model.dart';
import 'package:foody/shared/widgets/cart/cart_icon_button.dart';
import 'package:foody/presentation/home/widgets/home_loading_state.dart';
import 'package:foody/presentation/home/widgets/home_restaurant_list.dart';
import 'package:foody/presentation/home/widgets/home_error_state.dart';
import 'package:foody/presentation/home/widgets/home_empty_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Loading is now handled by MainScreen
  }

  void _navigateToMenu(Restaurant restaurant) {
    NavigationUtils.pushNamed(
      context,
      Routes.menu,
      arguments: {'restaurant': restaurant},
    );
  }

  void _navigateToCart() {
    // TODO: Navigate to cart screen when implemented
    // NavigationUtils.pushNamed(context, Routes.cart);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          'Restaurants',
          typography: AppTypography.headingMediumBold,
          color: AppColors.textPrimary,
        ),
        backgroundColor: AppColors.bgSurface,
        elevation: 0,
        actions: [
          CartIconButton(
            itemCount: null, // TODO: Get from cart state
            onTap: _navigateToCart,
          ),
        ],
      ),
      body: SafeArea(
        child: ApiResponseBuilder<List<Restaurant>>(
          apiResponse: viewModel.restaurantsResponse,
          loading: const HomeLoadingState(),
          onSuccess: (restaurants) => HomeRestaurantList(
            restaurants: restaurants,
            onRestaurantTap: _navigateToMenu,
          ),
          onError: (message) => HomeErrorState(
            message: message,
            viewModel: viewModel,
          ),
          empty: const HomeEmptyState(),
          onTryAgain: () => viewModel.loadRestaurants(),
        ),
      ),
    );
  }

}

