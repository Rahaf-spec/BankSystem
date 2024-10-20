import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'o07j3mgv': {
      'en': 'Welcome back',
      'ar': 'مرحبًا بعودتك',
    },
    'fzxvw3mu': {
      'en': 'Login to access your account below.',
      'ar': 'قم بتسجيل الدخول للوصول إلى حسابك أدناه.',
    },
    'a9j78va9': {
      'en': 'Username',
      'ar': 'عنوان البريد الإلكتروني',
    },
    'i7f18cve': {
      'en': 'Enter your username...',
      'ar': 'أدخل بريدك الإلكتروني...',
    },
    'wztjmbn8': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'lw1jpm1f': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
    },
    'm2xyjvuf': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
    },
    'qbmoi1av': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    'cjqb8ial': {
      'en': 'Don\'t have an account?',
      'ar': 'ليس لديك حساب؟',
    },
    'a0iimirx': {
      'en': 'Create',
      'ar': 'يخلق',
    },
    '1zqiw31h': {
      'en': 'Continue as Guest',
      'ar': 'الاستمرار كضيف',
    },
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // registerAccount
  {
    'gpokmd81': {
      'en': 'Get Started',
      'ar': 'البدء',
    },
    'oitrrwgg': {
      'en': 'Create your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
    },
    'gcwdqm4g': {
      'en': 'Username',
      'ar': 'عنوان البريد الإلكتروني',
    },
    'iam0xgwx': {
      'en': 'Enter your username...',
      'ar': 'أدخل بريدك الإلكتروني...',
    },
    'bqv15dcf': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'joih97mn': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
    },
    'rzpiwq9p': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    'eyfkffka': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
    },
    '5kmjfwsk': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    '3twynvfz': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    '9ssznj0g': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟',
    },
    '3ugmx2zp': {
      'en': 'Continue as Guest',
      'ar': 'الاستمرار كضيف',
    },
    'momge5oj': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
    },
    'r6npjsue': {
      'en': 'Upload a photo for us to easily identify you.',
      'ar': 'قم بتحميل صورة لنا للتعرف عليك بسهولة.',
    },
    'sdptn7dd': {
      'en': 'Your Name',
      'ar': 'اسمك',
    },
    'we0ix4kt': {
      'en': 'i.e. Sarah ',
      'ar': '',
    },
    'n636qnrx': {
      'en': 'Your Age',
      'ar': 'عمرك',
    },
    's7yvjzbs': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
    },
    '72ii0waq': {
      'en': 'Your Title',
      'ar': 'لقبك',
    },
    'pf8glhkg': {
      'en': 'What is your position?',
      'ar': 'ماهوموقعك؟',
    },
    'hbhd3bdt': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
    },
    'w75dikic': {
      'en': 'Skip for Now',
      'ar': 'تخطي في الوقت الراهن',
    },
    '1eac148w': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '4k3jnl38': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    'xaiad71o': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
    },
    'u4nuk910': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    '37kotxi0': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
    },
    'hiwpaze1': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة الضبط',
    },
    '598b8d3m': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // onboarding
  {
    'i8hl2uua': {
      'en': 'Create Budgets',
      'ar': 'إنشاء الميزانيات',
    },
    'hxtwax0y': {
      'en':
          'Create budgets that you can tie transactions too in order for easy tracking.',
      'ar':
          'قم بإنشاء ميزانيات يمكنك من خلالها ربط المعاملات أيضًا لتسهيل التتبع.',
    },
    'mjy3ljln': {
      'en': 'Keep Track of Spending',
      'ar': 'تتبع الإنفاق',
    },
    'uf9k1spp': {
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': 'يمكنك بسهولة إضافة المعاملات وربطها بالميزانيات التي تم إنشاؤها.',
    },
    '9c4outzf': {
      'en': 'Budget Analysis',
      'ar': 'تحليل الميزانية',
    },
    'q30ina4f': {
      'en': 'Know where your budgets are and how they can be adjusted.',
      'ar': 'اعرف أين توجد ميزانياتك وكيف يمكن تعديلها.',
    },
    'ypt7b97g': {
      'en': 'Create Your Budget',
      'ar': 'قم بإنشاء ميزانيتك',
    },
    'oo0kk9qe': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // createBudgetBegin
  {
    'xod9iwab': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
    },
    'wih71x51': {
      'en': 'Amount',
      'ar': 'كمية',
    },
    'qk15nsmc': {
      'en': 'Budget Name',
      'ar': 'اسم الميزانية',
    },
    'iphvcuwc': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'v2shqq3z': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
    },
    'knu0nxbp': {
      'en': 'Tap above to complete request',
      'ar': 'انقر أعلاه لإكمال الطلب',
    },
    '79au6dyg': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال المبلغ',
    },
    'cs1cy7tg': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // MY_Card
  {
    'xn2so8km': {
      'en': 'My Card',
      'ar': 'بطاقتي',
    },
    '6t7n9ugd': {
      'en': 'Balance',
      'ar': 'توازن',
    },
    'h3086ma4': {
      'en': '\$7,630',
      'ar': '7,630 دولار',
    },
    'lr97k2rc': {
      'en': '**** 0149',
      'ar': '**** 0149',
    },
    'l9racj60': {
      'en': '05/25',
      'ar': '25/05',
    },
    '9b0j67se': {
      'en': 'Income',
      'ar': 'دخل',
    },
    'axrvkhrv': {
      'en': '+\$12,402',
      'ar': '+12,402 دولار',
    },
    '0d7w9e0i': {
      'en': '4.5% ',
      'ar': '4.5%',
    },
    'mggh8wu7': {
      'en': 'Spending',
      'ar': 'الإنفاق',
    },
    'c5bszisf': {
      'en': '-\$8,392',
      'ar': '- 8392 دولارًا',
    },
    '85pb8msl': {
      'en': '4.5% ',
      'ar': '4.5%',
    },
    'yet7zk5d': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
    },
    '8bnd6lco': {
      'en': 'Transfer',
      'ar': 'تحويل',
    },
    'roobc02h': {
      'en': 'Pause Card',
      'ar': 'بطاقة الإيقاف المؤقت',
    },
    'hnf8p5mi': {
      'en': 'Deposit',
      'ar': 'إيداع',
    },
    'enlco1py': {
      'en': 'Withdrawal',
      'ar': 'انسحاب',
    },
    '27pb7ji4': {
      'en': 'Transactions',
      'ar': 'المعاملات',
    },
    'xs4cn7uk': {
      'en': 'Income',
      'ar': 'دخل',
    },
    'col63ywe': {
      'en': 'Invoices',
      'ar': 'الفواتير',
    },
    '6hhmqpjh': {
      'en': '[invoiceName]',
      'ar': '[اسم الفاتورة]',
    },
    'rt6icx3q': {
      'en': 'Go Far Rewards',
      'ar': 'الذهاب بعيدا المكافآت',
    },
    '2qrtes74': {
      'en': 'Income',
      'ar': 'دخل',
    },
    'ihod3i3e': {
      'en': '[invoiceAmount]',
      'ar': '[قيمة الفاتورة]',
    },
    '44sgjhpw': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا',
    },
    'm8rhanhc': {
      'en': '•',
      'ar': '•',
    },
  },
  // MY_Budgets
  {
    'cd0zp71n': {
      'en': 'My Budget',
      'ar': 'ميزانيتي',
    },
    'hfwbiivj': {
      'en': 'Income',
      'ar': 'دخل',
    },
    'jjj3ydb1': {
      'en': '+\$12,402',
      'ar': '+12,402 دولار',
    },
    'ns4vt604': {
      'en': '4.5% ',
      'ar': '4.5%',
    },
    'wcsc04wg': {
      'en': 'Spending',
      'ar': 'الإنفاق',
    },
    'a5zzlh8f': {
      'en': '-\$8,392',
      'ar': '- 8392 دولارًا',
    },
    '8xnbsdnb': {
      'en': '4.5% ',
      'ar': '4.5%',
    },
    'c81i1ybg': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
    },
    'ah4t7cpx': {
      'en': 'Advertising Budget',
      'ar': 'ميزانية الإعلان',
    },
    '0tsohlub': {
      'en': '\$3,000',
      'ar': '3000 دولار',
    },
    '5y1u9kxg': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
    },
    '4jknsif6': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
    },
    'o9rmbnd7': {
      'en': '\$2,502',
      'ar': '2,502 دولار',
    },
    'fn6kvat8': {
      'en': 'Advertising Budget',
      'ar': 'ميزانية الإعلان',
    },
    '6uht91yb': {
      'en': '\$3,000',
      'ar': '3000 دولار',
    },
    '1qm6rhod': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
    },
    '65tvvjcw': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
    },
    'c03678eq': {
      'en': '\$2,502',
      'ar': '2,502 دولار',
    },
    'ofz2zvlc': {
      'en': '•',
      'ar': '•',
    },
  },
  // paymentDetails
  {
    'j0yzgf4n': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    'zv72ekdw': {
      'en': 'Amount',
      'ar': 'كمية',
    },
    '0rjyjwed': {
      'en': 'Vendor',
      'ar': 'بائع',
    },
    'eeyn6dk2': {
      'en': 'When',
      'ar': 'متى',
    },
    'lccxx6eu': {
      'en': 'Reason',
      'ar': 'سبب',
    },
    'jzyax4hn': {
      'en': 'Spent by',
      'ar': 'قضى بها',
    },
    'i4r9jqwn': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // MY_profilePage
  {
    'f1bvbey3': {
      'en': 'My Account',
      'ar': 'حسابي',
    },
    'i61y9ibx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    '03k0vw86': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    '6w6wv95p': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
    },
    '9aogde79': {
      'en': 'Tutorial',
      'ar': 'درس تعليمي',
    },
    'eojlfs66': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    '2ll42t1u': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
    },
    '8d386226': {
      'en': 'Light Mode',
      'ar': 'وضع الضوء',
    },
    '8srr2k0j': {
      'en': '•',
      'ar': '•',
    },
  },
  // budgetDetails
  {
    'p0gf1lfy': {
      'en': 'Per Month',
      'ar': 'كل شهر',
    },
    'ti7ipegi': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
    },
    'ifi6fmsa': {
      'en': 'Transactions',
      'ar': 'المعاملات',
    },
    'ak9m8szp': {
      'en': 'Income',
      'ar': 'دخل',
    },
    'l53kroui': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // transferComplete
  {
    'xf8d4sm8': {
      'en': 'Transfer Complete',
      'ar': 'نقل كامل',
    },
    'iq9jjji8': {
      'en':
          'Great work, you successfully transferred funds. It may take a few days for the funds to leave your account.',
      'ar':
          'عمل رائع، لقد نجحت في تحويل الأموال. قد يستغرق الأمر بضعة أيام حتى تغادر الأموال حسابك.',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // transferFunds
  {
    'pe3o18oh': {
      'en': 'Transfer Funds',
      'ar': 'تحويل الأموال',
    },
    'xt4pmddy': {
      'en': 'Balance',
      'ar': 'توازن',
    },
    'cgxvkgin': {
      'en': '\$7,302',
      'ar': '7,302 دولار',
    },
    'x4opl2fc': {
      'en': '**** 8549',
      'ar': '**** 8549',
    },
    '2273xvw6': {
      'en': '11/26',
      'ar': '11/26',
    },
    '6eezv1ge': {
      'en': 'Balance',
      'ar': 'توازن',
    },
    '6gom1l00': {
      'en': '\$4,637',
      'ar': '4,637 دولار',
    },
    'e6djwvow': {
      'en': '**** 0745',
      'ar': '**** 0745',
    },
    '30sda6e5': {
      'en': '02/25',
      'ar': '02/25',
    },
    'mlix07uz': {
      'en': 'Balance',
      'ar': 'توازن',
    },
    'z5u137px': {
      'en': '\$12,047.29',
      'ar': '12,047.29 دولارًا',
    },
    'b5nog9qr': {
      'en': '****1102',
      'ar': '****1102',
    },
    'sbgr9n4g': {
      'en': '12/24',
      'ar': '12/24',
    },
    'kyzwrfh4': {
      'en': 'Balance',
      'ar': 'توازن',
    },
    'zq4ozx20': {
      'en': '\$7,630',
      'ar': '7,630 دولار',
    },
    'qukh7yo1': {
      'en': '**** 0149',
      'ar': '**** 0149',
    },
    'n87hkr7d': {
      'en': '05/25',
      'ar': '25/05',
    },
    '3ct4fj7p': {
      'en': 'Change Account',
      'ar': 'تغير الحساب',
    },
    'w4smsh2i': {
      'en': 'Internal Transfer',
      'ar': 'التحويل الداخلي',
    },
    '6uxty3hy': {
      'en': 'External Transfer',
      'ar': 'نقل خارجي',
    },
    'p4ngma0d': {
      'en': 'ACH Payment',
      'ar': 'الدفع عبر ACH',
    },
    'uxo87fjc': {
      'en': 'Transfer Type',
      'ar': 'نوع النقل',
    },
    'fddma8xl': {
      'en': 'Select Account',
      'ar': 'حدد حساب',
    },
    '23l6kqgm': {
      'en': 'Account ****2010',
      'ar': 'الحساب ****2010',
    },
    '3hwdfadf': {
      'en': 'Account ****2011',
      'ar': 'الحساب ****2011',
    },
    'xvj00xg1': {
      'en': 'Account ****2012',
      'ar': 'الحساب ****2012',
    },
    'ok5xluvk': {
      'en': 'Choose an Account',
      'ar': 'اختيار حساب',
    },
    'ynie0pc5': {
      'en': '\$ Amount',
      'ar': 'المبلغ \$',
    },
    'wngoi0v4': {
      'en': 'Your new account balance is:',
      'ar': 'رصيد حسابك الجديد هو:',
    },
    'g6bfec2g': {
      'en': '\$7,630',
      'ar': '7,630 دولار',
    },
    'xaw2jdst': {
      'en': 'Send Transfer',
      'ar': 'إرسال نقل',
    },
    'xku4zxbe': {
      'en': 'Tap above to complete transfer',
      'ar': 'انقر أعلاه لإكمال النقل',
    },
    'imaejg7x': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // requestFunds
  {
    'wv1862li': {
      'en': 'Request Funds',
      'ar': 'طلب التمويل',
    },
    'xvj3fan8': {
      'en': '\$ Amount',
      'ar': 'المبلغ \$',
    },
    'wwjahvpl': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
    },
    'sx0vvzxd': {
      'en': 'External Transfer',
      'ar': 'نقل خارجي',
    },
    'ai453kej': {
      'en': 'ACH Payment',
      'ar': 'الدفع عبر ACH',
    },
    'wo9cebk7': {
      'en': 'Select Transfer',
      'ar': 'حدد نقل',
    },
    'rcevwwju': {
      'en': 'Reason',
      'ar': 'سبب',
    },
    'uvrt7im0': {
      'en': 'Request Funds',
      'ar': 'طلب التمويل',
    },
    '7y89msg9': {
      'en': 'Tap above to complete request',
      'ar': 'انقر أعلاه لإكمال الطلب',
    },
    'xk0bwox3': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // createBudget
  {
    'smbfunwu': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
    },
    'fcgw57wj': {
      'en': 'Amount',
      'ar': 'كمية',
    },
    'onjddqdc': {
      'en': 'Budget Name',
      'ar': 'اسم الميزانية',
    },
    'g83gfmaf': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '0iex13x2': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
    },
    'jy5q09h1': {
      'en': 'Tap above to complete request',
      'ar': 'انقر أعلاه لإكمال الطلب',
    },
    '8hzaiw1r': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال المبلغ',
    },
    'mos068mm': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // transaction_ADD
  {
    'qywon4k1': {
      'en': 'Add Transaction',
      'ar': 'إضافة المعاملة',
    },
    'bh9tad8e': {
      'en': 'Amount',
      'ar': 'كمية',
    },
    'ohewrgsv': {
      'en': 'Spent At',
      'ar': 'قضى في',
    },
    '3170k9n1': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
    },
    'abz6nm8z': {
      'en': 'External Transfer',
      'ar': 'نقل خارجي',
    },
    '3y95vtb6': {
      'en': 'ACH Payment',
      'ar': 'الدفع عبر ACH',
    },
    '861el4k4': {
      'en': 'Select Budget',
      'ar': 'حدد الميزانية',
    },
    'swxms7ln': {
      'en': 'Reason',
      'ar': 'سبب',
    },
    'uqfgu088': {
      'en': 'Add Transaction',
      'ar': 'إضافة المعاملة',
    },
    '9stmpsf0': {
      'en': 'Tap above to complete request',
      'ar': 'انقر أعلاه لإكمال الطلب',
    },
    'gzhmf1t6': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال المبلغ',
    },
    '7trcsuiu': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // transaction_EDIT
  {
    's300dyxl': {
      'en': 'Edit Transaction',
      'ar': 'تحرير المعاملة',
    },
    '5xgwlwjj': {
      'en': 'Amount',
      'ar': 'كمية',
    },
    '720k2d98': {
      'en': 'Spent At',
      'ar': 'قضى في',
    },
    'df1ingy2': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
    },
    '5kzmka3y': {
      'en': 'External Transfer',
      'ar': 'نقل خارجي',
    },
    'nvtz0bpd': {
      'en': 'ACH Payment',
      'ar': 'الدفع عبر ACH',
    },
    'l3bqo3oh': {
      'en': 'Select Budget',
      'ar': 'حدد الميزانية',
    },
    '0lw03w43': {
      'en': 'Reason',
      'ar': 'سبب',
    },
    '3eftlbxd': {
      'en': 'Update Transaction',
      'ar': 'تحديث المعاملة',
    },
    '4atjd0yh': {
      'en': 'Tap above to save your changes.',
      'ar': 'انقر أعلاه لحفظ التغييرات.',
    },
    'pg18rcyu': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال المبلغ',
    },
    '12if11ss': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // editProfile
  {
    '4rzqov3y': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    'zoxan2gi': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
    },
    '3p9y21e2': {
      'en': 'Your Name',
      'ar': 'اسمك',
    },
    'dw9gmjdc': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صالحا...',
    },
    'z4fstn5l': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    'jozgvwyg': {
      'en': 'Your email',
      'ar': 'بريدك الالكتروني',
    },
    '8h1cjk5a': {
      'en': 'Your Age',
      'ar': 'عمرك',
    },
    '5v21r6gb': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
    },
    'zvymbfia': {
      'en': 'Your Title',
      'ar': 'لقبك',
    },
    'i6edcl52': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    '59naq8ur': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    '2b97u8y5': {
      'en':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'ar':
          'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
    },
    'ajy1c3r9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    'hsqfoxya': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
    },
    'if4pz6lm': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة الضبط',
    },
    '5tvk9lv0': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // notificationsSettings
  {
    'sc4ff4ce': {
      'en': 'Notifications',
      'ar': 'إشعارات',
    },
    'r72zvrv5': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': 'اختر الإشعارات التي تريد تلقيها أدناه وسنقوم بتحديث الإعدادات.',
    },
    'gjygkr0n': {
      'en': 'Push Notifications',
      'ar': 'دفع الإخطارات',
    },
    '3y3yhxbk': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': 'تلقي إشعارات الدفع من تطبيقنا بشكل شبه منتظم.',
    },
    '1ytebj35': {
      'en': 'Email Notifications',
      'ar': 'اشعارات البريد الالكتروني',
    },
    '9lvh5nst': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'ar':
          'تلقي إشعارات البريد الإلكتروني من فريق التسويق لدينا حول الميزات الجديدة.',
    },
    '69d2j74u': {
      'en': 'Location Services',
      'ar': 'خدمات الموقع',
    },
    '3k8cuv0d': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'ar': 'اسمح لنا بتتبع موقعك، فهذا يساعد على تتبع الإنفاق ويبقيك آمنًا.',
    },
    'isgrgbfs': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    'a96mlyeh': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    'fvsfg5on': {
      'en': 'How we use your data',
      'ar': 'كيف نستخدم بياناتك',
    },
    'nbiyrnzl': {
      'en':
          'Privacy Notice:                                                        \n\nYour privacy and the security of your personal data is very important to us. At Halalah Bank, hereinafter referred to as the “Bank”, we ensure that personal data you provided to us is always treated as private and confidential, afforded the highest level of security,  and is processed in accordance with Halalah Bank Privacy and Data Protection Policy and applicable regulatory requirements. This Privacy Notice, hereinafter referred to as “Notice”, aims to provide you with information on how we will use your personal data, what steps we will take to ensure it stays private and secure and what personal data we collect and process about you as well as your data privacy rights  and how you can exercise them.\n\n\nHow we collect your data:-\n\nThe Bank collects your data through one of the following methods:\n\n- Directly: we obtain personal information directly from you in order to receive a service from the Bank or transacting with the Bank, including without limitation, log a complaint, enter a business relationship, or for other purposes depending on the services requested for or agreed upon.\n\n- Indirectly: we may obtain personal information about you indirectly from a variety of sources, including: your broker, intermediaries, the Banks’s Affiliates; Cookies, device ID\'s, social media, public sources, business partners, and recruitment services to better understand and serve you, satisfy a legal obligation, or in pursuance of another legitimate interest.   \n\n\nHow we use your information:-\n\nWe collect your personal information for various reasons in relation to our services, products or interacting with us, and for other business purposes, including, but not limited to, :\n\n- to provide and manage your account(s) and our relationship with you.\n\n- to give you statements and other information about your account or our relationship.\n\n- to handle enquiries and complaints.\n\n- to provide our services to you.\n\n- to conduct assessment, testing, and analysis for statistical purposes or other analysis for market research purposes.\n\n- to evaluate, develop, and improve our services to you and other customers.\n\n- to protect our business interests and to develop our business strategies.\n\n- to contact you, by post, phone, text, email and other digital methods.\n\n- to collect any debts owing to us.\n\n- to meet our regulatory compliance and reporting obligations in relation to protecting against financial crime.\n\n- to assess any application you make.\n\n- to monitor, record, and analyze any communications between you and us.\n\n- to share your information with governmental authorities, credit reference agencies, fraud prevention agencies, and overseas regulators and authorities.\n\n- to share your information with our partners and service providers and external auditors.\n\n- recruitment and vetting agencies for prospective job applicants.  \n\n- client prospecting, marketing and selling agencies.  \n\n- for purpose of litigation, consultation, legal advices or documentation of transactions.\n\n\nOn what legal grounds do we process your data:-\n\nWe rely on the following lawful reasons when we collect and process your personal information to operate our business, transacting with you, provide our products and services:\n\n- Legal obligations and public interests: we process personal information to comply with a legal obligation, to meet regulatory and public interest obligations or mandates.\n\n- Contractual obligation: we process your information if necessary for the entry and/or implementation of a contract with you, or for the conclusion of a contract at your request.\n\n-Legitimate interests: we rely on legitimate interests based on our evaluation that the processing is fair, reasonable, and balanced.\n\n- Consent: We will only process your personal information with your explicit written consent except for reasons permitted under the Law.\n\n\nWhich personal data do we collect and process:-\n\nThe personal data we collect includes data provided by you at the start of our relationship or at any time thereafter such as:\n\n- Personal details such as name, date of birth, email, nationality, marital status, and gender and contact information.\n\n- Current residential address and permanent residential address, and proof of address documents.\n\n- Data about your identity including documents, details of ID cards, details of passports.\n\n-Employer, employment status, job title, full name, email, address and telephone number(s) used for work purposes.\n\n-Financial data: income and source of income, source of wealth, average account financial activity, and engagement data.\n\n- Data about your tax status such overseas tax-identification number, FATCA forms, etc.\n\n- Details of transactions done by you or by any of your connected persons including dates, amounts, currencies, and payer and payee details.\n\n- Sound and visual images including CCTV footage.\n\n- Digital identifiers (IP address, email).\n\n\n\nFor More Information:-\n\nShould you have any questions regarding this Notice or want to learn more about our security practices, please read our Security Statement section, or contact us at: Privacy.Halalah.Office@***.com.***\n\n\nChanges to the this Notice:-\n\nWe reserve the right to update this Notice to reflect changes to our information practices in alignment with the Law.  Any updates will become effective immediately after posting the updated Notice on our website.\n',
      'ar':
          'إشعار الخصوصية:\n\nخصوصيتك وأمن بياناتك الشخصية أمر في غاية الأهمية بالنسبة لنا. في بنك هللة، المشار إليه فيما بعد باسم \"البنك\"، نضمن أن البيانات الشخصية التي تقدمها لنا يتم التعامل معها دائمًا على أنها خاصة وسرية، ويتم توفيرها لأعلى مستوى من الأمان، وتتم معالجتها وفقًا لسياسة الخصوصية وحماية البيانات الخاصة ببنك هللة. والمتطلبات التنظيمية المعمول بها. يهدف إشعار الخصوصية هذا، والمشار إليه فيما يلي باسم \"الإشعار\"، إلى تزويدك بمعلومات حول كيفية استخدام بياناتك الشخصية، وما هي الخطوات التي سنتخذها لضمان بقائها خاصة وآمنة وما هي البيانات الشخصية التي نجمعها ونعالجها عنك بالإضافة إلى حقوق خصوصية البيانات الخاصة بك وكيف يمكنك ممارستها.\n\n\nكيف نجمع بياناتك:-\n\nيقوم البنك بجمع بياناتك من خلال إحدى الطرق التالية:\n\n- مباشرة: نحصل على معلومات شخصية منك مباشرة من أجل الحصول على خدمة من البنك أو التعامل مع البنك، بما في ذلك على سبيل المثال لا الحصر، تسجيل شكوى، الدخول في علاقة عمل، أو لأغراض أخرى تعتمد على الخدمات المطلوبة أو المتفق عليها على.\n\n- بشكل غير مباشر: قد نحصل على معلومات شخصية عنك بشكل غير مباشر من مجموعة متنوعة من المصادر، بما في ذلك: وسيطك، والوسطاء، والشركات التابعة للبنك؛ ملفات تعريف الارتباط، ومعرفات الجهاز، ووسائل التواصل الاجتماعي، والمصادر العامة، وشركاء الأعمال، وخدمات التوظيف لفهمك وخدمتك بشكل أفضل، أو تلبية التزام قانوني، أو تحقيقًا لمصلحة مشروعة أخرى.\n\n\nكيف نستخدم معلوماتك:-\n\nنقوم بجمع معلوماتك الشخصية لأسباب مختلفة فيما يتعلق بخدماتنا أو منتجاتنا أو التفاعل معنا، ولأغراض تجارية أخرى، بما في ذلك، على سبيل المثال لا الحصر،:\n\n- لتوفير وإدارة حسابك (حساباتك) وعلاقتنا معك.\n\n- لتزويدك بالبيانات والمعلومات الأخرى حول حسابك أو علاقتنا.\n\n- للتعامل مع الاستفسارات والشكاوى.\n\n- لتقديم خدماتنا لك.\n\n- إجراء التقييم والاختبار والتحليل للأغراض الإحصائية أو التحليلات الأخرى لأغراض أبحاث السوق.\n\n- لتقييم وتطوير وتحسين خدماتنا لك وللعملاء الآخرين.\n\n- لحماية مصالحنا التجارية وتطوير استراتيجيات أعمالنا.\n\n- للاتصال بك عن طريق البريد والهاتف والرسائل النصية والبريد الإلكتروني وغيرها من الطرق الرقمية.\n\n- لتحصيل أية ديون مستحقة لنا.\n\n- للوفاء بالتزاماتنا التنظيمية والإبلاغ فيما يتعلق بالحماية من الجرائم المالية.\n\n- لتقييم أي طلب تقوم به.\n\n- لمراقبة وتسجيل وتحليل أي اتصالات بينك وبيننا.\n\n- لمشاركة معلوماتك مع السلطات الحكومية، ووكالات الائتمان المرجعية، ووكالات منع الاحتيال، والجهات التنظيمية والسلطات الخارجية.\n\n- لمشاركة معلوماتك مع شركائنا ومقدمي الخدمات والمدققين الخارجيين.\n\n- وكالات التوظيف والفحص للمتقدمين للوظائف المحتملين.\n\n- وكالات التنقيب عن العملاء والتسويق والبيع.\n\n- لغرض التقاضي أو الاستشارة أو الاستشارة القانونية أو توثيق المعاملات.\n\n\nعلى أي أسس قانونية نقوم بمعالجة بياناتك:-\n\nنحن نعتمد على الأسباب القانونية التالية عندما نقوم بجمع معلوماتك الشخصية ومعالجتها لتشغيل أعمالنا والتعامل معك وتقديم منتجاتنا وخدماتنا:\n\n- الالتزامات القانونية والمصالح العامة: نقوم بمعالجة المعلومات الشخصية للامتثال لالتزام قانوني، وللوفاء بالالتزامات أو التفويضات التنظيمية والمصلحة العامة.\n\n- الالتزام التعاقدي: نقوم بمعالجة معلوماتك إذا لزم الأمر لإبرام و/أو تنفيذ عقد معك، أو لإبرام عقد بناءً على طلبك.\n\n- المصالح المشروعة: نعتمد على المصالح المشروعة بناءً على تقييمنا بأن المعالجة عادلة ومعقولة ومتوازنة.\n\n- الموافقة: لن نقوم بمعالجة معلوماتك الشخصية إلا بموافقتك الكتابية الصريحة باستثناء الأسباب التي يسمح بها القانون.\n\n\nما هي البيانات الشخصية التي نقوم بجمعها ومعالجتها:-\n\nتتضمن البيانات الشخصية التي نجمعها البيانات التي قدمتها في بداية علاقتنا أو في أي وقت بعد ذلك مثل:\n\n- التفاصيل الشخصية مثل الاسم وتاريخ الميلاد والبريد الإلكتروني والجنسية والحالة الاجتماعية والجنس ومعلومات الاتصال.\n\n- عنوان السكن الحالي وعنوان السكن الدائم ومستندات إثبات العنوان.\n\n- بيانات عن هويتك بما في ذلك المستندات وتفاصيل بطاقات الهوية وتفاصيل جوازات السفر.\n\n-صاحب العمل والحالة الوظيفية والمسمى الوظيفي والاسم الكامل والبريد الإلكتروني والعنوان ورقم (أرقام) الهاتف المستخدمة لأغراض العمل.\n\n- البيانات المالية: الدخل ومصدر الدخل، مصدر الثروة، متوسط ​​النشاط المالي للحساب، وبيانات الارتباط.\n\n- بيانات حول حالتك الضريبية مثل رقم التعريف الضريبي في الخارج، ونماذج قانون الالتزام الضريبي للحسابات الأجنبية (FATCA)، وما إلى ذلك.\n\n- تفاصيل المعاملات التي تمت بواسطتك أو بواسطة أي من الأشخاص المرتبطين بك بما في ذلك التواريخ والمبالغ والعملات وتفاصيل الدافع والمدفوع له.\n\n- الصور الصوتية والمرئية بما في ذلك لقطات الدوائر التلفزيونية المغلقة.\n\n- المعرفات الرقمية (عنوان IP، البريد الإلكتروني).\n\n\n\nللمزيد من المعلومات:-\n\nإذا كانت لديك أي أسئلة بخصوص هذا الإشعار أو كنت ترغب في معرفة المزيد حول ممارساتنا الأمنية، يرجى قراءة قسم بيان الأمان الخاص بنا، أو الاتصال بنا على: Privacy.Halalah.Office@***.com.***\n\n\nالتغييرات على هذا الإشعار:-\n\nنحن نحتفظ بالحق في تحديث هذا الإشعار ليعكس التغييرات في ممارسات المعلومات لدينا بما يتماشى مع القانون. ستصبح أي تحديثات سارية فور نشر الإشعار المحدث على موقعنا.',
    },
    'oks4x95o': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // tutorial_PROFILE
  {
    '38wb3rix': {
      'en': 'Tutorial',
      'ar': 'درس تعليمي',
    },
    'o6prpb1q': {
      'en': 'Create Budgets',
      'ar': 'إنشاء الميزانيات',
    },
    '292pbdw7': {
      'en':
          'Create budgets that you can tie transactions too in order for easy tracking.',
      'ar': 'أنشئ ميزانيات يمكنك من خلالها ربط المعاملات أيضًا لتسهيل التتبع.',
    },
    'b10xvuf9': {
      'en': 'Keep Track of Spending',
      'ar': 'تتبع الإنفاق',
    },
    't6k1smsm': {
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': 'يمكنك بسهولة إضافة المعاملات وربطها بالميزانيات التي تم إنشاؤها.',
    },
    'u8xxj427': {
      'en': 'Budget Analysis',
      'ar': 'تحليل الميزانية',
    },
    'iqi0pkmb': {
      'en': 'Know where your budgets are and how they can be adjusted.',
      'ar': 'اعرف أين توجد ميزانياتك وكيف يمكن تعديلها.',
    },
    'uydm0fnm': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // homePage
  {
    'ucqlrrlk': {
      'en': 'Welcome,',
      'ar': 'مرحباً،',
    },
    'c10wb3ot': {
      'en': 'Your account Details are below.',
      'ar': 'تفاصيل حسابك أدناه.',
    },
    '6z1sm34j': {
      'en': 'Total Balance',
      'ar': 'الرصيد الإجمالي',
    },
    'c0dls4u5': {
      'en': '\$25,202',
      'ar': '25,202 دولار',
    },
    '30yef7fj': {
      'en': 'Payroll Due',
      'ar': 'استحقاق الرواتب',
    },
    'zrx9e6tv': {
      'en': '\$12,245',
      'ar': '12,245 دولارًا',
    },
    '1cjqanzg': {
      'en': 'Debit Date',
      'ar': 'تاريخ الخصم',
    },
    '726vrs60': {
      'en': 'Aug 31, 2021',
      'ar': '31 أغسطس 2021',
    },
    '4dgbx46t': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
    },
    'n87v5tth': {
      'en': 'Marketing Budget',
      'ar': 'ميزانية التسويق',
    },
    'l5pw5c8c': {
      'en': '\$4,000',
      'ar': '4000 دولار',
    },
    '7i0a44qa': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
    },
    '9a2ya1la': {
      'en': '\$3,402',
      'ar': '3,402 دولار',
    },
    'n1o498d9': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
    },
    'lmo3ko2i': {
      'en': 'Quick Services',
      'ar': 'خدمات سريعة',
    },
    '774itrkn': {
      'en': 'My Bank',
      'ar': 'بنكي',
    },
    'xs2as0vf': {
      'en': 'Transfer',
      'ar': 'تحويل',
    },
    'g8yaaa7f': {
      'en': 'Activity',
      'ar': 'نشاط',
    },
    'nb29ps2o': {
      'en': '1 New Alert',
      'ar': '1 تنبيه جديد',
    },
    'vgt9s153': {
      'en': 'View Now',
      'ar': 'عرض الآن',
    },
    'pnvkw3b7': {
      'en':
          'We noticed a small charge that is out of character of this account, please review.',
      'ar':
          'لقد لاحظنا وجود رسوم بسيطة لا تتناسب مع هذا الحساب، يرجى مراجعتها.',
    },
    'c805m53i': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // homePage_alt
  {
    'xdh0z8qh': {
      'en': 'Welcome,',
      'ar': 'مرحباً،',
    },
    'v74pa882': {
      'en': 'Andrew',
      'ar': 'أندرو',
    },
    'rzpg3cvh': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
    },
    'flto6ti8': {
      'en': 'Total Balance',
      'ar': 'الرصيد الإجمالي',
    },
    'g07h0azf': {
      'en': '\$25,281',
      'ar': '25,281 دولار',
    },
    'v9ghmn0y': {
      'en': 'Total Balance',
      'ar': 'الرصيد الإجمالي',
    },
    '7vf40ybo': {
      'en': '\$25,281',
      'ar': '25,281 دولار',
    },
    'k4scs2cu': {
      'en': 'Total Balance',
      'ar': 'الرصيد الإجمالي',
    },
    'cvrbfozm': {
      'en': '\$25,281',
      'ar': '25,281 دولار',
    },
    'a33ldz0h': {
      'en': 'Next Payroll',
      'ar': 'الرواتب القادمة',
    },
    '3dgzzz79': {
      'en': '\$25,281',
      'ar': '25,281 دولار',
    },
    'hp28r17l': {
      'en': 'Debit Date',
      'ar': 'تاريخ الخصم',
    },
    'k04gl6sz': {
      'en': 'Aug 31, 2021',
      'ar': '31 أغسطس 2021',
    },
    'd5tcdo3w': {
      'en': '4 days left',
      'ar': 'باقي 4 ايام',
    },
    '8wofym4i': {
      'en': '1 New Alert',
      'ar': '1 تنبيه جديد',
    },
    'kaq4nzj6': {
      'en': 'Fraud Alert',
      'ar': 'تنبيه الاحتيال',
    },
    '7zcrtqx6': {
      'en':
          'We noticed a small charge that is out of character of this account, please review.',
      'ar':
          'لقد لاحظنا وجود رسوم بسيطة لا تتناسب مع هذا الحساب، يرجى مراجعتها.',
    },
    '23yxoc9m': {
      'en': 'View Now',
      'ar': 'عرض الآن',
    },
    'a86mwddx': {
      'en': 'Marketing Budget',
      'ar': 'ميزانية التسويق',
    },
    '6c2o39hz': {
      'en': '\$3,000',
      'ar': '3000 دولار',
    },
    '5subrra4': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
    },
    '0wtm2m51': {
      'en': '\$2,502',
      'ar': '2,502 دولار',
    },
    'bp9d56pc': {
      'en': '4 days left',
      'ar': 'باقي 4 ايام',
    },
    'b8oj0pck': {
      'en': 'Team Name',
      'ar': 'اسم الفريق',
    },
    '87ospwsq': {
      'en': '\$5,000',
      'ar': '5000 دولار',
    },
    'jzfejglt': {
      'en': 'Head of Design',
      'ar': 'رئيس قسم التصميم',
    },
    'zm0lhm2a': {
      'en': '[Time Stamp]',
      'ar': '[الطابع الزمني]',
    },
    '8hu2v2im': {
      'en': '•',
      'ar': '•',
    },
  },
  // homePage_alt_1
  {
    '51kawpgz': {
      'en': 'Welcome,',
      'ar': 'مرحباً،',
    },
    'izgc0c6r': {
      'en': 'Andrew',
      'ar': 'أندرو',
    },
    '30kx6e5v': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
    },
    'wknu2tm4': {
      'en': 'Balance',
      'ar': 'توازن',
    },
    'syy689nt': {
      'en': '\$7,630',
      'ar': '7,630 دولار',
    },
    'hhyb9x4x': {
      'en': '**** 0149',
      'ar': '**** 0149',
    },
    'kg2tmby7': {
      'en': '05/25',
      'ar': '25/05',
    },
    'y7zomzzp': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
    },
    'rfozud9v': {
      'en': 'Transfer',
      'ar': 'تحويل',
    },
    'pcrarg0a': {
      'en': 'Activity',
      'ar': 'نشاط',
    },
    'zmjsfzgg': {
      'en': 'My Bank',
      'ar': 'بنكي',
    },
    'dfjtbkbo': {
      'en': 'Transaction',
      'ar': 'عملية',
    },
    'g7t9krj7': {
      'en': 'Go Far Rewards',
      'ar': 'الذهاب بعيدا المكافآت',
    },
    'vupu5y5p': {
      'en': 'Income',
      'ar': 'دخل',
    },
    'bj5qnrj5': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا',
    },
    'd1n5mbq7': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
    },
    '2thn73jc': {
      'en': 'Go Far Rewards',
      'ar': 'الذهاب بعيدا المكافآت',
    },
    '1fjdiibo': {
      'en': 'Income',
      'ar': 'دخل',
    },
    'ld7s2fpn': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا',
    },
    'ft8bu1we': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
    },
    '8t6ddwco': {
      'en': 'Go Far Rewards',
      'ar': 'الذهاب بعيدا المكافآت',
    },
    'td15kjsa': {
      'en': 'Income',
      'ar': 'دخل',
    },
    'qmjqp9a6': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا',
    },
    '9qc797et': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
    },
    '8pdmehj2': {
      'en': 'Go Far Rewards',
      'ar': 'الذهاب بعيدا المكافآت',
    },
    'krrhjgc4': {
      'en': 'Income',
      'ar': 'دخل',
    },
    '53m2u0s2': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا',
    },
    'aks5zz4f': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
    },
    'f3hxl69y': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // budget_DELETE
  {
    'pozov0xz': {
      'en': 'Delete Budget',
      'ar': 'حذف الميزانية',
    },
    'aptjmof0': {
      'en':
          'If you delete this budget, your transactions will no longer be associated with it.',
      'ar':
          'إذا قمت بحذف هذه الميزانية، فلن تكون معاملاتك مرتبطة بها بعد الآن.',
    },
    '9l7pbjcj': {
      'en': 'Delete Budget',
      'ar': 'حذف الميزانية',
    },
    'u0kr38at': {
      'en': 'Tap above to remove this bude',
      'ar': 'انقر أعلاه لإزالة هذا الصديق',
    },
    'b1xp801p': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // profilepage
  {
    'hhb6veym': {
      'en': 'Wallet Balance',
      'ar': 'رصيد المحفظة',
    },
    'fgf8icmv': {
      'en': '\$23,986.29',
      'ar': '23,986.29 دولارًا',
    },
    '2rrr446m': {
      'en': '3 currencies',
      'ar': '3 عملات',
    },
    'r04m9nxs': {
      'en': 'My Bank',
      'ar': 'بنكي',
    },
    '8nac51xz': {
      'en': 'Transfer',
      'ar': 'تحويل',
    },
    's56t3xya': {
      'en': 'Activity',
      'ar': 'نشاط',
    },
    'vewa5op5': {
      'en': 'Main',
      'ar': 'رئيسي',
    },
    '9oun2uok': {
      'en': '\$7,302',
      'ar': '7,302 دولار',
    },
    'yla7uncg': {
      'en': '32% of portfolio',
      'ar': '32% من المحفظة',
    },
    '7hsm7t9z': {
      'en': ' ',
      'ar': '',
    },
    'opob20j8': {
      'en': 'Savings',
      'ar': 'مدخرات',
    },
    'fi3cleyj': {
      'en': '\$12,047.29',
      'ar': '12,047.29 دولارًا',
    },
    '606emxw1': {
      'en': '40% of portfolio',
      'ar': '40% من المحفظة',
    },
    'qx0ykpbm': {
      'en': ' ',
      'ar': '',
    },
    'l2io5lul': {
      'en': 'Investment',
      'ar': 'استثمار',
    },
    'krsyyttw': {
      'en': '\$4,637',
      'ar': '4,637 دولار',
    },
    '4mvfe3pe': {
      'en': '40% of portfolio',
      'ar': '40% من المحفظة',
    },
    '6cm4jjje': {
      'en': ' ',
      'ar': '',
    },
    'vox9t1s0': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // LogoInterface
  {
    '5adeev3r': {
      'en': 'Get Started',
      'ar': 'البدء',
    },
  },
  // customerSupport
  {
    'scpxjgf2': {
      'en': 'Welcome to customer support',
      'ar': 'مرحبا بكم في دعم العملاء',
    },
    '5u7mmza1': {
      'en': 'How can we help you?',
      'ar': 'كيف يمكننا مساعدتك؟',
    },
    'zvgbbcyp': {
      'en': 'Call Us',
      'ar': 'اتصل بنا',
    },
    'cazfv8cz': {
      'en': 'Email Us',
      'ar': 'ارسل لنا عبر البريد الإلكتروني',
    },
    'u06k39sw': {
      'en': 'Search FAQs',
      'ar': 'البحث في الأسئلة الشائعة',
    },
    'bgkj3ibs': {
      'en': 'Frequently Asked Questions',
      'ar': 'أسئلة مكررة',
    },
    '9vaew6fv': {
      'en': 'What payment methods do you accept?',
      'ar': 'ما هي طرق الدفع التي تقبلونها؟',
    },
    'wiwcty1p': {
      'en': 'We accept all major credit cards, bank transfers, and PayPal.',
      'ar':
          'نحن نقبل جميع بطاقات الائتمان الرئيسية والتحويلات المصرفية وPayPal.',
    },
    'tlgl7137': {
      'en': 'How can I track my expenses?',
      'ar': 'كيف يمكنني متابعة مصاريفي؟',
    },
    '3klvmsva': {
      'en':
          'You can track your expenses by categorizing your transactions within the app.',
      'ar': 'يمكنك تتبع نفقاتك من خلال تصنيف معاملاتك داخل التطبيق.',
    },
    'od3vsflx': {
      'en': 'Can I set a budget for different categories?',
      'ar': 'هل يمكنني تحديد ميزانية لفئات مختلفة؟',
    },
    'e7g1949l': {
      'en':
          'Yes, you can create and manage budgets for various categories to monitor your spending.',
      'ar': 'نعم، يمكنك إنشاء وإدارة ميزانيات لمختلف الفئات لمراقبة إنفاقك.',
    },
    'jjm12d80': {
      'en': 'What should I do if I forget my password?',
      'ar': 'ماذا يجب أن أفعل إذا نسيت كلمة المرور الخاصة بي؟',
    },
    'o8stnzvn': {
      'en':
          'You can reset your password by clicking on the \'Forgot Password\' option on the sign-in page.',
      'ar':
          'يمكنك إعادة تعيين كلمة المرور الخاصة بك عن طريق النقر على خيار \"نسيت كلمة المرور\" في صفحة تسجيل الدخول.',
    },
    's7qylxv8': {
      'en': 'How do I contact customer service?',
      'ar': 'كيف أتواصل مع خدمة العملاء؟',
    },
    '16g9f94g': {
      'en':
          'You can reach out to our customer service team via email at HalalahSupport@app.com or call us at (123) 456-****.',
      'ar':
          'يمكنك التواصل مع فريق خدمة العملاء لدينا عبر البريد الإلكتروني على HalalahSupport@app.com أو الاتصال بنا على (123) 456-****.',
    },
    'nmfsjy5x': {
      'en': 'Chat Now',
      'ar': 'الدردشة الآن',
    },
    'mqmjp7ck': {
      'en': 'Get support',
      'ar': 'احصل على الدعم',
    },
    'x9r1b6qd': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // inviocePage
  {
    'efsrt1sp': {
      'en': 'Below are a summary of your invoices.',
      'ar': 'فيما يلي ملخص لفواتيرك.',
    },
    '9b45ch9f': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'zxfuwh76': {
      'en': 'Today',
      'ar': 'اليوم',
    },
    'ydbxetjg': {
      'en': 'ScreenStudio App',
      'ar': 'تطبيق سكرين ستوديو',
    },
    'fq1r5as6': {
      'en': 'Paid on: May, 4th 20244',
      'ar': 'تم الدفع في: 4 مايو 20244',
    },
    'ond7c550': {
      'en': '\$24.99',
      'ar': '24.99 دولارًا',
    },
    'e654u0wt': {
      'en': 'DUE',
      'ar': 'حق',
    },
    'dzgta2zv': {
      'en': 'Slack Ltd',
      'ar': 'سلاك المحدودة',
    },
    '2lea2vta': {
      'en': 'Paid on: May, 4th 20244',
      'ar': 'تم الدفع في: 4 مايو 20244',
    },
    'ra0gdk2q': {
      'en': '\$17.50',
      'ar': '17.50 دولارًا',
    },
    'mwl82rqy': {
      'en': 'DUE',
      'ar': 'حق',
    },
    'j71bmud3': {
      'en': 'Earlier Invoices',
      'ar': 'الفواتير السابقة',
    },
    '36x1caow': {
      'en': 'Dribbble LTD.',
      'ar': 'دريببل المحدودة.',
    },
    'jkjyyntw': {
      'en': 'Paid on: May, 4th 2024',
      'ar': 'تم السداد في: 4 مايو 2024',
    },
    'sfbkn1zz': {
      'en': '\$36.00',
      'ar': '36.00 دولارًا',
    },
    '8wgm1p62': {
      'en': 'Overdue',
      'ar': 'تأخرت',
    },
    'ycv23pao': {
      'en': 'FlutterFlow',
      'ar': 'FlutterFlow',
    },
    '9rilnmcq': {
      'en': 'Paid on: May, 4th 2024',
      'ar': 'تم السداد في: 4 مايو 2024',
    },
    'zqycdz8m': {
      'en': '\$99.99',
      'ar': '99.99 دولارًا',
    },
    '9qm9nc11': {
      'en': 'Overdue',
      'ar': 'تأخرت',
    },
    '0rmmm9oj': {
      'en': 'ScreenStudio App',
      'ar': 'تطبيق سكرين ستوديو',
    },
    '5vsxr71a': {
      'en': 'Paid on: May, 4th 2024',
      'ar': 'تم السداد في: 4 مايو 2024',
    },
    'uvqv36dt': {
      'en': '\$24.99',
      'ar': '24.99 دولارًا',
    },
    'jp9vwnjm': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'yt2hvt3d': {
      'en': 'Slack Ltd',
      'ar': 'سلاك المحدودة',
    },
    'koih3kdf': {
      'en': 'Paid on: May, 4th 2024',
      'ar': 'تم السداد في: 4 مايو 2024',
    },
    '2kl5d0w5': {
      'en': '\$17.50',
      'ar': '17.50 دولارًا',
    },
    'wvw3xq5n': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'j2gupb52': {
      'en': 'Open',
      'ar': 'يفتح',
    },
    'qoh7n0v7': {
      'en': 'Today',
      'ar': 'اليوم',
    },
    '5ltueyb5': {
      'en': 'ScreenStudio App',
      'ar': 'تطبيق سكرين ستوديو',
    },
    'z16dctbs': {
      'en': 'Paid on: May, 4th 2023',
      'ar': 'تم السداد في: 4 مايو 2023',
    },
    'wklj0s1s': {
      'en': '\$24.99',
      'ar': '24.99 دولارًا',
    },
    'tfg23mwr': {
      'en': 'DUE',
      'ar': 'حق',
    },
    '3k23j2lg': {
      'en': 'Slack Ltd',
      'ar': 'سلاك المحدودة',
    },
    '0f6arf62': {
      'en': 'Paid on: May, 4th 2023',
      'ar': 'تم السداد في: 4 مايو 2023',
    },
    'sy8hxfu5': {
      'en': '\$17.50',
      'ar': '17.50 دولارًا',
    },
    'lgvzwijk': {
      'en': 'DUE',
      'ar': 'حق',
    },
    'y8xnaugh': {
      'en': 'Earlier Invoices',
      'ar': 'الفواتير السابقة',
    },
    '2hlr9k2e': {
      'en': 'Dribbble LTD.',
      'ar': 'دريببل المحدودة.',
    },
    'k6m254ts': {
      'en': 'Paid on: May, 4th 2023',
      'ar': 'تم السداد في: 4 مايو 2023',
    },
    '9nxl0b2h': {
      'en': '\$36.00',
      'ar': '36.00 دولارًا',
    },
    'sbuyk12r': {
      'en': 'Overdue',
      'ar': 'تأخرت',
    },
    'm4127a2f': {
      'en': 'FlutterFlow',
      'ar': 'FlutterFlow',
    },
    '7rhw4m0e': {
      'en': 'Paid on: May, 4th 2023',
      'ar': 'تم السداد في: 4 مايو 2023',
    },
    '73tpscdl': {
      'en': '\$99.99',
      'ar': '99.99 دولارًا',
    },
    'a96shko3': {
      'en': 'Overdue',
      'ar': 'تأخرت',
    },
    '82tid5j3': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'etoyxp5z': {
      'en': 'Earlier Invoices',
      'ar': 'الفواتير السابقة',
    },
    '5a9x82qg': {
      'en': 'Dribbble LTD.',
      'ar': 'دريببل المحدودة.',
    },
    '9yi7x8ec': {
      'en': 'Paid on: May, 4th 2023',
      'ar': 'تم السداد في: 4 مايو 2023',
    },
    '9o3z9ira': {
      'en': '\$36.00',
      'ar': '36.00 دولارًا',
    },
    '09ooriic': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'vxfj24m8': {
      'en': 'FlutterFlow',
      'ar': 'FlutterFlow',
    },
    'k4wjzjs5': {
      'en': 'Paid on: May, 4th 2023',
      'ar': 'تم السداد في: 4 مايو 2023',
    },
    'kxizl8pi': {
      'en': '\$99.99',
      'ar': '99.99 دولارًا',
    },
    '5prar5zz': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'c2u8vawn': {
      'en': 'Invoices',
      'ar': 'الفواتير',
    },
    'wzka0hw2': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // AddingAClient
  {
    '4gmpg43x': {
      'en': 'My acounts',
      'ar': 'حساباتي',
    },
    '2uxo85r1': {
      'en': 'M',
      'ar': 'م',
    },
    'ldxsklfg': {
      'en': 'Main',
      'ar': 'رئيسي',
    },
    'n60wjbco': {
      'en': 'S',
      'ar': 'س',
    },
    'kek8bioe': {
      'en': 'Savings',
      'ar': 'مدخرات',
    },
    'fs8p5ro3': {
      'en': 'I',
      'ar': 'أنا',
    },
    'z3eg71kc': {
      'en': 'Investment',
      'ar': 'استثمار',
    },
    'khoy48oc': {
      'en': 'Halalah bank',
      'ar': 'بنك هللة',
    },
    't049jrng': {
      'en': 'A',
      'ar': 'أ',
    },
    '8fisjrdz': {
      'en': 'Aram Al-Sedrani',
      'ar': 'آرام السدراني',
    },
    't11os7b8': {
      'en': 'A',
      'ar': 'أ',
    },
    'uyen0r5x': {
      'en': 'Alyaa Al-Ghezii',
      'ar': 'علياء الغزي',
    },
    'cqd3hjs9': {
      'en': 'H',
      'ar': 'ح',
    },
    'nvxafr6m': {
      'en': 'Haanan Al-Ali',
      'ar': 'حنان العلي',
    },
    '6tyjqorq': {
      'en': 'S',
      'ar': 'س',
    },
    'rosz6bbd': {
      'en': '\tSarah Al-Omari',
      'ar': 'سارة العمري',
    },
    'c4hbfuwh': {
      'en': 'Local bank',
      'ar': 'البنك المحلي',
    },
    'eo2lrc6b': {
      'en': 'D',
      'ar': 'د',
    },
    'uc4aumst': {
      'en': 'Danah Al-Ghezii',
      'ar': 'دانة الغزيعي',
    },
    'rjlj2f11': {
      'en': 'D',
      'ar': 'د',
    },
    'e4wlktza': {
      'en': 'Danah  Al-Omari',
      'ar': 'دانة العمري',
    },
    'n9xuudgn': {
      'en': 'G',
      'ar': 'ز',
    },
    '78v5u5we': {
      'en': 'Ghaida  Al-Dowsary',
      'ar': 'غيداء الدوسري',
    },
    'mzkx6ccr': {
      'en': 'H',
      'ar': 'ح',
    },
    'mb07i79i': {
      'en': 'Haya Muhammad',
      'ar': 'هيا محمد',
    },
    'crdgmdva': {
      'en': 'S',
      'ar': 'س',
    },
    'n92nur3m': {
      'en': 'Sadeem  Al-Zahrani',
      'ar': 'سديم الزهراني',
    },
    'md6m35mv': {
      'en': 'S',
      'ar': 'س',
    },
    'xjig0jcu': {
      'en': 'Sara  Al-Bader',
      'ar': 'سارة البدر',
    },
    'n5xhfz0y': {
      'en': 'International bank',
      'ar': 'البنك الدولي',
    },
    '9y5xhwly': {
      'en': 'K',
      'ar': 'ك',
    },
    'xzmvwnx4': {
      'en': 'Khawla Al-Ghezii',
      'ar': 'خولة الغزيعي',
    },
    'f99bfmqy': {
      'en': 'Beneficiaries',
      'ar': 'المستفيدون',
    },
    'tp0x9udl': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // depositPage
  {
    'f1rr3h4c': {
      'en': 'Select amount to transfer into your wallet',
      'ar': 'حدد المبلغ المراد تحويله إلى محفظتك',
    },
    'f4iy2ik9': {
      'en': '\$1.000',
      'ar': '1.000 دولار',
    },
    'llqlvxzh': {
      'en': '-',
      'ar': '-',
    },
    'ti16rdw4': {
      'en': '+',
      'ar': '+',
    },
    '3fkgxmyg': {
      'en': 'Select card to deposit',
      'ar': 'اختر البطاقة للإيداع',
    },
    'ci5soxbg': {
      'en': 'Main Card',
      'ar': 'البطاقة الرئيسية',
    },
    'nwb487rp': {
      'en': '•••• 4213',
      'ar': '•••• 4213',
    },
    'baits6cv': {
      'en': '\$7,302',
      'ar': '7,302 دولار',
    },
    'cu15m2oc': {
      'en': 'Savings Card',
      'ar': 'بطاقة التوفير',
    },
    'vlinhuwi': {
      'en': '•••• 4621',
      'ar': '•••• 4621',
    },
    'q2wbbt33': {
      'en': '\$12,047.29',
      'ar': '12,047.29 دولارًا',
    },
    '68psptvk': {
      'en': 'Transactions',
      'ar': 'المعاملات',
    },
    'j9bnv4j4': {
      'en': 'Barcode scanner',
      'ar': 'ماسح الباركود',
    },
    'e0ziolkz': {
      'en': 'Today, 4:32pm',
      'ar': 'اليوم الساعة 4:32 مساءً',
    },
    '6uoupj88': {
      'en': '\$1,900',
      'ar': '1900 دولار',
    },
    'k732lwsy': {
      'en': 'ATM',
      'ar': 'ماكينة الصراف الآلي',
    },
    'wgqtta8a': {
      'en': 'Week ago, 1:26pm',
      'ar': 'منذ أسبوع، الساعة 1:26 مساءً',
    },
    'gc57a4gx': {
      'en': '\$250',
      'ar': '250 دولارًا',
    },
    'nww7ykzb': {
      'en': 'ATM',
      'ar': 'ماكينة الصراف الآلي',
    },
    'pabjhnf7': {
      'en': '4 Week ago, 6:56pm',
      'ar': 'منذ 4 أسابيع، الساعة 6:56 مساءً',
    },
    'vs9x4alz': {
      'en': '\$3,000',
      'ar': '3000 دولار',
    },
    '8i2gadfd': {
      'en': 'Barcode scanner',
      'ar': 'ماسح الباركود',
    },
    'hny0rgdp': {
      'en': 'Month ago, 8:00pm',
      'ar': 'منذ شهر، الساعة 8:00 مساءً',
    },
    'ebjsow0e': {
      'en': '\$500',
      'ar': '500 دولار',
    },
    'esc5po4c': {
      'en': 'Barcode scanner',
      'ar': 'ماسح الباركود',
    },
    'v87hzg9c': {
      'en': '2 Month ago, 9:02am',
      'ar': 'منذ شهرين، الساعة 9:02 صباحًا',
    },
    'jx0tyc29': {
      'en': '\$1,000',
      'ar': '1000 دولار',
    },
    'ef878kn9': {
      'en': 'Deposit funds',
      'ar': 'إيداع الأموال',
    },
    'ed8gl1lp': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // chooseWayToDeposit
  {
    'b3ps3l4b': {
      'en': 'Main Card',
      'ar': 'البطاقة الرئيسية',
    },
    '2n91y3ga': {
      'en': 'Your Name',
      'ar': 'اسمك',
    },
    'kjsrmcm5': {
      'en': 'Barcode',
      'ar': 'الباركود',
    },
    '0i9ytut2': {
      'en': 'ATM',
      'ar': 'ماكينة الصراف الآلي',
    },
    'i76332g9': {
      'en': 'Apple Pay',
      'ar': 'أبل الدفع',
    },
    '849sdk7z': {
      'en': 'Continue',
      'ar': 'يكمل',
    },
    'v1z06ned': {
      'en': 'Pay w/Paypal',
      'ar': 'الدفع ث / باي بال',
    },
    '4c8qinqw': {
      'en': 'Choose the way to deposit',
      'ar': 'اختر طريقة الإيداع',
    },
    'apttx6gi': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // barcodePage
  {
    'warop9tr': {
      'en': 'Redirect',
      'ar': 'إعادة توجيه',
    },
    'a7chynml': {
      'en': 'Below is a barcode to your deposit.',
      'ar': 'يوجد أدناه رمز شريطي لإيداعك.',
    },
    'acd2jxic': {
      'en': 'Continue to Checkout',
      'ar': 'الاستمرار في الخروج',
    },
    'd8vla51f': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // depositComplete
  {
    '4mbh3d5t': {
      'en': 'Deposit Complete',
      'ar': 'اكتمل الإيداع',
    },
    '075ii0yp': {
      'en': 'Great work, you successfully deposit funds to your acount.',
      'ar': 'عمل رائع، لقد نجحت في إيداع الأموال في حسابك.',
    },
    'lix3m4qm': {
      'en': 'Okay',
      'ar': 'تمام',
    },
    't8un528u': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // withdrawalPage
  {
    '50bgddgq': {
      'en': 'Select amount to withdraw from your wallet',
      'ar': 'حدد المبلغ المراد سحبه من محفظتك',
    },
    'baddcr1t': {
      'en': '\$500',
      'ar': '500 دولار',
    },
    'm65wb7f5': {
      'en': '-',
      'ar': '-',
    },
    'j5qmmhel': {
      'en': '+',
      'ar': '+',
    },
    '5d9jbiwl': {
      'en': 'Select card to Withdrawal',
      'ar': 'اختر البطاقة للسحب',
    },
    'sce53b0m': {
      'en': 'Main Card',
      'ar': 'البطاقة الرئيسية',
    },
    '6rcgsalu': {
      'en': '•••• 4213',
      'ar': '•••• 4213',
    },
    '2229iskh': {
      'en': '\$7,302',
      'ar': '7,302 دولار',
    },
    'cftf9dm2': {
      'en': 'Savings Card',
      'ar': 'بطاقة التوفير',
    },
    'pbdkoxav': {
      'en': '•••• 4621',
      'ar': '•••• 4621',
    },
    '61emsfj5': {
      'en': '\$12,047.29',
      'ar': '12,047.29 دولارًا',
    },
    'yx9m3rxy': {
      'en': 'Transactions',
      'ar': 'المعاملات',
    },
    'oi1yddqi': {
      'en': 'Barcode scanner',
      'ar': 'ماسح الباركود',
    },
    'q3dl6aic': {
      'en': 'Today, 4:32pm',
      'ar': 'اليوم الساعة 4:32 مساءً',
    },
    '07t7t8nv': {
      'en': '\$1,900',
      'ar': '1900 دولار',
    },
    '7clc7c9k': {
      'en': 'ATM',
      'ar': 'ماكينة الصراف الآلي',
    },
    '9t780ne7': {
      'en': 'Week ago, 1:26pm',
      'ar': 'منذ أسبوع، الساعة 1:26 مساءً',
    },
    '8ttr6t18': {
      'en': '\$250',
      'ar': '250 دولارًا',
    },
    '5f7fg02f': {
      'en': 'ATM',
      'ar': 'ماكينة الصراف الآلي',
    },
    'sqz1p8r0': {
      'en': '4 Week ago, 6:56pm',
      'ar': 'منذ 4 أسابيع، الساعة 6:56 مساءً',
    },
    '9xv7kihk': {
      'en': '\$3,000',
      'ar': '3000 دولار',
    },
    'h0p4q83e': {
      'en': 'Barcode scanner',
      'ar': 'ماسح الباركود',
    },
    'nur85fod': {
      'en': 'Month ago, 8:00pm',
      'ar': 'منذ شهر، الساعة 8:00 مساءً',
    },
    'iuokaj7w': {
      'en': '\$500',
      'ar': '500 دولار',
    },
    '1q1x8ryg': {
      'en': 'Barcode scanner',
      'ar': 'ماسح الباركود',
    },
    't32hojwg': {
      'en': '2 Month ago, 9:02am',
      'ar': 'منذ شهرين، الساعة 9:02 صباحًا',
    },
    'rsk36veu': {
      'en': '\$1,000',
      'ar': '1000 دولار',
    },
    'xtd5shr4': {
      'en': 'Withdrawal funds',
      'ar': 'سحب الأموال',
    },
    'u717w9ps': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // chooseWayToWithdrawal
  {
    '1p3wawct': {
      'en': 'Main Card',
      'ar': 'البطاقة الرئيسية',
    },
    'qh3080se': {
      'en': 'Your Name',
      'ar': 'اسمك',
    },
    'p9l2k5nw': {
      'en': 'Barcode',
      'ar': 'الباركود',
    },
    'y9305fz8': {
      'en': 'ATM',
      'ar': 'ماكينة الصراف الآلي',
    },
    'a2khm0ta': {
      'en': 'Apple Pay',
      'ar': 'أبل الدفع',
    },
    '68zl4h7k': {
      'en': 'Continue',
      'ar': 'يكمل',
    },
    'fknkbg81': {
      'en': 'Pay w/Paypal',
      'ar': 'الدفع ث / باي بال',
    },
    'oupjbitt': {
      'en': 'Choose the way to withdrawal',
      'ar': 'اختر طريقة السحب',
    },
    'wklkbqv0': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // barcodePageToWithdrawal
  {
    'eohr792l': {
      'en': 'Redirect',
      'ar': 'إعادة توجيه',
    },
    '1ugj0hc0': {
      'en': 'Below is a barcode to your withdrawal.',
      'ar': 'يوجد أدناه رمز شريطي لعملية السحب الخاصة بك.',
    },
    'e0crur3l': {
      'en': 'Continue to Checkout',
      'ar': 'الاستمرار في الخروج',
    },
    'rh0gbrge': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // withdrawalComplete
  {
    '4tqh9se9': {
      'en': ' Withdrawal Complete',
      'ar': 'اكتمل السحب',
    },
    'ialfcbq9': {
      'en': 'Great work, you successfully withdrawal funds from your acount.',
      'ar': 'عمل رائع، لقد نجحت في سحب الأموال من حسابك.',
    },
    'rl053r2o': {
      'en': 'Okay',
      'ar': 'تمام',
    },
    'n6s2ft2v': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // codeVerification
  {
    '9yy8vbk5': {
      'en': 'Verification page',
      'ar': 'صفحة التحقق',
    },
    'l1mwlrba': {
      'en': 'Enter the code number from SMS',
      'ar': 'أدخل رقم الرمز من الرسائل القصيرة',
    },
    'nixlrbbw': {
      'en': 'We sent code to phone number ***2421',
      'ar': 'أرسلنا الرمز إلى رقم الهاتف ***2421',
    },
    'bbyruwhx': {
      'en': 'Continue',
      'ar': 'يكمل',
    },
    'og2voa9g': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // bookAppointment
  {
    'sfzj3riz': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
    },
    '4skzh9os': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه لحجز موعدك مع مكتبنا.',
    },
    'b87tcas2': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
    },
    'iicnw3dq': {
      'en': 'Booking For',
      'ar': 'الحجز ل',
    },
    '5tkkg4yu': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
    },
    '7w5m45zt': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
    },
    'bmfmxg71': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
    },
    'prt95f0g': {
      'en': 'Scan/Update',
      'ar': 'مسح/تحديث',
    },
    '7ohalsg9': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
    },
    'xukiv2ku': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
    },
    'lpc88cht': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'b5umyycx': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
    },
  },
  // bookingOld
  {
    '8laf5zmk': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
    },
    'udwhsu8p': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه لحجز موعدك مع مكتبنا.',
    },
    'm6f5lawq': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    'yz52729g': {
      'en': 'Booking For',
      'ar': 'الحجز ل',
    },
    'hdmqdmzq': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
    },
    'stpxpct6': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
    },
    'wvgk6obb': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
    },
    'xt7ujyt8': {
      'en': 'Scan/Update',
      'ar': 'مسح/تحديث',
    },
    'andpn0t0': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
    },
    'ycaso9dc': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
    },
    '2pmd2p3w': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    '13j05r8j': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
    },
  },
  // editBooking
  {
    '6j668hma': {
      'en': 'Edit Appointment',
      'ar': 'تحرير الموعد',
    },
    'cbp936ta': {
      'en': 'Edit the fields below in order to change your appointment.',
      'ar': 'قم بتحرير الحقول أدناه لتغيير موعدك.',
    },
    '6btfslje': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
    },
    'mhko6q8p': {
      'en': 'Booking For',
      'ar': 'الحجز ل',
    },
    'shqcgjqe': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
    },
    '5ixhbnsd': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
    },
    'db46hhfw': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
    },
    'e1zm6kzh': {
      'en': 'Scan/Update',
      'ar': 'مسح/تحديث',
    },
    'oy6qvd33': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
    },
    '9emhgrhs': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
    },
    '2bzoinpy': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'gjnq0j86': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
  },
  // pauseCard
  {
    'dt7m486y': {
      'en': 'Pause Card',
      'ar': 'بطاقة الإيقاف المؤقت',
    },
    '6edae99k': {
      'en': 'Are you sure you want to pause your card?',
      'ar': 'هل أنت متأكد أنك تريد إيقاف بطاقتك مؤقتًا؟',
    },
    'omtrfcm5': {
      'en': 'Nevermind',
      'ar': 'لا تهتم',
    },
    'hw07mkb9': {
      'en': 'Yes, Pause',
      'ar': 'نعم وقفة',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
    },
    '9rqasttc': {
      'en':
          'To receive notifications, this app requires permission. Do you agree?',
      'ar': '',
    },
    'e0ucok7s': {
      'en':
          'To access your location, this app requires permission. Do you agree?',
      'ar': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
    },
    'ikvuavx4': {
      'en': '',
      'ar': '',
    },
    'so01oy5l': {
      'en': '',
      'ar': '',
    },
    '7ct0c333': {
      'en': '',
      'ar': '',
    },
    'tiellq40': {
      'en': '',
      'ar': '',
    },
    '68obcx2s': {
      'en': '',
      'ar': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
    },
    '9r2z61rf': {
      'en': '',
      'ar': '',
    },
    'tofm8r0f': {
      'en': '',
      'ar': '',
    },
    'pgnv8s4v': {
      'en': '',
      'ar': '',
    },
    'xy066yqc': {
      'en': '',
      'ar': '',
    },
    'jgjc8wya': {
      'en': '',
      'ar': '',
    },
    'ddf1jhwl': {
      'en': '',
      'ar': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
