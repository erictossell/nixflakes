{
  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };
  location = {
    latitude = 42.1;
    longitude = -88.6;
  };
}
