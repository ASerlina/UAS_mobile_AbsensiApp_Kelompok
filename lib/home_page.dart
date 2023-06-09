import 'package:flutter/material.dart';
import 'absensi_page.dart';

//Hasil Kerja A. Serlina
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, List<String>> students = {
    'Kelas A': [
      'Sri Ani',
      'Budi Hidayat',
      'Cici pahlevi',
      'Doni Wibowo',
      'Nur Eva',
      'Ahmd Rama',
      'Sasa Farasyah',
      'Tia Nur',
      'Umi Fahmi',
      'Vino Sbastian',
      'Fitri Azahrah'
    ],
    'Kelas B': [
      'Fahri Sanjaya',
      'Gita Wirawan',
      'Hadian',
      'Ina Ayu',
      'Jono',
      'Lia Angelin',
      'Mila Harmila',
      'Nita Dewi',
      'Ola Ramlan',
      'Pia Arsya',
      'Miranda',
      'Nur Nina',
      'Oscar',
    ],
    'Kelas C': [
      'Kris Hatta',
      'Lina Aya',
      'Miranda',
      'Nur Nina',
      'Oscar',
      'Gading Dirga',
      'Hendra Ananda',
      'Indra Agus',
      'Jaka Aril',
      'Kiki Sadewi'
    ],
    'Kelas D': [
      'Puspita',
      'Rani Anti',
      'Sari Ayu',
      'Tari Ami',
      'Umi Pipit',
      'Vera Savira',
      'Wira Irawan',
      'Yani Arianti',
      'Zaki Hidayat',
      'Agus Ananda',
      'Hendra Ananda',
      'Indra Agus',
      'Jaka Aril',
      'Kiki Sadewi'
    ]
  };
  // Edit Kelas
  void _showEditClassNameDialog(String className) {
    TextEditingController classNameController =
        TextEditingController(text: className);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit nama kelas'),
          content: TextField(
            controller: classNameController,
            decoration: const InputDecoration(hintText: 'Nama kelas'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                String newClassName = classNameController.text.trim();
                if (newClassName.isNotEmpty) {
                  setState(() {
                    students[newClassName] = students.remove(className)!;
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

// Hapus Kelas
  void _showDeleteClassNameDialog(String className) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus nama kelas'),
          content: Text('Anda yakin ingin menghapus kelas $className?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Hapus'),
              onPressed: () {
                setState(() {
                  students.remove(className);
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
      body: ListView.separated(
        itemCount: students.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Color.fromARGB(255, 158, 158, 158),
          height: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          String className = students.keys.elementAt(index);
          int studentCount = students.values.elementAt(index).length;
          return ListTile(
            title: Text(className),
            subtitle: Text('Jumlah siswa: $studentCount'),
            trailing: PopupMenuButton(
              onSelected: (result) {
                if (result == 'edit') {
                  _showEditClassNameDialog(className);
                } else if (result == 'delete') {
                  _showDeleteClassNameDialog(className);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Hapus'),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AbsensiPage(className: className),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String className = '';
              return AlertDialog(
                title: const Text('Tambah Kelas'),
                content: TextField(
                  onChanged: (value) {
                    className = value;
                  },
                  decoration: const InputDecoration(hintText: 'Nama Kelas'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Batal'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        students[className] = [];
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Simpan'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

//End Hasil A. Serlina
