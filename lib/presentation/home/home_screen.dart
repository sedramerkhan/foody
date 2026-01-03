import 'package:foody/common_imports.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';
import 'package:foody/presentation/home/home_view_model.dart';
import 'package:foody/presentation/cart/cart_view_model.dart';
import 'package:foody/shared/widgets/cart/cart_icon_button.dart';
import 'package:foody/shared/widgets/app_bar/custom_app_bar.dart';
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
    NavigationUtils.pushNamed(context, Routes.cart);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    final cartViewModel = Provider.of<CartViewModel>(context, listen: true);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Restaurants',
        actions: [
          CartIconButton(
            itemCount: cartViewModel.itemCount > 0 ? cartViewModel.itemCount : null,
            onTap: _navigateToCart,
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await viewModel.refreshRestaurants();
          },
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
      ),
    );
  }

}

