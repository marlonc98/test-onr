import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_onr/domain/entities/user/user_entity.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_onr/presentation/ui/pages/user/list/users_list_page_view_model.dart';
import 'package:test_onr/presentation/ui/pages/user/list/widgets/user_card.dart';
import 'package:test_onr/presentation/ui/widgets/custom_bottom_navigation.dart';
import 'package:test_onr/presentation/ui/widgets/searcher_app_bar.dart';

class UsersListPage extends StatefulWidget {
  static const String route = '/users';
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UsersListPageViewModel>(
        create: (_) => UsersListPageViewModel(
            context: context, widget: widget, isMounted: () => mounted),
        child: Consumer<UsersListPageViewModel>(
            builder: (context, viewModel, child) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SearcherAppBar(
                  title: 'Users',
                  onSearch: viewModel.handleOnChangeQuery,
                ),
                PagedSliverList(
                  pagingController: viewModel.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<UserEntity>(
                    itemBuilder: (context, item, index) => Container(
                        margin: const EdgeInsets.only(
                            bottom: 8, left: 16, right: 16),
                        child: UserCard(user: item)),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
