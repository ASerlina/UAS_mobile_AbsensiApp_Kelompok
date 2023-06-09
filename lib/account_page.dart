import 'package:flutter/material.dart';

//Hasil kerja Andi Haerul Fauzan Ramadhan
class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String namaWali = 'A. Serlina';
  String nip = '2111102441008';

  void showEditNameDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newNamaWali = namaWali;

        return AlertDialog(
          title: const Text('Edit Nama Wali'),
          content: TextField(
            onChanged: (value) {
              newNamaWali = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                setState(() {
                  namaWali = newNamaWali;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showEditNIPDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newNIP = nip;

        return AlertDialog(
          title: const Text('Edit NIP'),
          content: TextField(
            onChanged: (value) {
              newNIP = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                setState(() {
                  nip = newNIP;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 90,
                backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/128/3177/3177440.png',
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Text(
                  'SMK Muhammadiyah Adam Malik',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nama Wali: $namaWali',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showEditNameDialog();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.badge,
                  color: Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NIP: $nip',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showEditNIPDialog();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text(
                  'Info',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const ListTile(
              subtitle: Text(
                'Email: Cherry12@gmail.com\nNomor Telepon: 081234567890',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 //End Hasil Andi Haerul Fauzan Ramadhan