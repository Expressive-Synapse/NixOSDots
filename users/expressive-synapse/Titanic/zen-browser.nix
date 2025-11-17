{inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  home.persistence."/persist/home/expressive-synapse" = {
    directories = [
      ".zen"
    ];

  };

  programs.zen-browser = {
    enable = true;
    profiles = {
      "expressive-synapse" = {};
    };
  };
}
