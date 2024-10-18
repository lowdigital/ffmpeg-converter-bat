@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: trim the beginning
set "trim_time_start=0.01"

:: trim the end
set "trim_time_end=0.01"

if "%~1"=="" (
    echo Usage: Drag and drop a video file onto this batch file or provide the path to the file as an argument.
    pause
    exit /b 1
)
set "ffmpeg_path=%~dp0ffmpeg.exe"
set "ffprobe_path=%~dp0ffprobe.exe"
set "input_file=%~1"
set "input_dir=%~dp1"
for %%F in ("%input_file%") do set "file_name=%%~nF"
for %%F in ("%input_file%") do set "file_extension=%%~xF"
set "output_file=%input_dir%%file_name%_fixed%file_extension%"
"%ffprobe_path%" -v quiet -select_streams v:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1:nokey=1 "%input_file%" > temp_bitrate.txt
set /p original_bitrate=<temp_bitrate.txt
del temp_bitrate.txt
if "%original_bitrate%"=="" (
    echo Error: Failed to extract bitrate of source video.
    pause
    exit /b 1
)
echo Original bitrate: %original_bitrate%
echo Trimming video from %trim_time_start% to %trim_time_end% seconds.
"%ffmpeg_path%" -i "%input_file%" -ss %trim_time_start% -to %trim_time_end% -c:v h264_nvenc -b:v %original_bitrate% -g 30 -c:a aac -b:a 128k -movflags +faststart "%output_file%"
del "%input_file%"
echo Done! The video is processed and saved as "%output_file%".
pause