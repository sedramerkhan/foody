import 'package:foody/common_imports.dart';
import 'package:foody/presentation/home/home_screen.dart';
import 'package:foody/presentation/home/home_view_model.dart';
import 'package:foody/presentation/orders/orders_screen.dart';
import 'package:foody/presentation/orders/orders_view_model.dart';
import 'package:foody/presentation/profile/profile_screen.dart';
import 'package:foody/presentation/profile/profile_view_model.dart';
import 'package:foody/shared/utils/navigation/view_model_provider.dart';
import 'package:foody/shared/widgets/bottom_nav_bar/app_bottom_nav_bar.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> _currentNavBarIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<HomeViewModel>(context, listen: false);
      viewModel.loadRestaurants();
    });
  }

  @override
  void dispose() {
    _currentNavBarIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      provideViewModel<OrdersViewModel>(
        createViewModel: () => OrdersViewModel(),
        child: const OrdersScreen(),
      ),
      provideViewModel<ProfileViewModel>(
        createViewModel: () => ProfileViewModel(),
        child: const ProfileScreen(),
      ),
    ];

    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _currentNavBarIndex,
        builder: (context, index, _) {
          return LazyIndexedStack(
            index: index,
            children: screens,
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return ValueListenableBuilder<int>(
      valueListenable: _currentNavBarIndex,
      builder: (context, index, _) {
        return AppBottomNavBar(
          currentIndex: index,
          onTap: (int newIndex) {
            _currentNavBarIndex.value = newIndex;
          },
        );
      },
    );
  }
}




