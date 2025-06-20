{ config, pkgs, ... }:
let
  shellAliases = {
    dwm-edit = "$EDITOR $HOME/suckless/dwm/config.h";
    l = "lazygit";
    v = "nvim";
    y = "yazi";
    c = "clear";
    m = "man --pager=\"nvim +Man!\"";
    svim = "sudo vim -u $HOME/.vimrc";
    make = "make -j$(nproc)";
    duh = "du --human-readable";
    mkdir = "mkdir -p";
    dir = "dir --color=auto";
    vdir = "vdir --color=auto";
    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";
    ls = "ls -h --color=auto";
    ll = "ls -l --almost-all --sort=version --color=auto";
    la = "ls --almost-all --dereference-command-line --color=auto --format=single-column --human-readable --size --group-directories-first --sort=version";
    tree = "tree -C";
  };
in
{
  home.shell.enableFishIntegration = true;
  programs.fish = {
    enable = true;
    inherit shellAliases;
    shellInit = "set fish_greeting"; # Disable fish greeting message
    functions = {
      fish_prompt = {
        body = ''
          set -l last_status $status
          set -l normal (set_color normal)
          set -l status_color (set_color green)
          set -l cwd_color (set_color blue)
          set -l vcs_color (set_color purple)
          set -l prompt_status ""

          # Since we display the prompt on a new line allow the directory names to be longer.
          set -q fish_prompt_pwd_dir_length
          or set -lx fish_prompt_pwd_dir_length 0

          # Color the prompt differently when we're root
          set -l suffix '$'
          if functions -q fish_is_root_user; and fish_is_root_user
          if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
          end
          set suffix '#'
          end

          # Color the prompt in red on error
          if test $last_status -ne 0
          set status_color (set_color $fish_color_error)
          set prompt_status $status_color "[" $last_status "]" $normal
          end

          echo
          echo -s $cwd_color (prompt_pwd) $vcs_color (fish_vcs_prompt) $normal ' ' $prompt_status
          echo -n -s $status_color $suffix ' ' $normal
        '';
      };
      man = {
        body = ''
          # start of bold:
          set -x LESS_TERMCAP_mb (set_color --bold red)
          set -x LESS_TERMCAP_md (set_color --bold red)
          # end of all formatting:
          set -x LESS_TERMCAP_me (set_color normal)
          set -x LESS_TERMCAP_se (set_color normal)

          # end of standout (inverted colors):
          set -x LESS_TERMCAP_se (set_color normal)
          # start of standout (inverted colors):
          set -x LESS_TERMCAP_so (set_color --reverse)

          # start of underline:
          set -x LESS_TERMCAP_us (set_color --underline green)
          # end of underline:
          set -x LESS_TERMCAP_ue (set_color normal)
          # (no change – I like the default)

          command man $argv
        '';
      };
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    inherit shellAliases;
  };
}
