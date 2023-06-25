import 'package:animations/animations.dart';
import 'package:app/IdentificationPage.dart';
import 'package:app/Model/Authentication/SignUpRequestModel.dart';
import 'package:app/OtpValidationPage.dart';
import 'package:app/Service/Authentication/Authentication.dart';
import 'package:app/TermsAndConditions.dart';
import 'package:app/Utility/Utility.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Policy_Dialog.dart';

class SignUpPage extends StatefulWidget {
  final bool isAndroid;
  SignUpPage({
    super.key, required this.isAndroid,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isVisible = false;
  bool isChecked = false;
  String? dropdownValue = "Select One";
  bool isLoading = false;

  String? selectedState;
  String? selectedCity;

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController PhoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPasswrod = TextEditingController();
  TextEditingController address = TextEditingController();
  String gender = "";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Select One"), value: "Select One"),
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
    ];
    return menuItems;
  }

  List<NigeriaLocation> nigeriaLocations = [
    NigeriaLocation(
      state: 'Abia',
      cities: [
        'Aba North',
        'Aba South',
        'Arochukwu',
        'Bende',
        'Ikwuano',
        'Isiala Ngwa North',
        'Isiala Ngwa South',
        'Isuikwuato',
        'Obi Ngwa',
        'Ohafia',
        'Osisioma Ngwa',
        'Ugwunagbo',
        'Ukwa East',
        'Ukwa West',
        'Umuahia North',
        'Umuahia South',
        'Umu Nneochi'
      ],
    ),
    NigeriaLocation(
      state: 'Adamawa',
      cities: [
        'Demsa',
        'Fufore',
        'Ganye',
        'Girei',
        'Gombi',
        'Guyuk',
        'Hong',
        'Jada',
        'Lamurde',
        'Madagali',
        'Maiha',
        'Mayo-Belwa',
        'Michika',
        'Mubi North',
        'Mubi South',
        'Numan',
        'Shelleng',
        'Song',
        'Toungo',
        'Yola North',
        'Yola South'
      ],
    ),
    NigeriaLocation(
      state: 'Akwa Ibom',
      cities: [
        'Abak',
        'Eastern Obolo',
        'Eket',
        'Esit Eket',
        'Essien Udim',
        'Etim Ekpo',
        'Etinan',
        'Ibeno',
        'Ibesikpo Asutan',
        'Ibiono Ibom',
        'Ika',
        'Ikono',
        'Ikot Abasi',
        'Ikot Ekpene',
        'Ini',
        'Itu',
        'Mbo',
        'Mkpat Enin',
        'Nsit Atai',
        'Nsit Ibom',
        'Nsit Ubium',
        'Obot Akara',
        'Okobo',
        'Onna',
        'Oron',
        'Oruk Anam',
        'Ukanafun',
        'Udung Uko',
        'Uruan',
        'Urue-Offong/Oruko',
        'Uyo'
      ],
    ),
    NigeriaLocation(
      state: 'Anambra',
      cities: [
        'Aguata',
        'Anambra East',
        'Anambra West',
        'Anaocha',
        'Awka North',
        'Awka South',
        'Ayamelum',
        'Dunukofia',
        'Ekwusigo',
        'Idemili North',
        'Idemili South',
        'Ihiala',
        'Njikoka',
        'Nnewi North',
        'Nnewi South',
        'Ogbaru',
        'Onitsha North',
        'Onitsha South',
        'Orumba North',
        'Orumba South',
        'Oyi'
      ],
    ),
    NigeriaLocation(
      state: 'Bauchi',
      cities: [
        'Alkaleri',
        'Bauchi',
        'Bogoro',
        'Damban',
        'Darazo',
        'Dass',
        'Ganjuwa',
        'Giade',
        'Itas/Gadau',
        'Jama’are',
        'Katagum',
        'Kirfi',
        'Misau',
        'Ningi',
        'Shira',
        'Tafawa Balewa',
        'Toro',
        'Warji',
        'Zaki'
      ],
    ),
    NigeriaLocation(
      state: 'Bayelsa',
      cities: [
        'Brass',
        'Ekeremor',
        'Kolokuma/Opokuma',
        'Nembe',
        'Ogbia',
        'Sagbama',
        'Southern Ijaw',
        'Yenagoa'
      ],
    ),
    NigeriaLocation(
      state: 'Benue',
      cities: [
        'Ado',
        'Agatu',
        'Apa',
        'Buruku',
        'Gboko',
        'Guma',
        'Gwer East',
        'Gwer West',
        'Katsina-Ala',
        'Konshisha',
        'Kwande',
        'Logo',
        'Makurdi',
        'Obi',
        'Ogbadibo',
        'Ohimini',
        'Oju',
        'Okpokwu',
        'Otukpo',
        'Tarka',
        'Ukum',
        'Ushongo',
        'Vandeikya'
      ],
    ),
    NigeriaLocation(
      state: 'Borno',
      cities: [
        'Abadam',
        'Askira/Uba',
        'Bama',
        'Bayo',
        'Biu',
        'Chibok',
        'Damboa',
        'Dikwa',
        'Gubio',
        'Guzamala',
        'Gwoza',
        'Hawul',
        'Jere',
        'Kaga',
        'Kala/Balge',
        'Konduga',
        'Kukawa',
        'Kwaya Kusar',
        'Mafa',
        'Magumeri',
        'Maiduguri',
        'Marte',
        'Mobbar',
        'Monguno',
        'Ngala',
        'Nganzai',
        'Shani'
      ],
    ),
    NigeriaLocation(
      state: 'Cross River',
      cities: [
        'Abi',
        'Akamkpa',
        'Akpabuyo',
        'Bakassi',
        'Bekwarra',
        'Biase',
        'Boki',
        'Calabar Municipal',
        'Calabar South',
        'Etung',
        'Ikom',
        'Obanliku',
        'Obubra',
        'Obudu',
        'Odukpani',
        'Ogoja',
        'Yakuur',
        'Yala'
      ],
    ),
    NigeriaLocation(
      state: 'Delta',
      cities: [
        'Aniocha North',
        'Aniocha South',
        'Bomadi',
        'Burutu',
        'Ethiope East',
        'Ethiope West',
        'Ika North East',
        'Ika South',
        'Isoko North',
        'Isoko South',
        'Ndokwa East',
        'Ndokwa West',
        'Okpe',
        'Oshimili North',
        'Oshimili South',
        'Patani',
        'Sapele',
        'Udu',
        'Ughelli North',
        'Ughelli South',
        'Ukwuani',
        'Uvwie',
        'Warri North',
        'Warri South',
        'Warri South West'
      ],
    ),
    NigeriaLocation(
      state: 'Ebonyi',
      cities: [
        'Abakaliki',
        'Afikpo North',
        'Afikpo South',
        'Ebonyi',
        'Ezza North',
        'Ezza South',
        'Ikwo',
        'Ishielu',
        'Ivo',
        'Izzi',
        'Ohaozara',
        'Ohaukwu',
        'Onicha'
      ],
    ),
    NigeriaLocation(
      state: 'Edo',
      cities: [
        'Akoko-Edo',
        'Egor',
        'Esan Central',
        'Esan North-East',
        'Esan South-East',
        'Esan West',
        'Etsako Central',
        'Etsako East',
        'Etsako West',
        'Igueben',
        'Ikpoba-Okha',
        'Orhionmwon',
        'Oredo',
        'Ovia North-East',
        'Ovia South-West',
        'Owan East',
        'Owan West',
        'Uhunmwonde'
      ],
    ),
    NigeriaLocation(
      state: 'Ekiti',
      cities: [
        'Ado Ekiti',
        'Efon',
        'Ekiti East',
        'Ekiti South-West',
        'Ekiti West',
        'Emure',
        'Gbonyin',
        'Ido Osi',
        'Ijero',
        'Ikere',
        'Ikole',
        'Ilejemeje',
        'Irepodun/Ifelodun',
        'Ise/Orun',
        'Moba',
        'Oye'
      ],
    ),
    NigeriaLocation(
      state: 'Enugu',
      cities: [
        'Aninri',
        'Awgu',
        'Enugu East',
        'Enugu North',
        'Enugu South',
        'Ezeagu',
        'Igbo Etiti',
        'Igbo Eze North',
        'Igbo Eze South',
        'Isi Uzo',
        'Nkanu East',
        'Nkanu West',
        'Nsukka',
        'Oji River',
        'Udenu',
        'Udi',
        'Uzo Uwani'
      ],
    ),
    NigeriaLocation(
      state: 'Federal Capital Territory',
      cities: [
        'Abaji',
        'Abuja Municipal',
        'Bwari',
        'Gwagwalada',
        'Kuje',
        'Kwali'
      ],
    ),
    NigeriaLocation(
      state: 'Gombe',
      cities: [
        'Akko',
        'Balanga',
        'Billiri',
        'Dukku',
        'Funakaye',
        'Gombe',
        'Kaltungo',
        'Kwami',
        'Nafada',
        'Shongom',
        'Yamaltu/Deba'
      ],
    ),
    NigeriaLocation(
      state: 'Imo',
      cities: [
        'Aboh Mbaise',
        'Ahiazu Mbaise',
        'Ehime Mbano',
        'Ezinihitte',
        'Ideato North',
        'Ideato South',
        'Ihitte/Uboma',
        'Ikeduru',
        'Isiala Mbano',
        'Isu',
        'Mbaitoli',
        'Ngor Okpala',
        'Njaba',
        'Nkwerre',
        'Nwangele',
        'Obowo',
        'Oguta',
        'Ohaji/Egbema',
        'Okigwe',
        'Orlu',
        'Orsu',
        'Oru East',
        'Oru West',
        'Owerri Municipal',
        'Owerri North',
        'Owerri West',
        'Unuimo'
      ],
    ),
    NigeriaLocation(
      state: 'Jigawa',
      cities: [
        'Auyo',
        'Babura',
        'Biriniwa',
        'Birnin Kudu',
        'Buji',
        'Dutse',
        'Gagarawa',
        'Garki',
        'Gumel',
        'Guri',
        'Gwaram',
        'Gwiwa',
        'Hadejia',
        'Jahun',
        'Kafin Hausa',
        'Kaugama',
        'Kazaure',
        'Kiri Kasama',
        'Kiyawa',
        'Kaugama',
        'Maigatari',
        'Malam Madori',
        'Miga',
        'Ringim',
        'Roni',
        'Sule Tankarkar',
        'Taura',
        'Yankwashi'
      ],
    ),
    NigeriaLocation(
      state: 'Kaduna',
      cities: [
        'Birnin Gwari',
        'Chikun',
        'Giwa',
        'Igabi',
        'Ikara',
        'Jaba',
        'Jema’a',
        'Kachia',
        'Kaduna North',
        'Kaduna South',
        'Kagarko',
        'Kajuru',
        'Kaura',
        'Kauru',
        'Kubau',
        'Kudan',
        'Lere',
        'Makarfi',
        'Sabon Gari',
        'Sanga',
        'Soba',
        'Zangon Kataf',
        'Zaria'
      ],
    ),
    NigeriaLocation(
      state: 'Kano',
      cities: [
        'Ajingi',
        'Albasu',
        'Bagwai',
        'Bebeji',
        'Bichi',
        'Bunkure',
        'Dala',
        'Dambatta',
        'Dawakin Kudu',
        'Dawakin Tofa',
        'Doguwa',
        'Fagge',
        'Gabasawa',
        'Garko',
        'Garun Mallam',
        'Gaya',
        'Gezawa',
        'Gwale',
        'Gwarzo',
        'Kabo',
        'Kano Municipal',
        'Karaye',
        'Kibiya',
        'Kiru',
        'Kumbotso',
        'Kunchi',
        'Kura',
        'Madobi',
        'Makoda',
        'Minjibir',
        'Nasarawa',
        'Rano',
        'Rimin Gado',
        'Rogo',
        'Shanono',
        'Sumaila',
        'Takai',
        'Tarauni',
        'Tofa',
        'Tsanyawa',
        'Tudun Wada',
        'Ungogo',
        'Warawa',
        'Wudil'
      ],
    ),
    NigeriaLocation(
      state: 'Katsina',
      cities: [
        'Bakori',
        'Batagarawa',
        'Batsari',
        'Baure',
        'Bindawa',
        'Charanchi',
        'Dandume',
        'Danja',
        'Dan Musa',
        'Daura',
        'Dutsi',
        'Dutsin Ma',
        'Faskari',
        'Funtua',
        'Ingawa',
        'Jibia',
        'Kafur',
        'Kaita',
        'Kankara',
        'Kankia',
        'Katsina',
        'Kurfi',
        'Kusada',
        'Mai`Adua',
        'Malumfashi',
        'Mani',
        'Mashi',
        'Matazu',
        'Musawa',
        'Rimi',
        'Sabuwa',
        'Safana',
        'Sandamu',
        'Zango'
      ],
    ),
    NigeriaLocation(
      state: 'Kebbi',
      cities: [
        'Aleiro',
        'Arewa Dandi',
        'Argungu',
        'Augie',
        'Bagudo',
        'Birnin Kebbi',
        'Bunza',
        'Dandi',
        'Fakai',
        'Gwandu',
        'Jega',
        'Kalgo',
        'Koko/Besse',
        'Maiyama',
        'Ngaski',
        'Sakaba',
        'Shanga',
        'Suru',
        'Wasagu/Danko',
        'Yauri',
        'Zuru'
      ],
    ),
    NigeriaLocation(
      state: 'Kogi',
      cities: [
        'Adavi',
        'Ajaokuta',
        'Ankpa',
        'Bassa',
        'Dekina',
        'Ibaji',
        'Idah',
        'Igalamela Odolu',
        'Ijumu',
        'Kabba/Bunu',
        'Kogi',
        'Lokoja',
        'Mopa Muro',
        'Ofu',
        'Ogori/Magongo',
        'Okehi',
        'Okene',
        'Olamaboro',
        'Omala',
        'Yagba East',
        'Yagba West'
      ],
    ),
    NigeriaLocation(
      state: 'Kwara',
      cities: [
        'Asa',
        'Baruten',
        'Edu',
        'Ekiti',
        'Ifelodun',
        'Ilorin East',
        'Ilorin South',
        'Ilorin West',
        'Irepodun',
        'Isin',
        'Kaiama',
        'Moro',
        'Offa',
        'Oke Ero',
        'Oyun',
        'Pategi'
      ],
    ),
    NigeriaLocation(
      state: 'Lagos',
      cities: [
        'Agege',
        'Ajeromi-Ifelodun',
        'Alimosho',
        'Amuwo-Odofin',
        'Apapa',
        'Badagry',
        'Epe',
        'Eti Osa',
        'Ibeju-Lekki',
        'Ifako-Ijaiye',
        'Ikeja',
        'Ikorodu',
        'Kosofe',
        'Lagos Island',
        'Lagos Mainland',
        'Mushin',
        'Ojo',
        'Oshodi-Isolo',
        'Shomolu',
        'Surulere'
      ],
    ),
    NigeriaLocation(
      state: 'Nasarawa',
      cities: [
        'Akwanga',
        'Awe',
        'Doma',
        'Karu',
        'Keana',
        'Keffi',
        'Kokona',
        'Lafia',
        'Nasarawa',
        'Nasarawa Egon',
        'Obi',
        'Toto',
        'Wamba'
      ],
    ),
    NigeriaLocation(
      state: 'Niger',
      cities: [
        'Agaie',
        'Agwara',
        'Bida',
        'Borgu',
        'Bosso',
        'Chanchaga',
        'Edati',
        'Gbako',
        'Gurara',
        'Katcha',
        'Kontagora',
        'Lapai',
        'Lavun',
        'Magama',
        'Mariga',
        'Mashegu',
        'Mokwa',
        'Muya',
        'Pailoro',
        'Rafi',
        'Rijau',
        'Shiroro',
        'Suleja',
        'Tafa',
        'Wushishi'
      ],
    ),
    NigeriaLocation(
      state: 'Ogun',
      cities: [
        'Abeokuta North',
        'Abeokuta South',
        'Ado-Odo/Ota',
        'Ewekoro',
        'Ifo',
        'Ijebu East',
        'Ijebu North',
        'Ijebu North East',
        'Ijebu Ode',
        'Ikenne',
        'Imeko Afon',
        'Ipokia',
        'Obafemi-Owode',
        'Odeda',
        'Odogbolu',
        'Ogun Waterside',
        'Remo North',
        'Sagamu',
        'Yewa North',
        'Yewa South'
      ],
    ),
    NigeriaLocation(
      state: 'Ondo',
      cities: [
        'Akoko North-East',
        'Akoko North-West',
        'Akoko South-East',
        'Akoko South-West',
        'Akure North',
        'Akure South',
        'Ese Odo',
        'Idanre',
        'Ifedore',
        'Ilaje',
        'Ile Oluji/Okeigbo',
        'Irele',
        'Odigbo',
        'Okitipupa',
        'Ondo East',
        'Ondo West',
        'Ose',
        'Owo'
      ],
    ),
    NigeriaLocation(
      state: 'Osun',
      cities: [
        'Atakunmosa East',
        'Atakunmosa West',
        'Aiyedaade',
        'Aiyedire',
        'Boluwaduro',
        'Boripe',
        'Ede North',
        'Ede South',
        'Egbedore',
        'Ejigbo',
        'Ife Central',
        'Ife East',
        'Ife North',
        'Ife South',
        'Ifedayo',
        'Ifelodun',
        'Ila',
        'Ilesa East',
        'Ilesa West',
        'Irepodun',
        'Irewole',
        'Isokan',
        'Iwo',
        'Obokun',
        'Odo Otin',
        'Ola Oluwa',
        'Olorunda',
        'Oriade',
        'Orolu',
        'Osogbo'
      ],
    ),
    NigeriaLocation(
      state: 'Oyo',
      cities: [
        'Afijio',
        'Akinyele',
        'Atiba',
        'Atigbo',
        'Egbeda',
        'Ibadan North',
        'Ibadan North-East',
        'Ibadan North-West',
        'Ibadan South-East',
        'Ibadan South-West',
        'Ibarapa Central',
        'Ibarapa East',
        'Ibarapa North',
        'Ido',
        'Irepo',
        'Iseyin',
        'Itesiwaju',
        'Iwajowa',
        'Kajola',
        'Lagelu',
        'Ogbomosho North',
        'Ogbomosho South',
        'Ogo Oluwa',
        'Olorunsogo',
        'Oluyole',
        'Ona Ara',
        'Orelope',
        'Ori Ire',
        'Oyo East',
        'Oyo West',
        'Saki East',
        'Saki West',
        'Surulere'
      ],
    ),
    NigeriaLocation(
      state: 'Plateau',
      cities: [
        'Barkin Ladi',
        'Bassa',
        'Bokkos',
        'Jos East',
        'Jos North',
        'Jos South',
        'Kanam',
        'Kanke',
        'Langtang North',
        'Langtang South',
        'Mangu',
        'Mikang',
        'Pankshin',
        'Qua\'an Pan',
        'Riyom',
        'Shendam',
        'Wase'
      ],
    ),
    NigeriaLocation(
      state: 'Rivers',
      cities: [
        'Abua/Odual',
        'Ahoada East',
        'Ahoada West',
        'Akuku-Toru',
        'Andoni',
        'Asari-Toru',
        'Bonny',
        'Degema',
        'Eleme',
        'Emohua',
        'Etche',
        'Gokana',
        'Ikwerre',
        'Khana',
        'Obio/Akpor',
        'Ogba/Egbema/Ndoni',
        'Ogu/Bolo',
        'Okrika',
        'Omuma',
        'Opobo/Nkoro',
        'Oyigbo',
        'Port Harcourt',
        'Tai'
      ],
    ),
    NigeriaLocation(
      state: 'Sokoto',
      cities: [
        'Binji',
        'Bodinga',
        'Dange Shuni',
        'Gada',
        'Goronyo',
        'Gudu',
        'Gwadabawa',
        'Illela',
        'Isa',
        'Kebbe',
        'Kware',
        'Rabah',
        'Sabon Birni',
        'Shagari',
        'Silame',
        'Sokoto North',
        'Sokoto South',
        'Tambuwal',
        'Tangaza',
        'Tureta',
        'Wamako',
        'Wurno',
        'Yabo'
      ],
    ),
    NigeriaLocation(
      state: 'Taraba',
      cities: [
        'Ardo Kola',
        'Bali',
        'Donga',
        'Gashaka',
        'Gassol',
        'Ibi',
        'Jalingo',
        'Karim Lamido',
        'Kumi',
        'Lau',
        'Sardauna',
        'Takum',
        'Ussa',
        'Wukari',
        'Yorro',
        'Zing'
      ],
    ),
    NigeriaLocation(
      state: 'Yobe',
      cities: [
        'Bade',
        'Bursari',
        'Damaturu',
        'Fika',
        'Fune',
        'Geidam',
        'Gujba',
        'Gulani',
        'Jakusko',
        'Karasuwa',
        'Machina',
        'Nangere',
        'Nguru',
        'Potiskum',
        'Tarmuwa',
        'Yunusari',
        'Yusufari'
      ],
    ),
    NigeriaLocation(
      state: 'Zamfara',
      cities: [
        'Anka',
        'Bakura',
        'Birnin Magaji/Kiyaw',
        'Bukkuyum',
        'Bungudu',
        'Gummi',
        'Gusau',
        'Kaura Namoda',
        'Maradun',
        'Maru',
        'Shinkafi',
        'Talata Mafara',
        'Chafe',
        'Zurmi'
      ],
    ),
  ];

  List<DropdownMenuItem<String>> _buildStateDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (var location in nigeriaLocations) {
      final truncatedText = location.state.length > 7
          ? '${location.state.substring(0, 7)}...' // Truncate text if longer than 15 characters
          : location.state;

      items.add(
        DropdownMenuItem(
          value: location.state,
          child: Tooltip(
            message: location.state,
            child: Text(truncatedText),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<String>> _buildCityDropdownItems(String selectedState) {
    List<DropdownMenuItem<String>> items = [];
    for (var location in nigeriaLocations) {
      if (location.state == selectedState) {
        for (var city in location.cities) {
          final truncatedText = city.length > 8
              ? '${city.substring(0, 8)}...' // Truncate text if longer than 15 characters
              : city;

          items.add(
            DropdownMenuItem(
              value: city,
              child: Tooltip(
                message: city,
                child: Text(truncatedText),
              ),
            ),
          );
        }
        break;
      }
    }
    return items;
  }

  Color getColor(Set<MaterialState> states) {
    Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color(0xFF2D0051);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(30.5),
            right: getProportionateScreenWidth(30.5)),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(47),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Color(0xff979797),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "SignUp",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        color: Color(0xFF2D0051)),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(28)),
              Text(
                "Welcome to Bebspay,",
                style: TextStyle(
                    color: Color(0xffA9A5AF),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Opensans',
                    fontSize: 24),
              ),
              Text(
                "Create a free account",
                style: TextStyle(
                    color: Color(0xffA9A5AF),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: getProportionateScreenHeight(45),
              ),
              TextFormField(
                controller: firstname,
                decoration: InputDecoration(
                  labelText: "Firstname",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              TextFormField(
                controller: lastname,
                decoration: InputDecoration(
                  labelText: "Lastname",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(46)),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return "Please enter a valid email";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              TextFormField(
                controller: PhoneNumber,
                decoration: InputDecoration(
                  labelText: "PhoneNumber",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11)
                ],
                keyboardType: TextInputType.number,
              ),

              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              TextFormField(
                controller: password,
                obscureText: !isVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    color: Color(0xff979797),
                    icon: !isVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return "Password must contain at least 8 characters, 1 uppercase, 1 lowercase, 1 number and 1 special character";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              TextFormField(
                controller: confirmPasswrod,
                obscureText: !isVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    color: Color(0xff979797),
                    icon: !isVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return "Password must contain at least 8 characters, 1 uppercase, 1 lowercase, 1 number and 1 special character";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797))),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)),
                    ),
                    filled: false,
                    labelText: "Gender",
                    labelStyle: TextStyle(color: Color(0xff979797)),
                  ),
                  //dropdownColor: Colors.blueAccent,
                  //value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
                  items: dropdownItems),

              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              TextFormField(
                controller: address,
                decoration: InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff979797))),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff979797)),
                          ),
                          filled: false,
                          labelText: "State",
                          labelStyle: TextStyle(color: Color(0xff979797)),
                        ),
                        //dropdownColor: Colors.blueAccent,
                        //value: dropdownValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedState = value;
                            selectedCity = null;
                          });
                        },
                        items: _buildStateDropdownItems()),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(65),
                  ),
                  Expanded(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff979797))),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797)),
                      ),
                      filled: false,
                      labelText: "LGA",
                      labelStyle: TextStyle(color: Color(0xff979797)),
                    ),
                    //dropdownColor: Colors.blueAccent,
                    //value: dropdownValue,
                    items: selectedState != null
                        ? _buildCityDropdownItems(selectedState!)
                        : [],
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCity = newValue;
                        
                      });
                    },
                  )),
                ],
              ),

              SizedBox(
                height: getProportionateScreenHeight(64),
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                        style: BorderStyle.solid,
                      ),
                      checkColor: Theme.of(context).primaryColor,
                      focusColor: Theme.of(context).primaryColor,
                      hoverColor: Theme.of(context).primaryColor,
                      activeColor: Colors.transparent,
                      //fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Text(
                    "I agree to the ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) =>  TermsAndCondtions()));
                      //  TermsAndCondtions();
                      showModal(
                        context: context,
                        configuration: FadeScaleTransitionConfiguration(),
                        builder: (context) {
                          return PolicyDialog(
                            mdFileName: 'TermsCondition.md',
                          );
                        },
                      );
                    },
                    child: Text(
                      "terms and conditons",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff9766D5),
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              isLoading ? MyLoadingButton():
              MyButton(
                text: ("Submit"),
                onTap: isChecked
                    ? () async {
                        if (await hasInternetConnection()) {
                          storeEmail(email.text);
                          setState(() {
                            isLoading = true;
                          });
                          var signup = await SignUp(new SignUpRequestModel(
                              firstname: firstname.text,
                              lastname: lastname.text,
                              email: email.text,
                              password: password.text,
                              phoneNumber: PhoneNumber.text,
                              lga: selectedCity!,
                              address: address.text,
                              state: selectedState!,
                              gender: gender, isAndroid: widget.isAndroid));
                          if (signup != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtpValidation(
                                        text:
                                            "Check your email for the confirmation code required to Activate your account",
                                        isPasswordReset: false)));
                          }
                        }
                        setState(() {
                          isLoading = false;
                        });
                      }
                    : null,
                enabled: isChecked,
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class NigeriaLocation {
  final String state;
  final List<String> cities;

  NigeriaLocation({required this.state, required this.cities});
}
