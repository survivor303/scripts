# scripts
Scripts

Here is all my scripts and config files what i use on my linux and powershell boxes:

# scaling.sh:
This is very simple script for my second screen, on my X99 desktop.
First it scale the screen with 1.5 @ 1920x1080
The scaling works with kde plasma 5, but the desktop and it's menubars dosent refresh for the new scaling setting.
So then the script just change the screen resolution to second largest one, and then back to 1920x1080.
That fast resolution jumping, fix the plasma 5 refresh issues.

# muunnos.ps1
This Powershell script allows changing the codec of video files from any MP4 codec to HEVC (h.264 to h.265), using ffmpeg, exiftool, and an NVIDIA graphics card. The script prompts or ask the file to be converted and the desired bitrate, while keeping all other information same as the original video file. Exiftool is also used to adjust new video file’s physical timestamp data to match the original.”
