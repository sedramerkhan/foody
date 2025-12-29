import 'package:foody/common_imports.dart';
import 'package:foody/data/model/restaurant/restaurant.dart';
import 'package:foody/presentation/home/widgets/restaurant_card.dart';

class HomeRestaurantList extends StatelessWidget {
  final List<Restaurant> restaurants;
  final ValueChanged<Restaurant> onRestaurantTap;

  const HomeRestaurantList({
    super.key,
    required this.restaurants,
    required this.onRestaurantTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 0.75,
        ),
        itemCount: restaurants.length,
        itemBuilder: (context, index) => RestaurantCard(
          restaurant: restaurants[index],
          onTap: () => onRestaurantTap(restaurants[index]),
        ),
      ),
    );
  }
}

