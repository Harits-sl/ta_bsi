import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_button.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_app_bar.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailEventPage extends StatelessWidget {
  const DetailEventPage(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> listDummyDetailEvent = [
      {
        'id': 'event-1',
        'image_url': 'assets/images/f_event_1.jpg',
        'title': 'Promo Dicoding Scolarship for Woman',
        'description':
            'Dicoding Scholarship for Women Beasiswa yang kami berikan adalah kesempatan belajar gratis di kelas Dicoding Academy. Kami persembahkan untukmu perempuan yang ingin memulai belajar atau mendalami IT. Semua pendaftar beasiswa akan mendapatkan kelas Meniti Karier sebagai Software Developer. Semua pendaftar berhak memilih salah satu dari kelas dasar Dicoding. Selamat Hari Perempuan Sedunia🌺 Terima kasih untuk kontribusinya dalam memajukan dunia digital Indonesia! ✅Untukmu perempuan yang ingin memulai berkontribusi dan mendalami dunia IT, Dicoding kembali memberikan persembahan istimewa: Dicoding Scholarship for Women ✨Kalian berkesempatan belajar GRATIS di kelas Dicoding Academy✨ Simak info lengkapnya dan segera daftarkan dirimu sekarang juga Pendaftaran dibuka sampai tanggal 24 Maret 2022📝',
        'link_regist': 'dicoding.com/p/womansday',
      },
      {
        'id': 'event-2',
        'image_url': 'assets/images/f_event_2.jpg',
        'title': ' GIT WORKFLOW',
        'description': """
          <p><span>✨ Informatika UMM X Data Science Club UMM ✨</span></p>
          <p><span>[[ Machine Learning Study Jam - MLSJ 2022 ]]</span></p>
          <p><span>Halohai, Data Buddies!</span></p>
          <p><span>Kami ada kabar baik nih! DSC-UMM memberikan subsidi bagi kalian untuk belajar ilmu super mahal senilai 1 Gelas Kopi Ajaloh! Khusus buat kalian yang ingin mempersiapkan karir dalam dunia Data, Machine Learning maupun Artificial Intelligence!</span></p>
          <p><span>Hanya dengan 15K pada setiap materi yang kami sediakan, kalian bisa investasi ilmu dan portfolio untuk karir dengan gaji jutaan rupiah! 💸</span></p>
          <p><span>"Pekan 1, Hari 1" kita akan mempelajari tentang: GIT WORKFLOW!</span></p>
          <p><span>Dimana materi Git merupakan fundamental yang paling penting untuk kalian berkolaborasi, pengaturan project, penyimpanan, dan masih banyak lagi!</span></p>
          <p><span>👨&zwj;💻 Pemateri: Software Engineer Intern di Tokopedia</span></p>
          <p><span>👩&zwj;💻 Moderator: Data Analyst Intern di PT Mitra Adiperkasa, Tbk</span></p>
          <p><span>Masih mikir apalagi?</span></p>
          <p><span>Buruan daftar di bit.ly/MLSJWeek1Git</span></p>
          <p><span>HTM: 250K disc 94% &rarr; 15K</span></p>
          <p><span>Platform: Zoom / Google Meet</span></p>
          <p><span>Tanggal: Jum'at, 4 Maret 2022</span></p>
          <p><span>Pukul : 19:00 WIB - Selesai</span></p>
          <p><span>BENEFIT:</span></p>
          <p><span>📑 E-Certificate</span></p>
          <p><span>📚 Modul Pembelajaran</span></p>
          <p><span>📚 Gratis Modul Dasar Machine Learning dari Dicoding (untuk semua pendaftar)</span></p>
          <p><span>📚 Gratis 20 Modul Advance Machine Learning dari Dicoding (untuk best team final project)</span></p>
          <p><span>📽 Rekaman Video</span></p>
          <p><span>🏆 Mentoring Google Solution Challenge</span></p>
          <p><span>🦾 Belajar Langsung Implementasi Machine Learning dari AI Engineer dan Software Engineer Expert</span></p>
          <p><span>Contact Person:</span></p>
          <ol>
          <li><span> 0857-0853-9196 (Arolina)</span></li>
          <li><span> 0895-3607-35691 (Firyal)</span></li>
          <li><span> 0877-8145-9042 (Khairunnisa)</span></li>
          <li><span> 0822-8491-8296 (Nurlaila)</span></li>
          </ol>
          <p><span>Semangat dan Jangan lewatkan Kesempatan Emas ini Data Buddies 🙌</span></p>
          <p><span>✨ The more you LEARN, the more you'll EARN - Warren Buffet ✨</span></p>
          <p><span>Acara ini di dukung oleh:</span></p>
          <p><span>* Dicoding @dicoding</span></p>
          <p><span>* Data Science Indonesia @datascienceindo</span></p>
          <p><span>* Kotakode @kotakode</span></p>
          <p><span>* Pedulidigital @pedulidigital</span></p>
          <p><span>* Data Science Club UMM @dsc_umm</span></p>
          <p><span>* Informatika UMM @informatika.umm</span></p>
          <p><span>Community partner:</span></p>
          <p><span>* GDSC UMM @gdsc.umm</span></p>
          <p><br /><br /></p>
        """,
        'link_regist': 'bit.ly/MLSJWeek1Git',
      },
      {
        'id': 'event-3',
        'image_url': 'assets/images/f_event_3.jpg',
        'title': 'Harisenin ClassX - Graphic & Motion Design',
        'description': """
  🚀 Build Your Future Career with Top Notch Expert 🚀

Risers, kini harisenin hadir dengan tampilan terbaru loh + materinya juga makin menarik😎

Sekarang Harisenin X Class hadir untuk membantumu dalam membangun karir dan mendapatkan pekerjaan yang kamu impikan di perusahaan ternama.

Bedanya dari sebelum nya itu sekarang kamu ga cuma belajar teori tapi ada sesi praktiknya dengan study case yang beneran, loh. Menarik banget kan?

Tenang, Harisenin X Class itu GRATIS. Selain itu kamu bakal dapet apa aja sih?😍

1. E-Certificate 📝
2. Praktik, simulasi, dan tanya jawab secara langsung💻
3. Relasi Baru🙎🏼‍♀️🙎🏼
4. Persiapan Menuju Karir Impian 💼👔
5. Meningkatkan Skill Yang Dibutuhkan Saat Ini 🎓
6. Mentor Berpengalaman & Dari Perusahaan Ternama ⭐️
7. Dan masih banyak lagi!!

Wah, Sudah kelasnya GRATIS terus dapet benefitnya yang keren keren. Tunggu apalagi? Jangan sampai kehabisan karena ini limited seat loh.

Ayo daftar sekarang juga dan berpartisipasi dalam #sadarharusbelajar bersama Harisenin.com! Sampai ketemu di kelas ya, Risers!

Daftar sekarang melalui link berikut:

Digital Marketing: harisenin.link/digmar6
Human Resources: harisenin.link/HumanResources12
Auditor & Financial Analyst: harisenin.link/audit5
Professional Sales: harisenin.link/sales5
UI/UX & Product Manager: harisenin.link/UIUX6
Graphic & Motion Design: harisenin.link/design6
Full Stack Web Developer: harisenin.link/Webdev6

""",
        'link_regist':
            'docs.google.com/forms/d/e/1FAIpQLSdR1JviNR1uaRKdowRwMKukSISfSned8h6HEw71wPmnUXIHGQ/viewform',
      },
      {
        'id': 'event-4',
        'image_url': 'assets/images/f_event_4.jpg',
        'title': 'Auditor & Financial Analyst',
        'description': """
  🚀 Build Your Future Career with Top Notch Expert 🚀

Risers, kini harisenin hadir dengan tampilan terbaru loh + materinya juga makin menarik😎

Sekarang Harisenin X Class hadir untuk membantumu dalam membangun karir dan mendapatkan pekerjaan yang kamu impikan di perusahaan ternama.

Bedanya dari sebelum nya itu sekarang kamu ga cuma belajar teori tapi ada sesi praktiknya dengan study case yang beneran, loh. Menarik banget kan?

Tenang, Harisenin X Class itu GRATIS. Selain itu kamu bakal dapet apa aja sih?😍

1. E-Certificate 📝
2. Praktik, simulasi, dan tanya jawab secara langsung💻
3. Relasi Baru🙎🏼‍♀️🙎🏼
4. Persiapan Menuju Karir Impian 💼👔
5. Meningkatkan Skill Yang Dibutuhkan Saat Ini 🎓
6. Mentor Berpengalaman & Dari Perusahaan Ternama ⭐️
7. Dan masih banyak lagi!!

Wah, Sudah kelasnya GRATIS terus dapet benefitnya yang keren keren. Tunggu apalagi? Jangan sampai kehabisan karena ini limited seat loh.

Ayo daftar sekarang juga dan berpartisipasi dalam #sadarharusbelajar bersama Harisenin.com! Sampai ketemu di kelas ya, Risers!

Daftar sekarang melalui link berikut:

Digital Marketing: harisenin.link/digmar6
Human Resources: harisenin.link/HumanResources12
Auditor & Financial Analyst: harisenin.link/audit5
Professional Sales: harisenin.link/sales5
UI/UX & Product Manager: harisenin.link/UIUX6
Graphic & Motion Design: harisenin.link/design6
Full Stack Web Developer: harisenin.link/Webdev6
""",
        'link_regist': 'harisenin.link/audit5',
      },
    ];

    /// filter atau mencari materi yang cocok dari argument id dengan
    /// listDummyCourse
    Map<String, dynamic> _event = listDummyDetailEvent
        .where((item) => item['id'] == arguments['id'])
        .toList()
        .first;

    void onTap(String url) async {
      if (!await launch(url)) throw 'Could not launch $url';
    }

    void onTapAppBar() {
      Go.back(context);
    }

    Widget eventImage() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Image.asset(_event['image_url']),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Html(data: _event['description']),
      );
    }

    Widget buttonRegistEvent() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CustomButton(
            title: 'Daftar Event',
            backgroundColor: primaryColor,
            borderRadius: 50,
            onPressed: () => onTap('https://${_event['link_regist']}'),
            textStyle: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    Widget body() {
      return SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                CustomAppBar(title: 'Event', onTap: onTapAppBar),
                eventImage(),
                description(),
              ],
            ),
            buttonRegistEvent(),
          ],
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
