{ pkgs, ... }:

{
  programs.firefox = {
    policies = {
      DNSOverHTTPS = {
        Enabled = true;
        ProviderURL = "https://dns.alidns.com/dns-query";
      };
    };

    profiles.extraConfig = ''
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          user_pref("full-screen-api.ignore-widgets", true);
          user_pref("media.ffmpeg.vaapi.enabled", true);
          user_pref("media.rdd-vpx.enabled", true);
    '';
  };
}
