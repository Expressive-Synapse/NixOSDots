{ pkgs, ... }:

{
environment.systemPackages = with pkgs; [
 jdk8
];
}
