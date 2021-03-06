// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 14,

    // font family with optional fallbacks
    fontFamily: '"Hack Nerd Font", "Menlo for Powerline", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // default font weight: 'normal' or 'bold'
    fontWeight: 'normal',

    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: 'bold',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgb(215,208,199)',

    // terminal text color under BLOCK cursor
    cursorAccentColor: 'rgb(21,21,21)',

    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BLOCK',

    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: false,

    // color of the text
    foregroundColor: 'rgb(215,208,199)',

    // terminal background color
    // opacity is only supported on macOS
    backgroundColor: 'rgb(21,21,21)',

    //hyper-opacity
    opacity: 0.85,

    // terminal selection color
    selectionColor: 'rgb(250,250,250)',

    // border color (window, tabs)
    borderColor: '#333',

    // custom CSS to embed in the main window
    css: `
      .terms_terms {
      margin-top: 20px;
      }
    `,

    // custom CSS to embed in the terminal window
    termCSS: '',

    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: '',

    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: '',

    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: 'rgb(16,16,16)',
      boldBlack: 'rgb(64,64,64)',
      lightBlack: '#686868',

      red: 'rgb(232,79,79)',
      boldRed: 'rgb(210,61,61)',
      lightRed: '#FD6F6B',

      green: 'rgb(184,214,140)',
      boldGreen: 'rgb(160,207,93)',
      lightGreen: '#67F86F',

      yellow: 'rgb(225,170,93)',
      boldYellow: 'rgb(243,157,33)',
      lightYellow: '#FFFA72',

      blue: 'rgb(125,193,207)',
      boldBlue: 'rgb(78,159,177)',
      lightBlue: '#6A76FB',

      magenta: 'rgb(155,100,251)',
      boldMagenta: 'rgb(133,66,255)',
      lightMagenta: '#FD7CFC',

      cyan: 'rgb(109,135,141)',
      boldCyan: 'rgb(66,113,123)',
      lightCyan: '#68FDFE',

      white: 'rgb(221,221,221)',
      boldWhite: 'rgb(221,221,221)',
      lightWhite: '#FFFFFF',
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to `false` for no bell
    bell: 'SOUND',

    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,

    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    // quickEdit: true,

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // https://github.com/zeit/hyper/issues/3699
    webGLRenderer: false

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: ["hyper-snazzy", "hyper-opacity"],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },
};
