# static-ffmpeg-gplv3
Static build of FFmpeg with GPLv3

## Usage

### Run it now
```sh
# Built with alpine stable
docker run ghcr.io/ffbuilds/static-ffmpeg-gplv3-alpine_3.16.2:main -version

# Built with alpine edge
docker run ghcr.io/ffbuilds/static-ffmpeg-gplv3-alpine_edge:main -version
```

### Copy to your image
```Dockerfile
# syntax=docker/dockerfile:1

# Select from the Support Matrix
ARG ALPINE_VERSION=3.16.2

FROM ghcr.io/ffbuilds/static-ffmpeg-gplv3-alpine_${ALPINE_VERSION}:main AS ffmpeg

FROM alpine:${ALPINE_VERSION} AS myimage
COPY --from=ffmpeg /ff* /usr/local/bin/
RUN ffmpeg -version
```

## Support Matrix

| Library | alpine:edge amd64 | alpine:edge arm64 | alpine:edge arm/v7 | alpine:edge arm/v6 | alpine:3.16.2 amd64 | alpine:3.16.2 arm64 | alpine:3.16.2 arm/v7 | alpine:3.16.2 arm/v6 | Comments |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| ffmpeg          | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libaom          | ✅ | ✅ | ⛔️ | ⛔️ | ✅ | ✅ | ⛔️ | ⛔️ | |
| libaribb24      | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libass          | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libbluray       | ⚠️ | ⚠️ | ⚠️ | ⚠️ | ✅ | ✅ | ✅ | ✅ | Built without freetype on edge |
| libbrotli       | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libdav1d        | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libdavs2        | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libgme          | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libgsm          | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libkvazaar      | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libmodplug      | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libmp3lame      | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libmysofa       | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libogg          | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libopencore-amr | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libopenjpeg     | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libopus         | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| librav1e        | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| librubberband   | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libsamplerate   | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libshine        | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libspeex        | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libsvtav1       | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libtheora       | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libtwolame      | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libuavs3d       | ✅ | ✅ | ⛔️ | ⛔️ | ✅ | ✅ | ⛔️ | ⛔️ | |
| libvidstab      | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libvmaf         | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libvorbis       | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libvpx          | ✅ | ✅ | ⛔️ | ⛔️ | ✅ | ✅ | ⛔️ | ⛔️ | |
| libwebp         | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libx264         | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libx265         | ✅ | ✅ | ⛔️ | ⛔️ | ✅ | ✅ | ⛔️ | ⛔️ | |
| libxavs2        | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libxml2         | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libxvid         | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |
| libzimg         | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | |

## Contributors
- [@wader](https://github.com/wader) - orignal author of [wader/static-ffmpeg](https://github.com/wader/static-ffmpeg)
- [@binoculars](https://github.com/binoculars)
