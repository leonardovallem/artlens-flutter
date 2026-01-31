enum Destination {
  home("/"),
  detail("/detail");

  final String route;
  const Destination(this.route);
}