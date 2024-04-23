{ pkgs, config, inputs, ... }:

{
programs.nix-ld.enable = true;
## If needed, you can add missing libraries here. nix-index-database is your friend to
## find the name of the package from the error message:
## https://github.com/nix-community/nix-index-database
programs.nix-ld.libraries = with pkgs; [
   stdenv.cc.cc
    zlib
    fuse3
    icu
    zlib
    nss
    openssl
    curl
    glib 
    nss 
    nspr 
    at-spi2-atk 
    cups 
    dbus 
    libdrm 
    gtk3 
    gnome2.pango 
    xorg.libX11 
    xorg.libXcomposite 
    xorg.libXdamage 
    xorg.libXext 
    xorg.libXfixes 
    xorg.libXrandr 
    mesa 
    expat 
    xorg.libxcb 
    libxkbcommon 
    alsa-lib 
    cairo 
];
}
