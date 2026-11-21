{ ... }:
let
  browser = "zen.desktop";
  mail = "thunderbird.desktop";
  fileManager = "com.system76.CosmicFiles.desktop";
in
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # File manager
      "inode/directory" = fileManager;

      # Browser
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "x-scheme-handler/chrome" = browser;
      "text/html" = browser;
      "application/x-extension-htm" = browser;
      "application/x-extension-html" = browser;
      "application/x-extension-shtml" = browser;
      "application/xhtml+xml" = browser;
      "application/x-extension-xhtml" = browser;
      "application/x-extension-xht" = browser;

      # Mail
      "x-scheme-handler/mailto" = mail;
      "x-scheme-handler/mid" = mail;
      "x-scheme-handler/net.thunderbird" = mail;
      "message/rfc822" = mail;

      # URL handlers registered by apps (desktop files in ~/.local/share/applications)
      "x-scheme-handler/jetbrains" = "jetbrainsd.desktop";
      "x-scheme-handler/claude-cli" = "claude-code-url-handler.desktop";
      "x-scheme-handler/discord-1216669957799018608" = "discord-1216669957799018608.desktop";
    };
  };
}
