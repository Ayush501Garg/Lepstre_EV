import '../../core/constants/image_path.dart';

final List vehicleList = [
  {
    "name": "TANK",
    "Battery Type": "48V20AH/72V40AH Lithium",
    "Range": "50km/110km",
    "Emission": "0.7g/km",
    "image": tank_darkgreen,
  },
  {
    "name": "S92 PRO",
    "Battery Type": "72V35Ah Lead Acid",
    "Range": "90KM@ 30km",
    "Emission": "0.7g/km",
    "image": S92PRO_white,
  },
  {
    "name": "SPORT F1 PRO",
    "Battery Type": "72V35Ah Lead Acid",
    "Range": "90KM@ 30km",
    "Emission": "0.7g/km",
    "image": voltiger_white,
  },
  {
    "name": "YOUPAO",
    "Battery Type": "48V20AH/72V40AH Lithium",
    "Range": "50km/110km",
    "Emission": "0.7g/km",
    "image": youpao_2_blue,
  },
  {
    "name": "F55",
    "Battery Type": "72V35Ah Lead Acid",
    "Range": "90KM@ 30km",
    "Emission": "0.7g/km",
    "image": T155__2_grey,
  },
  {
    "name": "ZY",
    "Battery Type": "72V35Ah Lead Acid",
    "Range": "90KM@ 30km",
    "Emission": "0.7g/km",
    "image": tiger,
  },
  {
    "name": "A9",
    "Battery Type": "48V20AH/72V40AH Lithium",
    "Range": "50km/110km",
    "Emission": "0.7g/km",
    "image": a9,
  },
  {
    "name": "ROBIN D",
    "Battery Type": "48V/20AH Lead Acid",
    "Range": "40 KM - 45KM",
    "Emission": "0.7g/km",
    "image": robin_d_darkblue,
  },
  {
    "name": "SUMMER/EEC",
    "Battery Type": "72V40Ah Lithium Acid",
    "Range": "55-100 KM",
    "Emission": "0.7g/km",
    "image": summer_light_blue,
  },
  {
    "name": "F85",
    "Battery Type": "72V20Ah Lead Acid",
    "Range": "60-90 KM@ 35Km/h",
    "Emission": "0.7g/km",
    "image": F85_white,
  },
  {
    "name": "Outstanding",
    "Battery Type": "72V30Ah Lithium Battery",
    "Range": "70 KM",
    "Emission": "0.7g/km",
    "image": outstanding,
  },
  {
    "name": "KB",
    "Battery Type": "72V32Ah Lead Acid",
    "Range": "90KM@ 30km/h",
    "Emission": "0.7g/km",
    "image": KB_grey,
  },
];

// ######################
final List<Map<String, String>> sliderData = [
  {
    'image': ev1,
    'title': 'Lepster Ultra X',
    'subtitle': 'Next-gen electric mobility',
  },
  {
    'image': ev1,
    'title': 'Ride Smart',
    'subtitle': 'Eco-friendly urban travel',
  },
];
// #####################

// final List<Map<String, String>> newReleases = [
//   {'image': ev3, 'title': 'Voi unveils scooter', 'price': '\$1590'},
//   {'image': ev4, 'title': 'M300 Electric scooter', 'price': '\$1399'},
//   {'image': ev3, 'title': 'M300 Electric scooter', 'price': '\$1399'},
//   {'image': ev4, 'title': 'M300 Electric scooter', 'price': '\$1399'},
// ];
// #####################

final List<String> categories = [
  'E-Scooter',
  'Electric Bikes',
  'For Kids',
  'Off-road',
  'Accessories',
];

List<Map<String, dynamic>> stations = [
  {
    "image":
        "https://cdn.pixabay.com/photo/2018/04/16/18/06/charging-station-3325418_1280.jpg",
    "name": "GreenCharge Hub",
    "batteries": 4,
    "distance": "1.2 km",
  },
  {
    "image":
        "https://plus.unsplash.com/premium_photo-1714672716183-c717a99f857f?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "name": "ElectroPoint Station",
    "batteries": 2,
    "distance": "3.6 km",
  },
  {
    "image":
        "https://images.unsplash.com/photo-1608023568014-6636291b5584?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fGVsZWN0cmljJTIwdmVoaWNsZSUyMGNoYXJnaW5nfGVufDB8fDB8fHww",
    "name": "VoltFast EV",
    "batteries": 6,
    "distance": "0.9 km",
  },
  {
    "image":
        "https://images.unsplash.com/photo-1672542128826-5f0d578713d2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGVsZWN0cmljJTIwdmVoaWNsZSUyMGNoYXJnaW5nfGVufDB8fDB8fHww",
    "name": "ZapCharge Station",
    "batteries": 5,
    "distance": "5.1 km",
  },
  {
    "image":
        "https://plus.unsplash.com/premium_photo-1679389667208-25e919cb452b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGVsZWN0cmljJTIwdmVoaWNsZSUyMGNoYXJnaW5nfGVufDB8fDB8fHww",
    "name": "EcoCharge Point",
    "batteries": 3,
    "distance": "2.8 km",
  },
];
final List<String> sliderImages = [banner1, banner2];

List globalFavoriteVehicleNames = [];
