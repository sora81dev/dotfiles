{ }:
{
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "sora81dev";
        email = "117363029+sora81dev@users.noreply.github.com";
      };

      credential.helper = "!gh auth git-credential";
    };
  };

}
