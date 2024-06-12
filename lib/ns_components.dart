library ns_components;

import 'dart:math';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

//Components
part 'components/bottom_navigation_bar_item.dart';
part 'components/tab_bar.dart';
part 'components/scaffold.dart';
part 'components/simple_scaffold.dart';
part 'components/back_button.dart';
part 'components/add_button.dart';
part 'components/close_button.dart';
part 'components/divider.dart';
part 'components/action_button.dart';
part 'components/button.dart';
part 'components/list_tile.dart';
part 'components/list_section.dart';
part 'components/option_tile.dart';
part 'components/filled_icon.dart';
part 'components/tap_gesture.dart';
part 'components/modal_scaffold.dart';
part 'components/text_field.dart';
part 'components/ring_chart.dart';
part 'components/empty_state_widget.dart';
part 'components/disposable_section.dart';
part 'components/picker_page.dart';
part 'components/helperComponents/measure_size.dart';
part 'components/helperComponents/default_enabled_widget.dart';
part 'components/subComponents/int_text_field_suffix.dart';
part 'components/subComponents/check_mark.dart';
part 'components/subComponents/close_button_in_box.dart';
part 'components/subComponents/headline_in_box.dart';
part 'components/subComponents/disposable_widget.dart';
part 'components/models/widget.dart';
part 'components/models/stateless_widget.dart';

//Managers
part 'managers/analytics_manager.dart';
part 'managers/database_manager.dart';
part 'managers/navigation_manager.dart';
part 'managers/remote_config_manager.dart';
part 'managers/log_manager.dart';

//Resources
part 'resources/colors.dart';
part 'resources/decorations.dart';
part 'resources/paddings.dart';
part 'resources/constants.dart';
part 'resources/text_styles.dart';

//Utils
part 'utils/utils.dart';
part 'utils/context_extensions.dart';
part 'utils/collection_extensions.dart';
part 'utils/state_extensions.dart';
part 'utils/state.dart';
part 'utils/view_model.dart';
part 'utils/reactive.dart';
part 'utils/base_repository.dart';

//Models
part 'models/typedefs.dart';

//Shareds
part 'shared/views/settings/language_view.dart';
part 'shared/views/settings/language_navigation_link.dart';
part 'shared/views/settings/brightness_toggle.dart';
part 'shared/notifiers.dart';
part 'shared/localization.dart';
part 'shared/app.dart';
part 'shared/views/main_tabbar_view.dart';
