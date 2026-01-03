/// Common imports file for the Foody app
///
/// This file provides a single import point for all commonly used components
/// across the application, reducing boilerplate and improving maintainability.
///
/// Usage:
/// ```dart
/// import 'package:foody/common_imports.dart';
/// ```
///
/// This will give you access to:
/// - Flutter Material widgets
/// - Theme system (colors, typography, theme)
/// - All widget packages (text, buttons, text_field, image, clickable_container)
/// - Utility functions (screen utils, extensions)
/// - Core components (API response, base classes)

// ============================================================================
// Flutter Core
// ============================================================================
export 'package:flutter/material.dart';

// ============================================================================
// Theme System
// ============================================================================
// Colors
export 'package:foody/core/theme/color/app_colors.dart';

// Typography
export 'package:foody/core/theme/typography/app_text_common.dart';

// Theme
export 'package:foody/core/theme/theme.dart';


// ============================================================================
// Widget Packages
// ============================================================================
// Text Widgets
export 'package:foody/shared/widgets/text/text.dart';

// Buttons
export 'package:foody/shared/widgets/buttons/buttons.dart';

// Text Fields
export 'package:foody/shared/widgets/text_field/text_field.dart';

// Images
export 'package:foody/shared/widgets/image/image.dart';

// Clickable Container
export 'package:foody/shared/widgets/clickable_container/clickable_container.dart';

// Other Widgets
export 'package:foody/shared/widgets/ripple_ink_well.dart';
export 'package:foody/shared/widgets/gap/gaph.dart';
export 'package:foody/shared/widgets/gap/gapw.dart';

// ============================================================================
// Utilities
// ============================================================================
// Screen Utilities
export 'package:foody/shared/utils/auto_layout/screen_utils.dart';
export 'package:foody/shared/utils/auto_layout/screen_size.dart';

// Extensions
export 'package:foody/shared/utils/extentions/list_extensions.dart';
export 'package:foody/shared/utils/extentions/map_extensions.dart';
export 'package:foody/shared/utils/extentions/number_format.dart';

// Other Utilities
export 'package:foody/shared/utils/skeleton_helper.dart';
export 'package:foody/shared/utils/print_colored.dart';
export 'package:foody/shared/utils/session_expired_util.dart';

// ============================================================================
// Core Components
// ============================================================================
// API Response
export 'package:foody/core/api_response/api_response_builder.dart';
export 'package:foody/core/api_response/api_response_builder_with_cache.dart';
export 'package:foody/core/api_response/api_response_handler.dart';
export 'package:foody/core/api_response/api_response_state/api_response_state.dart';
export 'package:foody/core/api_response/api_response_extensions.dart';

// Base Classes
export 'package:foody/core/base/view_model/base_view_model.dart';
export 'package:foody/core/base/repository/base_repo.dart';
export 'package:foody/core/base/repository/server_error_type_enum.dart';

// Data Sources
export 'package:foody/core/data/local/hive/hive_data_source.dart';
export 'package:foody/core/data/local/hive/base_local_data.dart';
export 'package:foody/core/data/local/secure_storage/secure_storage_data_source.dart';
export 'package:foody/core/data/local/secure_storage/base_secure_local_data.dart';
export 'package:foody/data/local/app_local_data.dart';
export 'package:foody/data/model/user/user.dart';
export 'package:foody/data/model/cart/cart_data.dart';
export 'package:foody/data/model/cart/cart_item.dart';
export 'package:foody/data/model/order/order.dart';
export 'package:foody/data/model/order_item/order_item.dart';
export 'package:foody/data/model/payment/payment.dart';
export 'package:foody/data/model/delivery/delivery.dart';
export 'package:foody/data/model/driver/driver.dart';
export 'package:foody/data/repo/order_repo.dart';
export 'package:foody/data/repo/order_item_repo.dart';
export 'package:foody/data/repo/payment_repo.dart';
export 'package:foody/data/repo/delivery_repo.dart';
export 'package:foody/data/repo/driver_repo.dart';
export 'package:foody/data/repo/cart_repo.dart';

// API Client
export 'package:foody/core/data/remote/api_client.dart';
export 'package:foody/core/data/remote/api_response_code.dart';
export 'package:foody/core/data/remote/api_upload_file.dart';
export 'package:foody/core/data/remote/models/error/server_error.dart';

// Firebase
export 'package:foody/core/data/remote/firebase/firebase_database_service.dart';
export 'package:foody/core/data/remote/firebase/firebase_auth_service.dart';

// Network
export 'package:foody/core/data/remote/network/connection_info.dart';

// Config
export 'package:foody/core/config/config.dart';
export 'package:foody/core/data/local/hive/hive_init.dart';

// Routing
export 'package:foody/core/routing/routes.dart';

// Localizations
export 'package:foody/l10n/generated/l10n.dart';

// Navigation
export 'package:foody/shared/utils/navigation/navigation.dart';

// State Management
export 'package:provider/provider.dart';

// Services
export 'package:foody/shared/services/package_info_service.dart';

export 'package:foody/core/api_response/api_response_extensions.dart';
