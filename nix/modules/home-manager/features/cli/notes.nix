{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [ notes ];

    sessionVariables = {
      NOTES_DIRECTORY = "$WIKI_DIRECTORY/notes";
      WIKI_DIRECTORY = "$DOCUMENTS/wiki";
    };
  };

}
