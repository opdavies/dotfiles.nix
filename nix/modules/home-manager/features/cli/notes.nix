{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [ notes ];

    sessionVariables = {
      NOTES_DIRECTORY = "$DOCUMENTS/wiki/notes";
      WIKI_DIRECTORY = "$DOCUMENTS/wiki";
    };
  };

}
