import 'package:flutter/material.dart';

class InvestActiveCard {
  final String img;
  final String logo;
  final String type;
  final String title;
  final String returns;
  final String cost;
  final String investors;
  final String label;
  final String sector;
  final String duration;
  final String patner;
  final String location;

  final VoidCallback onClicked;

  InvestActiveCard({
    required this.img,
    required this.logo,
    required this.type,
    required this.title,
    required this.returns,
    required this.cost,
    required this.investors,
    required this.label,
    required this.sector,
    required this.duration,
    required this.patner,
    required this.location,
    required this.onClicked,
  });
}

List<InvestActiveCard> investActiveCard = [
  InvestActiveCard(
      img: 'assets/images/Savings.png',
      logo: 'assets/svg/clLogo.svg',
      type: 'Fixed Income',
      title: 'Credit Financing: Welding',
      returns: '34%',
      cost: '₦ 10,000.00',
      investors: '3401',
      label: 'Active',
      sector: 'Agriculture',
      duration: '9 months',
      patner: 'Lead Insurances',
      location: 'Rivers State',
      onClicked: () {}),
  InvestActiveCard(
      img: 'assets/images/Savings.png',
      logo: 'assets/svg/clLogo.svg',
      type: 'Fixed Income',
      title: 'Credit Financing: Sand Dredging',
      returns: '46%',
      cost: '₦ 5,000.00',
      investors: '2901',
      label: 'Active',
      sector: 'Agriculture',
      duration: '6 months',
      patner: 'Access Insurances',
      location: 'Ogun State',
      onClicked: () {})
];

class InvestExploreCard {
  final String img;
  final String logo;
  final String type;
  final String title;
  final String returns;
  final String cost;
  final String investors;
  final String? label;
  final VoidCallback onClicked;

  InvestExploreCard({
    required this.img,
    required this.logo,
    required this.type,
    required this.title,
    required this.returns,
    required this.cost,
    required this.investors,
    this.label,
    required this.onClicked,
  });
}

List<InvestExploreCard> investExploreCard = [
  InvestExploreCard(
      img: 'assets/images/Savings.png',
      logo: 'assets/svg/clLogo.svg',
      type: 'Fixed Income',
      title: 'Credit Financing: Sand Dredging',
      returns: '46%',
      cost: '₦ 5,000.00',
      investors: '2901',
      label: 'Active',
      onClicked: () {}),
  InvestExploreCard(
      img: 'assets/images/Savings.png',
      logo: 'assets/svg/clLogo.svg',
      type: 'Fixed Income',
      title: 'Credit Financing: Sand Dredging',
      returns: '46%',
      cost: '₦ 5,000.00',
      investors: '2901',
      label: 'Active',
      onClicked: () {}),
  InvestExploreCard(
      img: 'assets/images/Savings.png',
      logo: 'assets/svg/clLogo.svg',
      type: 'Fixed Income',
      title: 'Credit Financing: Sand Dredging',
      returns: '46%',
      cost: '₦ 5,000.00',
      investors: '2901',
      label: 'Active',
      onClicked: () {}),
  InvestExploreCard(
      img: 'assets/images/Savings.png',
      logo: 'assets/svg/clLogo.svg',
      type: 'Fixed Income',
      title: 'Credit Financing: Sand Dredging',
      returns: '46%',
      cost: '₦ 5,000.00',
      investors: '2901',
      label: 'Active',
      onClicked: () {}),
  InvestExploreCard(
      img: 'assets/images/Savings.png',
      logo: 'assets/svg/clLogo.svg',
      type: 'Fixed Income',
      title: 'Credit Financing: Sand Dredging',
      returns: '46%',
      cost: '₦ 5,000.00',
      investors: '2901',
      label: 'Active',
      onClicked: () {}),
  InvestExploreCard(
      img: 'assets/images/Savings.png',
      logo: 'assets/svg/clLogo.svg',
      type: 'Fixed Income',
      title: 'Credit Financing: Sand Dredging',
      returns: '46%',
      cost: '₦ 5,000.00',
      investors: '2901',
      label: 'Active',
      onClicked: () {}),
];

class InvestMaturedCard {
  final String img;
  final String logo;
  final String type;
  final String title;
  final String returns;
  final String cost;
  final String investors;
  final String label;
  final VoidCallback onClicked;

  InvestMaturedCard({
    required this.img,
    required this.logo,
    required this.type,
    required this.title,
    required this.returns,
    required this.cost,
    required this.investors,
    required this.label,
    required this.onClicked,
  });
}

List<InvestMaturedCard> investMaturedCard = [
  InvestMaturedCard(
      img: 'assets/images/Savings.png',
      logo: 'assets/svg/clLogo.svg',
      type: 'Fixed Income',
      title: 'Credit Financing: Sand Dredging',
      returns: '46%',
      cost: '₦ 5,000.00',
      investors: '2901',
      label: 'Completed',
      onClicked: () {}),
  InvestMaturedCard(
      img: 'assets/images/Savings.png',
      logo: 'assets/svg/clLogo.svg',
      type: 'Fixed Income',
      title: 'Credit Financing: Sand Dredging',
      returns: '46%',
      cost: '₦ 5,000.00',
      investors: '2901',
      label: 'Completed',
      onClicked: () {})
];
