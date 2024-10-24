final: prev:

let
  inherit (final) fetchFromGitHub;
  inherit (final.vimUtils) buildVimPlugin;
in
{
  vimPlugins = prev.vimPlugins // {
    conf-vim = buildVimPlugin {
      name = "conf-vim";
      src = fetchFromGitHub {
        owner = "tjdevries";
        repo = "conf.vim";
        rev = "master";
        sha256 = "AjiTJsoim0BAnyfqk1IQzNsa6jhFM2+A66E7q9sJqz0=";
      };
    };

    edit-alternate-vim = buildVimPlugin {
      name = "edit-alternate-vim";
      src = fetchFromGitHub {
        owner = "tjdevries";
        repo = "edit_alternate.vim";
        rev = "master";
        sha256 = "mEKnqYAhgrdxPRoKf4S4yYecdFIHGg8bDxpqPuC1+S4=";
      };
    };

    nvim-tmux-navigation = buildVimPlugin {
      name = "nvim-tmux-navigation";
      src = fetchFromGitHub {
        owner = "alexghergh";
        repo = "nvim-tmux-navigation";
        rev = "4898c98702954439233fdaf764c39636681e2861";
        sha256 = "sha256-CxAgQSbOrg/SsQXupwCv8cyZXIB7tkWO+Y6FDtoR8xk=";
      };
    };

    standard-vim = buildVimPlugin {
      name = "standard-vim";
      src = fetchFromGitHub {
        owner = "tjdevries";
        repo = "standard.vim";
        rev = "master";
        sha256 = "9VwkvV1Dv6cE4uDkPp36DozjWJOclDR883yDMYw000E=";
      };
    };

    vim-autoread = buildVimPlugin {
      name = "vim-autoread";
      src = fetchFromGitHub {
        owner = "djoshea";
        repo = "vim-autoread";
        rev = "24061f84652d768bfb85d222c88580b3af138dab";
        sha256 = "fSADjNt1V9jgAPjxggbh7Nogcxyisi18KaVve8j+c3w=";
      };
    };

    vim-textobj-indent = buildVimPlugin {
      name = "vim-textobj-indent";
      src = fetchFromGitHub {
        owner = "kana";
        repo = "vim-textobj-indent";
        rev = "deb76867c302f933c8f21753806cbf2d8461b548";
        sha256 = "oFzUPG+IOkbKZ2gU/kduQ3G/LsLDlEjFhRP0BHBE+1Q=";
      };
    };

    toggle-checkbox-nvim = buildVimPlugin {
      name = "toggle-checkbox-nvim";
      src = fetchFromGitHub {
        owner = "opdavies";
        repo = "toggle-checkbox.nvim";
        rev = "main";
        sha256 = "4YSEagQnLK5MBl2z53e6sOBlCDm220GYVlc6A+HNywg=";
      };
    };

    vim-heritage = buildVimPlugin {
      name = "vim-heritage";
      src = fetchFromGitHub {
        owner = "jessarcher";
        repo = "vim-heritage";
        rev = "cffa05c78c0991c998adc4504d761b3068547db6";
        sha256 = "Lebe5V1XFxn4kSZ+ImZ69Vst9Nbc0N7eA9IzOCijFS0=";
      };
    };

    vim-textobj-xmlattr = buildVimPlugin {
      name = "vim-textobj-xmlattr";
      src = fetchFromGitHub {
        owner = "whatyouhide";
        repo = "vim-textobj-xmlattr";
        rev = "694a297f1d75fd527e87da9769f3c6519a87ebb1";
        sha256 = "+91FVP95oh00flINdltqx6qJuijYo56tHIh3J098G2Q=";
      };
    };

    tabline-vim = buildVimPlugin {
      name = "tabline-vim";
      src = fetchFromGitHub {
        owner = "mkitt";
        repo = "tabline.vim";
        rev = "69c9698a3240860adaba93615f44778a9ab724b4";
        sha256 = "51b8PxyKqBdeIvmmZyF2hpMBjkyrlZDdTB1opr5JZ7Y=";
      };
    };

    vim-caser = buildVimPlugin {
      name = "vim-caser";
      src = fetchFromGitHub {
        owner = "arthurxavierx";
        repo = "vim-caser";
        rev = "6bc9f41d170711c58e0157d882a5fe8c30f34bf6";
        sha256 = "PXAY01O/cHvAdWx3V/pyWFeiV5qJGvLcAKhl5DQc0Ps=";
      };
    };

    vim-zoom = buildVimPlugin {
      name = "vim-zoom";
      src = fetchFromGitHub {
        owner = "dhruvasagar";
        repo = "vim-zoom";
        rev = "01c737005312c09e0449d6518decf8cedfee32c7";
        sha256 = "/ADzScsG0u6RJbEtfO23Gup2NYdhPkExqqOPVcQa7aQ=";
      };
    };

  };
}
