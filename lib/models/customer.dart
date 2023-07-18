class Customer {
  final String name;
  final String city;
  final String image;
  final double rate;
  final String desc;

  Customer({
    required this.name,
    required this.city,
    required this.image,
    required this.rate,
    required this.desc,
  });
}

List<Customer> customers = [
  Customer(
    name: 'Nathan Mcdonalid',
    city: 'Warsaw, Poland',
    image: 'https://randomuser.me/api/portraits/men/51.jpg',
    rate: 4.2,
    desc: '“Wow... I am very happy to use this VPN, it turned out to be more than my expectations and so far there have been no problems. LaslesVPN always the best”.',
  ),

  Customer(
    name: 'Yessica Christy',
    city: 'Shanxi, China',
    image: 'https://randomuser.me/api/portraits/women/0.jpg',
    rate: 4.5,
    desc: '“I like it because I like to travel far and still can connect with high speed.”.',
  ),

  Customer(
    name: 'Kim Young Jou',
    city: 'Seoul, South Korea',
    image: 'https://randomuser.me/api/portraits/women/51.jpg',
    rate: 5,
    desc: '“This is very unusual for my business that currently requires a virtual private network that has high security.”.',
  ),
  Customer(
    name: 'Viezh Robert',
    city: 'Warsaw, Poland',
    image: 'https://randomuser.me/api/portraits/men/72.jpg',
    rate: 4.5,
    desc: '“Wow... I am very happy to use this VPN, it turned out to be more than my expectations and so far there have been no problems. LaslesVPN always the best”.',
  ),

  
];
