{
  modulesPath,
  lib,
  pkgs,
  ...
} @ args:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
  ];


  users.users.root.openssh.authorizedKeys.keys =
  [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOxue2KK9duORxcXOsvguCJ47NuT/lY6ZhSG+RroLa8isH+z+inXQfS/AGoUAPKQ2DSp4qNIMxcH4RoXTOZZFeYSqAnVcjbSQbq8aK5m0g2U41icOeGo/B5lSiSi2CWXEyombcA/1rU8coq0+XGhsemWpU0oaYIzH1ZvVMiRGc5uBhGUbP06jslWAmilyZc0zCRSBzKyLmUqKHibqrUBXvL4UN3MmJ10IZdjCoTXtUqc9KB52HDifEe3pnGlB4OkpscRmeAPs6mGi8qUDmL0DlKWjAIdZK0xTpd+dgHIMDg6iMJJUjE1lDZUM5zggj7g8RAN2sPQQS5gDM0SvOpY/N"
  ] ++ (args.extraPublicKeys or []);

  system.stateVersion = "24.05";
}
