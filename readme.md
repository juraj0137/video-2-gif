# Video 2 gif

## Installation

Clone this repo. <br>
`git clone https://github.com/juraj0137/video-2-gif.git video-2-gif`

Go to cloned folder<br>
`cd video-2-gif`

Remove git folder, it is not necessary here<br>
`rm -rf .git`

Make `install.sh` executable <br>
`sudo chmod +x ./install.sh`

Install dependecies<br>
`./install.sh`

## Usage
`./gifMaker.sh [options]`

### Options
1. `-h | --help` <br> show help
2. `-i | --input` <br> Path to source video file which you want to convert to gif
3. `-w | --width [optional]`<br>Width of converted gif, default value is 300
4. `-f | --fps [optional]`<br>Fps of converted git, default values is 10

## Example of usage
`./gifMaker.sh -i ./videos/video1.mp4` makes `video1.gif` in `./videos` folder.
