class Onboarder {
  final String pix;
  final String title;
  final String desc;

  Onboarder({required this.pix, required this.title, required this.desc});
}

List<Onboarder> onboarder = [
  Onboarder(
      pix: 'assets/svg/onb1.svg',
      title: 'Invest Safely and Easily, in\nHigh yeilding Investment Products',
      desc:
          'We provide safe and insured investment \nproducts for you to grow your wealth'),
  Onboarder(
      pix: 'assets/svg/onb2.svg',
      title: 'Build weath with daily\nCompound Interest',
      desc:
          'Watch your wealth grow on the daily basis & \nwithdraw profits into your bank accounts weekly'),
  Onboarder(
      pix: 'assets/svg/onb3.svg',
      title: 'Save and invest in Naira,\nearn in US Dollars',
      desc:
          'Be rest assured that iflation won\'t eat away \nyour funds and profits')
];
