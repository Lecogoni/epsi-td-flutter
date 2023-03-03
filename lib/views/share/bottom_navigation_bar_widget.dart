import 'package:app/models/location.dart';
import 'package:flutter/material.dart';
import 'package:app/views/share/badge_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
    final int indexSelected;
  const BottomNavigationBarWidget(this.indexSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isUserNotConnected = true;
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indexSelected,
        items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil'
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Recherche'
        ),
        BottomNavigationBarItem(
          icon: isUserNotConnected ? 
            const Icon(Icons.shopping_cart_outlined) : 
            BadgeWidget(
              value: 0, top: 0, right: 0, color: Colors.white,
              child: const Icon(Icons.shopping_cart),
            ),
          label: 'locations',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'profil',
        ),
      ],

      onTap: (index) {
        String page = '/';
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            // Navigator.pushNamed(context, 'loclist');
            break;
          case 2:
            Navigator.pushNamed(context, 'loclist');
            break;
          case 3:
            Navigator.pushNamed(context, 'profil');
            break;
        }
        // Navigator.pushAndRemoveUntil(
        //   context, page, (route) => false);
      },
        
      );
  }
}
