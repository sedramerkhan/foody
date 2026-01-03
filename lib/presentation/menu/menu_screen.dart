import 'package:foody/common_imports.dart';
import 'package:foody/data/model/menu/menu.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';
import 'package:foody/presentation/menu/menu_view_model.dart';
import 'package:foody/presentation/cart/cart_view_model.dart';
import 'package:foody/shared/widgets/app_bar/custom_app_bar.dart';
import 'package:foody/presentation/menu/widgets/menu_no_restaurant_state.dart';
import 'package:foody/presentation/menu/widgets/menu_loading_state.dart';
import 'package:foody/presentation/menu/widgets/menu_items_list.dart';
import 'package:foody/presentation/menu/widgets/menu_error_state.dart';
import 'package:foody/presentation/menu/widgets/menu_empty_state.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = getRouteArgs(context);
      final restaurant = args?['restaurant'] as Restaurant?;
      final viewModel = Provider.of<MenuViewModel>(context, listen: false);
      
      if (restaurant != null) {
        viewModel.setRestaurant(restaurant);
        viewModel.loadMenuItems();
      }
    });
  }

  void _handleAddToCart(Menu menuItem, Restaurant restaurant, CartViewModel cartViewModel) {
    final l10n = S.current;
    cartViewModel.addItem(menuItem, restaurant);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.menuItemAddedToCart(menuItem.itemName)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    final viewModel = Provider.of<MenuViewModel>(context);
    final restaurant = viewModel.selectedRestaurant;
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);


    return Scaffold(
      appBar: CustomAppBar(
        title: restaurant?.name ?? l10n.menuMenu,
      ),
      body: SafeArea(
        child: restaurant == null
            ? const MenuNoRestaurantState()
            : ApiResponseBuilder<List<Menu>>(
                apiResponse: viewModel.menuItemsResponse,
                loading: const MenuLoadingState(),
                onSuccess: (menuItems) => MenuItemsList(
                  menuItems: menuItems,
                  onAddToCart: restaurant != null
                      ? (menuItem) => _handleAddToCart(menuItem, restaurant, cartViewModel)
                      : null,
                ),
                onError: (message) => MenuErrorState(
                  message: message,
                  viewModel: viewModel,
                ),
                empty: const MenuEmptyState(),
                onTryAgain: () => viewModel.loadMenuItems(),
              ),
      ),
    );
  }

}

