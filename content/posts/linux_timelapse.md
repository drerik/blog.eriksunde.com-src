+++
Description = "Making timelaps with ffmpeg on linux"
Tags = ["Linux", "timelapse", "ffmpeg"]
Categories = ["Linux", "Photo"]
date = "2019-07-02T22:30:52+02:00"
menu = "posts"
title = "Making timelaps photos with ffmpeg on Linux"
+++
## Taking a picture with ffmpeg
Taking a picture with ffmpeg is relative easy. Her we take a picture with 1080p resolution from the webcam at the `/dev/video2` device.
```bash
ffmpeg -f video4linux2 -s 1920x1080 -i /dev/video2 -vframes 1 picture.jpg
```

## Taking pictures at intervals
While not perfect, you can make a timelapse with a webcam and ffmpeg to take photos at a set intervall. A `while true` loop with a sleep command to pause the loop between each image. 

```bash
#!/bin/bash
while true
do
	ffmpeg -f video4linux2 -s 1920x1080 -i /dev/video2 -vframes 1 timelapse-$(date +%Y-%m-%d-%H-%M-%S).jpg
	sleep 1
done

```

## Creating a video of a set of images
Ok, so now we have a set of images we want to stich togeter to a movie. Againg we use ffmpeg:
```bash
ffmpeg -framerate 5 -pattern_type glob -i 'timelapse-*.jpg' -c:v libx264 -r 30 -pix_fmt yuv420p out.mp4
```

You can adjust the speed of the move by adjusting the framerate ( here it set to 5 images per second).

## References
- http://ffmpeg.org/ffmpeg.html
- http://www.netinstructions.com/creating-automatic-timelapses-with-webcams-on-linux/