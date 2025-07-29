import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, //Apbarda geri butonunu gizler
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text(
                "Jade Collins",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('images/profile.png'),
                backgroundColor: Colors.transparent, // İsteğe bağlı
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //Personel Card Kısmı
            Card(
              color: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Text(
                      "Person",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.person_2_outlined),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down_outlined, size: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            //Favorite - Wallet - Orders Kısımları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: 100,
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/star.png"),
                        SizedBox(height: 12),
                        Text(
                          "Favorite",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    width: 100,
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/wallet.png"),
                        SizedBox(height: 12),
                        Text(
                          "Favorite",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    width: 100,
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/received.png"),
                        SizedBox(height: 12),
                        Text(
                          "Favorite",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            //LisTile -Card
            Card(
              color: Colors.white,
              elevation: 0, // Gölgeyi kaldırır
              child: ListTile(
                leading: Icon(Icons.local_offer),
                title: Text(
                  "Promations",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Exclusive deals for you",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 0, // Gölgeyi kaldırır
              child: ListTile(
                leading: Icon(Icons.emoji_events_outlined),
                title: Text(
                  "Send Feedback",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 0, // Gölgeyi kaldırır
              child: ListTile(
                leading: Image.asset("images/air.png"),
                title: Text("Send Feedback"),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 0, // Gölgeyi kaldırır
              child: ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text(
                  "App Preferences",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              elevation: 0, // Gölgeyi kaldırır
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.phone_outlined),
                title: Text(
                  "Support",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              elevation: 0, // Gölgeyi kaldırır
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(
                  "About Ovenly",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Passion for pizza explained",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
