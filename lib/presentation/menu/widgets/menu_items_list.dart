import 'package:foody/common_imports.dart';
import 'package:foody/data/model/menu/menu.dart';
import 'package:foody/presentation/menu/widgets/menu_item_card.dart';

class MenuItemsList extends StatelessWidget {
  final List<Menu> menuItems;
  final ValueChanged<Menu>? onItemTap;
  final ValueChanged<Menu>? onAddToCart;

  const MenuItemsList({
    super.key,
    required this.menuItems,
    this.onItemTap,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12.w),
      itemCount: menuItems.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: MenuItemCard(
          menuItem: menuItems[index],
          onTap:()=> onItemTap!(menuItems[index]) ,
          onAddToCart: onAddToCart != null
              ? () => onAddToCart!(menuItems[index])
              : null,
        ),
      ),
    );
  }
}

