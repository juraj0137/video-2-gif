#!/bin/bash

#function createGif {

SRC_VIDEO=""
FPS=10
TMP_OUTPUT_PATH="/tmp/gif-maker/frames"
WIDTH=300


function display_help {
cat <<EOF
    Usage: $0 [options]

    -h | --help    show help

    -i | --input   Path to source video file which you want to convert to gif
    -w | --width   Width of converted gif, default value is 300
    -f | --fps     Fps of converted git, default values is 10
EOF
}

while :
do
    case "$1" in
      -i | --input)
	  SRC_VIDEO="$2"   # You may want to check validity of $2
	  shift 2
	  ;;

	  -w | --width)
	  WIDTH="$2"   # You may want to check validity of $2
	  shift 2
	  ;;

	  -f | --fps)
	  FPS="$2"   # You may want to check validity of $2
	  shift 2
	  ;;

      -h | --help)
	  display_help  # Call your function
	  exit 0
	  ;;

      --) # End of all options
	  shift
	  break
	  ;;

      -*)
	  echo "Error: Unknown option: $1" >&2
	  exit 1
	  ;;

      *)  # No more options
	  break
	  ;;
    esac
done

if [ ! -f "$SRC_VIDEO" ]; then
    echo "Source video do not exist, use -i|--input to define it"
    exit 0;
fi

OUTPUT_DIR=$(dirname "$SRC_VIDEO");
BASENAME=$(basename "$SRC_VIDEO");

#make dir
rm -rf $TMP_OUTPUT_PATH
mkdir -p $TMP_OUTPUT_PATH

#cut videos to images
echo "Cutting video"
ffmpeg -i $SRC_VIDEO -r $FPS $TMP_OUTPUT_PATH/image-%10d.png >/dev/null 2>&1

#resize
echo "Resizing images"
mogrify -resize $WIDTH $TMP_OUTPUT_PATH/*.png

#make gif
echo "Making gif"
convert -delay $((100/FPS)) -dither none -colors 32 -layers optimize -loop 0 $TMP_OUTPUT_PATH/*.png $OUTPUT_DIR/$BASENAME.gif

#remove temp files
echo "Remove temp files"
rm -rf $TMP_OUTPUT_PATH
