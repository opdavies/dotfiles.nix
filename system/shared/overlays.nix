self: super: {
  customVim = with self; {
    vim-astro = pkgs.vimUtils.buildVimPlugin {
      name = "vim-astro";
      src = pkgs.fetchFromGitHub {
        owner = "wuelnerdotexe";
        repo = "vim-astro";
        rev = "main";
        sha256 = "HyQ4i/T1uQmGurBqCpo8+ESVSVPsTrLQBxLe2OEYjcY=";
      };
    };

    vim-heritage = pkgs.vimUtils.buildVimPlugin {
      name = "vim-heritage";
      src = pkgs.fetchFromGitHub {
        owner = "jessarcher";
        repo = "vim-heritage";
        rev = "cffa05c78c0991c998adc4504d761b3068547db6";
        sha256 = "Lebe5V1XFxn4kSZ+ImZ69Vst9Nbc0N7eA9IzOCijFS0=";
      };
    };

    vim-just = pkgs.vimUtils.buildVimPlugin {
      name = "vim-just";
      src = pkgs.fetchFromGitHub {
        owner = "NoahTheDuke";
        repo = "vim-just";
        rev = "838c9096d4c5d64d1000a6442a358746324c2123";
        sha256 = "DSC47z2wOEXvo2kGO5JtmR3hyHPiYXrkX7MgtagV5h4=";
      };
    };

    vim-textobj-xmlattr = pkgs.vimUtils.buildVimPlugin {
      name = "vim-textobj-xmlattr";
      src = pkgs.fetchFromGitHub {
        owner = "whatyouhide";
        repo = "vim-textobj-xmlattr";
        rev = "694a297f1d75fd527e87da9769f3c6519a87ebb1";
        sha256 = "+91FVP95oh00flINdltqx6qJuijYo56tHIh3J098G2Q=";
      };
    };

    tabline-vim = pkgs.vimUtils.buildVimPlugin {
      name = "tabline-vim";
      src = pkgs.fetchFromGitHub {
        owner = "mkitt";
        repo = "tabline.vim";
        rev = "69c9698a3240860adaba93615f44778a9ab724b4";
        sha256 = "51b8PxyKqBdeIvmmZyF2hpMBjkyrlZDdTB1opr5JZ7Y=";
      };
    };

    vim-caser = pkgs.vimUtils.buildVimPlugin {
      name = "vim-caser";
      src = pkgs.fetchFromGitHub {
        owner = "arthurxavierx";
        repo = "vim-caser";
        rev = "master";
        sha256 = "PXAY01O/cHvAdWx3V/pyWFeiV5qJGvLcAKhl5DQc0Ps=";
      };
    };

    vim-visual-star-search = pkgs.vimUtils.buildVimPlugin {
      name = "vim-visual-star-search";
      src = pkgs.fetchFromGitHub {
        owner = "nelstrom";
        repo = "vim-visual-star-search";
        rev = "37259722f45996733fd309add61385a4ad88bdb9";
        sha256 = "n8jd6fy30XukZ9NFZX5qclSlMfziP/Ew9dXfkysRl4Y=";
      };
    };
  };
}
