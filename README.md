Noizy
=====
Ambient sounds generator

### Dependencies:
mpv
tmux

### Running
- Run `./download.sh` to get files from noisli
- Run `./play-tmux.sh` [sounds] to open panels with sounds playing
- Alternatively run `./play.sh` [sounds] to just play the sounds without panel(tmux)

#### Example usage
`./play-tmux.sh thunderstorm bonfire`

Opens a panel with all sounds with `thunderstorm` and `bonfire` sounds playing

- Switch to any panel using tmux commands or clicking with mouse.
- Press `p` to toggle between play and pause (MPV shortcut)
- Press `*` and `/` to increase and decrease volume (MPV shortcut)

## Sounds
- rain
- thunderstorm
- wind
- forest
- bonfire
- coffeeshop
- seaside
- train
- leaves
- waterstream
- water
- summernight

## Screenshot
![screenshot](./screen.png?raw=true "Output after running ./play-tmux.sh")
