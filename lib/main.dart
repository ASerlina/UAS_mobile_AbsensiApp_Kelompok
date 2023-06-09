import 'package:flutter/material.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'account_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

//HASIL KERJA A. SERLINA
class _MyAppState extends State<MyApp> {
  final TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  List<String> classNames = [
    'Kelas A',
    'Kelas B',
    'Kelas C',
    'Kelas D',
  ];
  List<String> filteredClassNames = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    filteredClassNames = classNames;
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  //HASIL KERJA ANDI HAERUL FAUZAN RAMADHAN
  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    switch (currentIndex) {
      case 0:
        currentScreen = isSearching
            ? ListView.builder(
                itemCount: filteredClassNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredClassNames[index]),
                  );
                },
              )
            : const HomePage();
        break;
      case 1:
        currentScreen = const SettingsPage();
        break;
      default:
        currentScreen = const AccountPage();
        break;
    }
    //END KERJA ANDI HAERUL FAUZAN RAMADHAN

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Absensi Siswa',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Absensi Siswa',
                style: TextStyle(
                  fontFamily: 'Bahnschrift Condensed',
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              Text(
                'SMK Muhammadiyah Adam Malik',
                style: TextStyle(
                  fontFamily: 'Bahnschrift Condensed',
                  fontSize: 12,
                  color: Color.fromARGB(255, 121, 121, 121),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: isSearching
                  ? const Icon(Icons.close,
                      color: Color.fromARGB(255, 170, 170, 170))
                  : const Icon(Icons.search,
                      color: Color.fromARGB(255, 170, 170, 170)),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  if (!isSearching) {
                    searchController.clear();
                    filteredClassNames = classNames;
                  }
                });
              },
            ),
            const SizedBox(width: 0),
            IconButton(
              icon: const Icon(Icons.offline_share,
                  color: Color.fromARGB(255, 170, 170, 170)),
              onPressed: () {},
            ),
            const SizedBox(width: 0),
            IconButton(
              icon: const Icon(Icons.more_vert,
                  color: Color.fromARGB(255, 170, 170, 170)),
              onPressed: () {},
            ),
          ],
          bottom: isSearching
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(48.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      onChanged: (value) {
                        setState(() {
                          filteredClassNames = classNames
                              .where((name) => name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Cari...',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                )
              : null,
        ),
        body: currentScreen,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: const Color.fromARGB(255, 85, 173, 255),
          unselectedItemColor: const Color.fromARGB(255, 124, 122, 122),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle:
              const TextStyle(color: Color.fromARGB(255, 85, 173, 255)),
          unselectedLabelStyle:
              const TextStyle(color: Color.fromARGB(255, 124, 122, 122)),
          currentIndex: currentIndex,
          onTap: onTabTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Pengaturan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}
//END KERJA A. SERLINA
