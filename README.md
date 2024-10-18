
# FFmpeg Converter Batch Script

This is a simple batch script that uses FFmpeg to process video files by trimming the beginning and end, while maintaining the original video bitrate. It allows for quick and efficient processing of video files by simply dragging and dropping a video onto the batch file or providing a file path as an argument.

## Features

- Trims video files from a specified start time and end time.
- Maintains the original video bitrate.
- Utilizes GPU acceleration (NVIDIA NVENC) for video encoding (H.264).
- Automatically deletes the original video file after processing.
- Outputs the processed video with `_fixed` appended to the filename.

## Requirements

- [FFmpeg](https://ffmpeg.org/) with NVENC support (included in the same directory as the batch script).
- Windows operating system.

## Usage

### Drag and Drop

1. Drag and drop a video file onto the batch file (`ffmpeg-converter.bat`).
2. The script will automatically trim the video and save the processed version in the same directory.

### Command Line

Alternatively, you can run the batch file from the command line and provide the path to the video as an argument:

```bash
converter.bat "path\to\video.mp4"
```

## Configuration

The script has two main configuration parameters that control the trimming:

- `trim_time_start` – the time (in seconds) to start trimming the video. Default is `3.17` seconds.
- `trim_time_end` – the time (in seconds) to end the trimming. Default is `60` seconds.

You can adjust these values directly in the script:

```batch
set "trim_time_start=20.06"  :: Start trimming after 20.06 seconds
set "trim_time_end=60.00"      :: Stop trimming at 60 seconds
```

## Installation

1. Download the repository or clone it:

   ```bash
   git clone https://github.com/lowdigital/ffmpeg-converter-bat.git
   ```

2. Place the `ffmpeg.exe` and `ffprobe.exe` executables in the same directory as `ffmpeg-converter.bat`. You can download them from the official [FFmpeg website](https://ffmpeg.org/download.html).

3. The script is now ready to use!

## Acknowledgments

- [FFmpeg](https://ffmpeg.org/) – a complete, cross-platform solution to record, convert, and stream audio and video.


## Authors

- Project Author: [low digital](https://t.me/low_digital)

## License

This project is licensed under the MIT License