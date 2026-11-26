{ ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };
}
