import 'package:foody/common_imports.dart';

class AddressInputSection extends StatefulWidget {
  final String address;
  final ValueChanged<String> onAddressChanged;

  const AddressInputSection({
    super.key,
    required this.address,
    required this.onAddressChanged,
  });

  @override
  State<AddressInputSection> createState() => _AddressInputSectionState();
}

class _AddressInputSectionState extends State<AddressInputSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.address);
    _controller.addListener(() {
      widget.onAddressChanged(_controller.text);
    });
  }

  @override
  void didUpdateWidget(AddressInputSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.address != widget.address && _controller.text != widget.address) {
      _controller.text = widget.address;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.current;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText(
          l10n.checkoutDeliveryAddress,
          typography: AppTypography.headingSmallBold,
          color: AppColors.textPrimary,
        ),
        GapH(12.h),
        LabeledTextField(
          label: l10n.checkoutAddress,
          controller: _controller,
          config: AppTextFieldConfig.standard(
            hintText: l10n.checkoutEnterDeliveryAddress,
            isRequired: true,
        )),
      ],
    );
  }
}

