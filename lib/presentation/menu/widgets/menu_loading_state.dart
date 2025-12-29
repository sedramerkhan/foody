import 'package:foody/common_imports.dart';
import 'package:foody/presentation/menu/widgets/menu_item_card_skeleton.dart';

class MenuLoadingState extends StatelessWidget {
  const MenuLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12.w),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: const MenuItemCardSkeleton(),
      ),
    );
  }
}

