class Plan {
  final String title;
  final List<String> features;
  final int? price;

  Plan({
    required this.title,
    required this.features,
    required this.price,
  });
}


List<Plan> plans = [
  Plan(
    title: 'Free Plan',
    features: [
      'Unlimited Bandwitch',
      'Encrypted Connection',
      'No Traffic Logs',
      'Works on All Devices',
    ],
    price: null,
  ),
  Plan(
    title: 'Standard Plan',
    features: [
      'Unlimited Bandwitch',
      'Encrypted Connection',
      'Yes Traffic Logs',
      'Works on All Devices',
      'Connect Anyware',
    ],
    price: 9,
  ),
  Plan(
    title: 'Premium Plan',
    features: [
      'Unlimited Bandwitch',
      'Encrypted Connection',
      'Yes Traffic Logs',
      'Works on All Devices',
      'Connect Anyware',
      'Get New Features'
    ],
    price: 12,
  ),
];
