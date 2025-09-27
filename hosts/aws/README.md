# nixos-anywhere-examples

Checkout the [flake.nix](flake.nix) for examples tested on different hosters.


# FOR AWS Deployment

1. Enter the machine and get the disk with `lsblk`
 - Replace in disk-config.nix `device = lib.mkDefault "/dev/nvme0n1";`

2. Place you public key in the SSH root allowed keys in configuration.nix

3. Run the build command:

> nixos-anywhere --flake ".#generic" --generate-hardware-config nixos-generate-config ./hardware-configuration.nix -i ~/.ssh/nixos-cloud-desktop-key.pem ubuntu@IP
