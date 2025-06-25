import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


List<Map<String, dynamic>> historyData = [
  {
    'sectionTitle': 'Rental & Lease History',
    'content': {
      'Scooter Name & Model': 'Lepstre EV S100',
      'Booking Type': 'Rental',
      'Start Date - End Date': '10 July 2025 - 15 July 2025',
      'Duration': '5 Days',
      'Price Paid': '₹1200',
      'Status': 'Completed',
    },
  },
  {
    'sectionTitle': 'Purchase History',
    'content': {
      'Scooter Name & Model': 'Lepstre EV S200',
      'Purchase Date': '05 June 2025',
      'Price Paid': '₹95,000',
      'Payment Method': 'EMI - HDFC Bank',
      'Status': 'In Process',
    },
  },
  {
    'sectionTitle': 'Favorites',
    'content': {
      'Scooter Name & Model': 'Lepstre EV TurboX',
      'Date Added to Favorites': '12 July 2025',
      'Quick Action': 'Book Now',
    },
  },
  {
    'sectionTitle': 'Profile Update History',
    'content': {
      'Updated Field': 'Mobile Number',
      'Date of Update': '18 July 2025',
    },
  },
  {
    'sectionTitle': 'Login / Logout Activity',
    'content': {
      'Date & Time': '22 July 2025, 09:15 AM',
      'Device Name / OS': 'Samsung Galaxy S22 / Android 14',
      'IP Address': '203.122.56.78',
      'Action': 'Login',
    },
  },
  {
    'sectionTitle': 'Payment History',
    'content': {
      'Transaction ID': 'TXN987654321',
      'Date & Time': '15 July 2025, 02:30 PM',
      'Amount': '₹3500',
      'Payment Method': 'UPI - Google Pay',
      'Status': 'Success',
    },
  },
  {
    'sectionTitle': 'Support / Complaint History',
    'content': {
      'Ticket ID': 'SUPP54321',
      'Date Raised': '07 July 2025',
      'Issue Title': 'Brake Pad Noise',
      'Status': 'Resolved',
      'Resolution Date': '09 July 2025',
    },
  },
  {
    'sectionTitle': 'Offers / Coupons Used',
    'content': {
      'Offer Name': 'Summer Ride 2025',
      'Date Applied': '01 July 2025',
      'Discount Amount': '₹800',
      'On which Booking / Purchase': 'Lepstre EV S100 Rental',
    },
  },
];

List<Map<String, dynamic>> stations = [
  {
    "image": "https://cdn.pixabay.com/photo/2018/04/16/18/06/charging-station-3325418_1280.jpg",
    "name": "GreenCharge Hub",
    "batteries": 4,
    "distance": "1.2 km"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1714672716183-c717a99f857f?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "name": "ElectroPoint Station",
    "batteries": 2,
    "distance": "3.6 km"
  },
  {
    "image": "https://images.unsplash.com/photo-1608023568014-6636291b5584?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fGVsZWN0cmljJTIwdmVoaWNsZSUyMGNoYXJnaW5nfGVufDB8fDB8fHww",
    "name": "VoltFast EV",
    "batteries": 6,
    "distance": "0.9 km"
  },
  {
    "image": "https://images.unsplash.com/photo-1672542128826-5f0d578713d2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGVsZWN0cmljJTIwdmVoaWNsZSUyMGNoYXJnaW5nfGVufDB8fDB8fHww",
    "name": "ZapCharge Station",
    "batteries": 5,
    "distance": "5.1 km"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1679389667208-25e919cb452b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGVsZWN0cmljJTIwdmVoaWNsZSUyMGNoYXJnaW5nfGVufDB8fDB8fHww",
    "name": "EcoCharge Point",
    "batteries": 3,
    "distance": "2.8 km"
  },
];




