import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/unauthorized_user_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../../../env.sample.dart';
import '../../../../../../../injection_container.dart';
import 'InternetConnChecker.dart';
import 'package:http/http.dart' as http;

// var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;

class LoginPage extends StatelessWidget with GetItMixin {
  int responseStatus;

  List<String> EmailDB = [
    'keerthan@arkpower.co.in',
    'shankar2space@gmail.com',
    'arkpower24@gmail.com',
    'er.sathishgibbs@gmail.com',
    'manikanda@arkpower.co.in',
    'sivabalanbeeee@gmail.com',
    'raj@arkpower.co.in',
    'varaprasad@arkpower.co.in',
    'raghunath@arkpower.co.in',
    'bangaloreSBI@arkpower.co.in',
    'abhishek@arkpower.co.in',
    'keerthan@arkpower.co.in',
    'rakshith@arkpower.co.in',
    'manikanda@arkpower.co.in',
    'pnc@arkpower.co.in',
    'tr.dayalan@arkpower.co.in',
    'vijaykumar@arkpower.co.in',
    'devendran.p@arkpower.co.in',
    'sayyed@arkpower.co.in',
    'shaon@arkpower.co.in',
    'shambhu@arkpower.co.in',
    'trichy@arkpower.co.in',
    'hyderabad@arkpower.co.in',
    'abc@xyz',
    'karunmozhiski@gmail.com',
    'sivabalanbeeee@gmail.com',
    'er.sathishgibbs@gmail.com',
    'jinendiran1010@gmail.com',
    'svjana22@gmail.com',
    'bangalore@arkpower.co.in',
    'abriyaz143@gmail.com',
    'sarnag22@gmail.com',
    'vssakthi13@gmail.com',
    'anantulamahendar@gmail.com',
    'mohammedapsarkabeer@gmail.com',
    'bangaloreCC@arkpower.co.in',
    'bangaloreOD@arkpower.co.in',
    'kalyanr1945@gmail.com',
    'nishainaik1998@gmail.com',
    'chandrashekar72644@gmail.com',
    'kingsiva0903@gmail.com',
    'mrhariraja@gmail.com',
    'dharanidharan747@gmail.com',
    'karthiarmy1995@gmail.com',
    'earulraj007@gmail.com',
    'balveersarve@gmail.com',
    'siddur660@gmail.com',
    'sanjaykrishna2040@gmail.com',
    'saisk3884@gmail.com',
    'kkumargovind77@gmail.com',
    'nileshsmb@gmail.com',
    'umeshpg98062@gmail.com',
    'shariftarafdar41@gmail.com',
    'murthyshilpa201990@gmail.com',
    'manojkumark987654@gmail.com',
    'alamelur864@gmail.com',
    'sangeethaark007@gmail.com',
    'ps@arkpower.co.in',
    'rajiv.kbhatt5@gmail.com',
    'goudachamegouda@gmail.com',
    'sugumar61200@gmail.com',
    'prakashnithi1999@gmail.com',
    'rabiallwynp@gmail.com',
    'logeshwaranppm@gmail.com',
    'mvignesh4v@gmail.com',
    'divakars6035@gmail.com',
    'ayyapparaj6666@gmail.com',
    'dinakarananandaneee@gmail.com',
    'maltesh@arkpower.co.in',
    'sivakumarsingaram.1974@gmail.com',
    'accounts@arkpower.co.in',
    'megharajgoravar@gmail.com',
    'Aishwaryaaishu0203@gmail.com',
    'titussam4year@gmail.com',
    'murthyngowda426@gmail.com',
    'harishnaikdl1995@gmail.com',
    'prabhumahendra81@gmail.com',
    'mrt99130@gmail.com',
    'mounika@arkpower.com',
    'niranjanmniranjanm020@gmail.com',
    'hishaamfayas807@gmail.com',
    'dineshvajendiran082@gmail.com',
    'muthukumar567@gmail.com',
    'akashm7406101143@gmail.com',
    'siddalingcm143@gmail.com',
    'saikumarrobin@gmail.com',
    'madhankumar.eee123@gmail.com',
    'hr@arkpower.co.in',
    'maha291265@gmail.com',
    'ramaduraia@gmail.com',
    'Swativishnu@gmail.com',
    'Shankar2space@gmail.com',
    'business@arkpower.co.in',
    'guruodesh@gmail.com',
    'Karthiarmy1995@gmail.com',
  ];

  @override
  Widget build(BuildContext context) {
    final model = watchOnly((GoogleSignInController x) => x.googleAccount);
    sl<GoogleSignInController>().exchangeToken();
    //isValidUser = sl<GoogleSignInController>().isValidUser();
    responseStatus = sl<GoogleSignInController>().responseStatus;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: loginUI(model),
      ),
    );
  }

  loginUI(GoogleSignInAccount model) {
    if (model != null) {
      if (EmailDB.contains(model.email)) {
        return Center(child: LoggedInUI(model));
      } else {
        sl<GoogleSignInController>().logout();
        return Unauthorized_User();
      }
    } else {
      return loginControl();
    }
  }

  LoggedInUI(GoogleSignInController) {
    return TestReportPage();
  }

  ////////////////////////////////////
  loginControl() {
    return Center(
      child: Column(
        children: [
          Image.asset('images/ARK-logo.jpg', width: 200, height: 350),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Image.asset('images/google-logo5.png', width: 200),
                onTap: () async {
                  ////////////////////Connection-Checking/////////////////////////
                  DataConnectionStatus status = await CheckInternet();

                  if (status == DataConnectionStatus.connected) {
                    sl<GoogleSignInController>().login();
                  } else if (status == DataConnectionStatus.disconnected) {
                    print('Connection Not Available');
                  }

                  ////////////////////Connection-Checking/////////////////////////
                },
              ),
              Divider(height: 20, color: Colors.white),
              GestureDetector(
                child: Image.asset('images/fb-logo.png', width: 200),
                onTap: () {
                  print('Funtion Not Available');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// var gotStatus;

// CheckConnectionOnAPPbar() async {
//   DataConnectionStatus status = await CheckInternet();
//   gotStatus = status;
//   if (status == DataConnectionStatus.connected) {
//     IconButton(
//         onPressed: () {},
//         icon: Icon(Icons.signal_cellular_connected_no_internet_0_bar_rounded));
//   } else {
//     IconButton(onPressed: () {}, icon: Icon(Icons.signal_cellular_alt));
//   }
// }
