import 'package:foody/common_imports.dart';
import 'package:foody/data/model/menu/menu.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';
import 'package:foody/presentation/menu/menu_view_model.dart';
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

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MenuViewModel>(context);
    final restaurant = viewModel.selectedRestaurant;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          restaurant?.name ?? 'Menu',
          typography: AppTypography.headingMediumBold,
          color: AppColors.textPrimary,
        ),
        backgroundColor: AppColors.bgSurface,
        elevation: 0,
      ),
      body: SafeArea(
        child: restaurant == null
            ? const MenuNoRestaurantState()
            : ApiResponseBuilder<List<Menu>>(
                apiResponse: viewModel.menuItemsResponse,
                loading: const MenuLoadingState(),
                onSuccess: (menuItems) => MenuItemsList(menuItems: menuItems),
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

