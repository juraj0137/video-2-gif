# Video 2 gif
Works on Fedora 21 and later.

## Installation

Clone this repo. `git clone https://github.com/juraj0137/video-2-gif.git video-2-gif`

Go to cloned folder `cd video-2-gif`

Remove git folder, it is not necessary here `rm -rf .git`

Make `install.sh` executable `sudo chmod +x ./install.sh`

Install dependecies `./install.sh`

## Usage
`./gifMaker.sh [options]`

### Options
#### -h | --help
show help

#### -i | --input 
Path to source video file which you want to convert to gif

#### -w | --width [optional] 
Width of converted gif, default value is 300

#### -f | --fps [optional]
Fps of converted git, default values is 10

## Example of usage
`./gifMaker.sh -i ./videos/video1.mp4` makes `video1.gif` in `./videos` folder.
