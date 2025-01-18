import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/core/components/dialog/custom_dialog.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/features/app/presentation/bloc/bloc/app_bloc.dart';
import 'package:todo_bloc/features/auth/presentation/screens/login_screen.dart';
import 'package:todo_bloc/features/main/data/model/drawer_item_model.dart';
import 'package:todo_bloc/features/main/presentation/bloc/main_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  final String avtUrl =
      'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/465814452_1932369123841356_7386124771125468932_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHuG7m5rZwFAuyO-hkITG4GR9OOv80MuwBH046_zQy7AIp63z_O8yDZSVXh7yqTNnoYn-epggvCCXdHbpVFYwql&_nc_ohc=SdyliMwhNiAQ7kNvgH4rAyY&_nc_oc=AdhRXFsgx7-d16wtt7QeBQTItCizZbxdgxqrujpiUgi2K9SP9huiXvmbhuOWJTzUeBU&_nc_zt=23&_nc_ht=scontent.fdad1-4.fna&_nc_gid=AyksTbN975tvVzBD3LYe99K&oh=00_AYC1HmmO8dOE9H_jcffDy5zWWQPkKKEq6kgPKp7aReJBTg&oe=6790F521';
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColor.backgroundColor,
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) => ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    CircleAvatar(
                        radius: 40, backgroundImage: NetworkImage(avtUrl)),
                    const SizedBox(height: 12.0),
                    Text(
                      'Nguyễn Thanh Minh',
                      style: AppStyle.regular18,
                    )
                  ],
                ),
              ),
              ListView.builder(
                itemCount: drawerItems.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => _buildDrawerItem(
                  text: drawerItems[index].text,
                  icon: drawerItems[index].icon,
                  isSelected: state.screenType == drawerItems[index].screenType,
                  onTap: () {
                    context
                        .read<MainBloc>()
                        .add(SelectScreenEvent(drawerItems[index].screenType));
                    context.getNavigator.pop();
                  },
                ),
              ),
              _buildDrawerItem(
                text: 'Logout',
                icon: Icons.logout_outlined,
                isSelected: false,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                            titleText: 'Logout',
                            bodyText: 'Do you want to logout?',
                            onPressedOk: () => context
                                .read<AppBloc>()
                                .add(LogoutEvent('email')),
                          ));
                },
              ),
            ],
          ),
        ));
  }

  Widget _buildDrawerItem(
      {required String text,
      required IconData icon,
      bool isSelected = false,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
        decoration: BoxDecoration(
            color:
                isSelected ? AppColor.primaryColor : AppColor.backgroundColor),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColor.backgroundColor : AppColor.black,
              size: 24.0,
            ),
            const SizedBox(width: 10.0),
            Text(
              text,
              style: TextStyle(
                  fontSize: 24,
                  color:
                      isSelected ? AppColor.backgroundColor : AppColor.black),
            )
          ],
        ),
      ),
    );
  }
}
