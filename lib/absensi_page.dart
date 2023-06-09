import 'package:flutter/material.dart';

class AbsensiPage extends StatefulWidget {
  final String className;

  const AbsensiPage({super.key, required this.className});

  @override
  // ignore: library_private_types_in_public_api
  _AbsensiPageState createState() => _AbsensiPageState();
}

//HASIL KERJA A. SERLINA
class _AbsensiPageState extends State<AbsensiPage>
    with SingleTickerProviderStateMixin {
  String absenDetail = "";
  late TabController _tabController;
  Map<String, List<String>> students = {
    'Kelas A': [
      'Sri Ani               ',
      'Budi Hidayat     ',
      'Cici pahlevi       ',
      'Doni Wibowo   ',
      'Nur Eva             ',
      'Ahmad Rama    ',
      'Sasa Farasyah   ',
      'Tia Nur             ',
      'Umi Fahmi        ',
      'Vino Sbastian   ',
      'Fitri Azahrah     '
    ],
    'Kelas B': [
      'Fahri Sanjaya    ',
      'Gita Wirawan     ',
      'Hadian           ',
      'Ina Ayu               ',
      'Jono             ',
      'Lia Angelin      ',
      'Mila Harmila     ',
      'Nita Dewi            ',
      'Ola Ramlan       ',
      'Pia Arsya        ',
      'Miranda          ',
      'Nur Nina         ',
      'Oscar            ',
    ],
    'Kelas C': [
      'Kris Hatta       ',
      'Lina Aya         ',
      'Miranda          ',
      'Nur Nina         ',
      'Oscar            ',
      'Gading Dirga     ',
      'Hendra Ananda    ',
      'Indra Agus       ',
      'Jaka Aril        ',
      'Kiki Sadewi      '
    ],
    'Kelas D': [
      'Puspita          ',
      'Rani Anti        ',
      'Sari Ayu         ',
      'Tari Ami         ',
      'Umi Pipit        ',
      'Vera Savira      ',
      'Wira Irawan      ',
      'Yani Arianti     ',
      'Zaki Hidayat     ',
      'Agus Ananda      ',
      'Hendra Ananda    ',
      'Indra Agus       ',
      'Jaka Aril        ',
      'Kiki Sadewi      '
    ]
  };

  Map<String, String?> attendance = {};

  @override
  void initState() {
    super.initState();
    attendance = {
      for (var student in students[widget.className]!)
        student: 'Tidak Mengisi Absen'
    };
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Tambah Nama Siswa
  void _openAddStudentDialog() async {
    String? newStudentName = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: const Text('Tambah Siswa'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Nama Siswa',
            ),
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
                Navigator.of(context).pop(controller.text);
              },
            ),
          ],
        );
      },
    );
    if (newStudentName != null && newStudentName.isNotEmpty) {
      setState(() {
        students[widget.className]!.add(newStudentName);
        attendance[newStudentName] = 'Hadir';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.className,
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.blue,
            unselectedLabelColor: const Color.fromARGB(255, 170, 170, 170),
            tabs: const [
              Tab(text: "Absensi"),
              Tab(text: "Keterangan"),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.search,
                  color: Color.fromARGB(255, 170, 170, 170)),
              onPressed: () {},
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: students[widget.className]!.length,
              itemBuilder: (context, index) {
                String student = students[widget.className]![index];
                return Column(
                  children: [
                    if (index == 0)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    _openAddStudentDialog();
                                  },
                                ),
                                Text(
                                  "Jumlah Siswa: ${students[widget.className]!.length}",
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Row(
                                  children: const [
                                    SizedBox(width: 5),
                                    Text("Hadir",
                                        style: TextStyle(color: Colors.black)),
                                    SizedBox(width: 5),
                                    Text("Izin",
                                        style: TextStyle(color: Colors.black)),
                                    SizedBox(width: 5),
                                    Text("Sakit",
                                        style: TextStyle(color: Colors.black)),
                                    SizedBox(width: 5),
                                    Text("Alfa",
                                        style: TextStyle(color: Colors.black)),
                                    SizedBox(width: 5),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              height: 20,
                              thickness: 2,
                              indent: 1,
                              endIndent: 1,
                            ),
                          ],
                        ),
                      ),

                    // HASIL KERJA CINDY AZRA SALSABILA
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              Text('${index + 1}.            $student'),
                              const Spacer(),
                              Row(
                                children: [
                                  const SizedBox(width: 5),
                                  Radio<String>(
                                    value: 'HADIR',
                                    groupValue: attendance[student],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        attendance[student] = newValue;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  Radio<String>(
                                    value: 'IZIN',
                                    groupValue: attendance[student],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        attendance[student] = newValue;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  Radio<String>(
                                    value: 'SAKIT',
                                    groupValue: attendance[student],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        attendance[student] = newValue;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  Radio<String>(
                                    value: 'ALFA',
                                    groupValue: attendance[student],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        attendance[student] = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(height: 8),
                        ],
                      ),
                    ),
                    //END KERJA CINDY AZRA SALSABILA
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Text(
                          absenDetail,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: students[widget.className]!.length,
              itemBuilder: (context, index) {
                String student = students[widget.className]![index];
                return ListTile(
                  title: Text(student),
                );
              },
            ),
          ],
        ),
        floatingActionButton: _tabController.index == 0
            ? FloatingActionButton(
                onPressed: () {
                  String result = 'Absensi ${widget.className}\n';
                  DateTime currentDate = DateTime.now();
                  String formattedDate = "Tanggal Absen: "
                      '${currentDate.day}/${currentDate.month}/${currentDate.year}\n\n';
                  for (var entry in attendance.entries) {
                    result += '${entry.key}: ${entry.value ?? 'Tidak absen'}\n';
                  }
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Keterangan'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(formattedDate),
                          Text(result),
                        ],
                      ),
                    ),
                  ).then((value) {
                    setState(() {
                      absenDetail = formattedDate + result;
                    });
                  });
                },
                child: const Icon(Icons.check),
              )
            : null,
      ),
    );
  }
}
//END KERJA A. SERLINA
