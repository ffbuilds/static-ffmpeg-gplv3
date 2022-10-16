
# bump: ffmpeg /FFMPEG_VERSION=([\d.]+)/ https://github.com/FFmpeg/FFmpeg.git|^5
# bump: ffmpeg after ./hashupdate Dockerfile FFMPEG $LATEST
# bump: ffmpeg link "Changelog" https://github.com/FFmpeg/FFmpeg/blob/n$LATEST/Changelog
# bump: ffmpeg link "Source diff $CURRENT..$LATEST" https://github.com/FFmpeg/FFmpeg/compare/n$CURRENT..n$LATEST
ARG FFMPEG_VERSION=5.1.2
ARG FFMPEG_URL="https://ffmpeg.org/releases/ffmpeg-$FFMPEG_VERSION.tar.bz2"
ARG FFMPEG_SHA256=39a0bcc8d98549f16c570624678246a6ac736c066cebdb409f9502e915b22f2b

# bump: alpine /FROM alpine:([\d.]+)/ docker:alpine|^3
# bump: alpine link "Release notes" https://alpinelinux.org/posts/Alpine-$LATEST-released.html
FROM alpine:3.16.2 AS base

FROM ghcr.io/ffbuilds/static-libaom:main AS libaom
FROM ghcr.io/ffbuilds/static-libaribb24:main AS libaribb24
FROM ghcr.io/ffbuilds/static-libass:main AS libass
FROM ghcr.io/ffbuilds/static-libbluray:main AS libbluray
FROM ghcr.io/ffbuilds/static-libdav1d:main AS libdav1d
FROM ghcr.io/ffbuilds/static-libdavs2:main AS libdavs2
FROM ghcr.io/ffbuilds/static-libgme:main AS libgme
FROM ghcr.io/ffbuilds/static-libgsm:main AS libgsm
FROM ghcr.io/ffbuilds/static-libkvazaar:main AS libkvazaar
FROM ghcr.io/ffbuilds/static-libmodplug:main AS libmodplug
FROM ghcr.io/ffbuilds/static-libmp3lame:main AS libmp3lame
FROM ghcr.io/ffbuilds/static-libmysofa:main AS libmysofa
FROM ghcr.io/ffbuilds/static-libogg:main AS libogg
FROM ghcr.io/ffbuilds/static-libopencore-amr:main AS libopencore-amr
FROM ghcr.io/ffbuilds/static-libopenjpeg:main AS libopenjpeg
FROM ghcr.io/ffbuilds/static-libopus:main AS libopus
FROM ghcr.io/ffbuilds/static-librav1e:main AS librav1e
FROM ghcr.io/ffbuilds/static-librubberband:main AS librubberband
FROM ghcr.io/ffbuilds/static-libshine:main AS libshine
FROM ghcr.io/ffbuilds/static-libspeex:main AS libspeex
FROM ghcr.io/ffbuilds/static-libsvtav1:main AS libsvtav1
FROM ghcr.io/ffbuilds/static-libtheora:main AS libtheora
FROM ghcr.io/ffbuilds/static-libtwolame:main AS libtwolame
FROM ghcr.io/ffbuilds/static-libuavs3d:main AS libuavs3d
FROM ghcr.io/ffbuilds/static-libvidstab:main AS libvidstab
FROM ghcr.io/ffbuilds/static-libvmaf:main AS libvmaf
FROM ghcr.io/ffbuilds/static-libvorbis:main AS libvorbis
FROM ghcr.io/ffbuilds/static-libvpx:main AS libvpx
FROM ghcr.io/ffbuilds/static-libwebp:main AS libwebp
FROM ghcr.io/ffbuilds/static-libx264:main AS libx264
FROM ghcr.io/ffbuilds/static-libx265:main AS libx265
FROM ghcr.io/ffbuilds/static-libxavs2:main AS libxavs2
FROM ghcr.io/ffbuilds/static-libxvid:main AS libxvid
FROM ghcr.io/ffbuilds/static-libzimg:main AS libzimg

FROM base AS download
ARG FFMPEG_URL
ARG FFMPEG_SHA256
ARG WGET_OPTS="--retry-on-host-error --retry-on-http-error=429,500,502,503 -nv"
WORKDIR /tmp
RUN \
  apk add --no-cache --virtual download \
    coreutils wget tar && \
  wget $WGET_OPTS -O ffmpeg.tar.bz2 "$FFMPEG_URL" && \
  echo "$FFMPEG_SHA256  ffmpeg.tar.bz2" | sha256sum --status -c - && \
  mkdir ffmpeg && \
  tar xf ffmpeg.tar.bz2 -C ffmpeg --strip-components=1 && \
  rm ffmpeg.tar.bz2 && \
  apk del download

FROM base AS build
COPY --from=libvmaf /usr/local/lib/pkgconfig/libvmaf.pc /usr/local/lib/pkgconfig/libvmaf.pc
COPY --from=libvmaf /usr/local/lib/libvmaf.a /usr/local/lib/libvmaf.a
COPY --from=libvmaf /usr/local/include/libvmaf/ /usr/local/include/libvmaf/
COPY --from=libaom /usr/local/lib/pkgconfig/aom.pc /usr/local/lib/pkgconfig/aom.pc
COPY --from=libaom /usr/local/lib/libaom.a /usr/local/lib/libaom.a
COPY --from=libaom /usr/local/include/aom/ /usr/local/include/aom/
COPY --from=libaribb24 /usr/local/lib/pkgconfig/aribb24.pc /usr/local/lib/pkgconfig/aribb24.pc
COPY --from=libaribb24 /usr/local/lib/libaribb24.a /usr/local/lib/libaribb24.a
COPY --from=libaribb24 /usr/local/include/aribb24/ /usr/local/include/aribb24/
COPY --from=libass /usr/local/lib/pkgconfig/libass.pc /usr/local/lib/pkgconfig/libass.pc
COPY --from=libass /usr/local/lib/libass.a /usr/local/lib/libass.a
COPY --from=libass /usr/local/include/ass/ /usr/local/include/ass/
COPY --from=libbluray /usr/local/lib/pkgconfig/libbluray.pc /usr/local/lib/pkgconfig/libbluray.pc
COPY --from=libbluray /usr/local/lib/libbluray.a /usr/local/lib/libbluray.a
COPY --from=libbluray /usr/local/include/libbluray/ /usr/local/include/libbluray/
COPY --from=libdav1d /usr/local/lib/pkgconfig/dav1d.pc /usr/local/lib/pkgconfig/dav1d.pc
COPY --from=libdav1d /usr/local/lib/libdav1d.a /usr/local/lib/libdav1d.a
COPY --from=libdav1d /usr/local/include/dav1d/ /usr/local/include/dav1d/
COPY --from=libdavs2 /usr/local/lib/pkgconfig/davs2.pc /usr/local/lib/pkgconfig/davs2.pc
COPY --from=libdavs2 /usr/local/lib/libdavs2.a /usr/local/lib/libdavs2.a
COPY --from=libdavs2 /usr/local/include/davs2* /usr/local/include/
COPY --from=libgme /usr/local/lib/pkgconfig/libgme.pc /usr/local/lib/pkgconfig/libgme.pc
COPY --from=libgme /usr/local/lib/libgme.a /usr/local/lib/libgme.a
COPY --from=libgme /usr/local/include/gme/ /usr/local/include/gme/
COPY --from=libgsm /usr/local/lib/libgsm.a /usr/local/lib/libgsm.a
COPY --from=libgsm /usr/local/include/gsm/ /usr/local/include/gsm/
COPY --from=libkvazaar /usr/local/lib/pkgconfig/kvazaar.pc /usr/local/lib/pkgconfig/kvazaar.pc
COPY --from=libkvazaar /usr/local/lib/libkvazaar.a /usr/local/lib/libkvazaar.a
COPY --from=libkvazaar /usr/local/include/kvazaar.h /usr/local/include/kvazaar.h
COPY --from=libmodplug /usr/local/lib/pkgconfig/libmodplug.pc /usr/local/lib/pkgconfig/libmodplug.pc
COPY --from=libmodplug /usr/local/lib/libmodplug.a /usr/local/lib/libmodplug.a
COPY --from=libmodplug /usr/local/include/libmodplug/ /usr/local/include/libmodplug/
COPY --from=libmp3lame /usr/local/lib/libmp3lame.a /usr/local/lib/libmp3lame.a
COPY --from=libmp3lame /usr/local/include/lame/ /usr/local/include/lame/
COPY --from=libmysofa /usr/local/lib/pkgconfig/libmysofa.pc /usr/local/lib/pkgconfig/libmysofa.pc
COPY --from=libmysofa /usr/local/lib/libmysofa.a /usr/local/lib/libmysofa.a
COPY --from=libmysofa /usr/local/include/mysofa.h /usr/local/include/mysofa.h
COPY --from=libopencore-amr /usr/local/lib/libopencore-amr* /usr/local/lib/
COPY --from=libopencore-amr /usr/local/lib/pkgconfig/opencore-amr* /usr/local/lib/pkgconfig/
COPY --from=libopencore-amr /usr/local/include/opencore-amrnb/ /usr/local/include/opencore-amrnb/
COPY --from=libopencore-amr /usr/local/include/opencore-amrwb/ /usr/local/include/opencore-amrwb/
COPY --from=libopenjpeg /usr/local/lib/pkgconfig/libopenjp2.pc /usr/local/lib/pkgconfig/libopenjp2.pc
COPY --from=libopenjpeg /usr/local/lib/libopenjp2.a /usr/local/lib/libopenjp2.a
COPY --from=libopenjpeg /usr/local/include/openjpeg-2.5/ /usr/local/include/openjpeg-2.5/
COPY --from=libopus /usr/local/lib/pkgconfig/opus.pc /usr/local/lib/pkgconfig/opus.pc
COPY --from=libopus /usr/local/lib/libopus.a /usr/local/lib/libopus.a
COPY --from=libopus /usr/local/include/opus/ /usr/local/include/opus/
COPY --from=librav1e /usr/local/lib/pkgconfig/rav1e.pc /usr/local/lib/pkgconfig/rav1e.pc
COPY --from=librav1e /usr/local/lib/librav1e.a /usr/local/lib/librav1e.a
COPY --from=librav1e /usr/local/include/rav1e/ /usr/local/include/rav1e/
COPY --from=librubberband /usr/local/lib/pkgconfig/rubberband.pc /usr/local/lib/pkgconfig/rubberband.pc
COPY --from=librubberband /usr/local/lib/librubberband.a /usr/local/lib/librubberband.a
COPY --from=librubberband /usr/local/include/rubberband/ /usr/local/include/rubberband/
COPY --from=libshine /usr/local/lib/pkgconfig/shine.pc /usr/local/lib/pkgconfig/shine.pc
COPY --from=libshine /usr/local/lib/libshine.a /usr/local/lib/libshine.a
COPY --from=libshine /usr/local/include/shine/ /usr/local/include/shine/
COPY --from=libspeex /usr/local/lib/pkgconfig/speex.pc /usr/local/lib/pkgconfig/speex.pc
COPY --from=libspeex /usr/local/lib/libspeex.a /usr/local/lib/libspeex.a
COPY --from=libspeex /usr/local/include/speex/ /usr/local/include/speex/
COPY --from=libsvtav1 /usr/local/lib/pkgconfig/SvtAv1*.pc /usr/local/lib/pkgconfig/
COPY --from=libsvtav1 /usr/local/lib/libSvtAv1*.a /usr/local/lib/
COPY --from=libsvtav1 /usr/local/include/svt-av1/ /usr/local/include/svt-av1/
COPY --from=libogg /usr/local/lib/pkgconfig/ogg.pc /usr/local/lib/pkgconfig/ogg.pc
COPY --from=libogg /usr/local/lib/libogg.a /usr/local/lib/libogg.a
COPY --from=libogg /usr/local/include/ogg/ /usr/local/include/ogg/
COPY --from=libtheora /usr/local/lib/pkgconfig/theora*.pc /usr/local/lib/pkgconfig/
COPY --from=libtheora /usr/local/lib/libtheora*.a /usr/local/lib/
COPY --from=libtheora /usr/local/include/theora/ /usr/local/include/theora/
COPY --from=libtwolame /usr/local/lib/pkgconfig/twolame.pc /usr/local/lib/pkgconfig/twolame.pc
COPY --from=libtwolame /usr/local/lib/libtwolame.a /usr/local/lib/libtwolame.a
COPY --from=libtwolame /usr/local/include/twolame.h /usr/local/include/twolame.h
COPY --from=libuavs3d /usr/local/lib/pkgconfig/uavs3d.pc /usr/local/lib/pkgconfig/uavs3d.pc
COPY --from=libuavs3d /usr/local/lib/libuavs3d.a /usr/local/lib/libuavs3d.a
COPY --from=libuavs3d /usr/local/include/uavs3d.h /usr/local/include/uavs3d.h
COPY --from=libvidstab /usr/local/lib/pkgconfig/vidstab.pc /usr/local/lib/pkgconfig/vidstab.pc
COPY --from=libvidstab /usr/local/lib/libvidstab.a /usr/local/lib/libvidstab.a
COPY --from=libvidstab /usr/local/include/vid.stab/ /usr/local/include/vid.stab/
COPY --from=libvorbis /usr/local/lib/pkgconfig/vorbis*.pc /usr/local/lib/pkgconfig/
COPY --from=libvorbis /usr/local/lib/libvorbis*.a /usr/local/lib/
COPY --from=libvorbis /usr/local/include/vorbis/ /usr/local/include/vorbis/
COPY --from=libvpx /usr/local/lib/pkgconfig/vpx.pc /usr/local/lib/pkgconfig/vpx.pc
COPY --from=libvpx /usr/local/lib/libvpx.a /usr/local/lib/libvpx.a
COPY --from=libvpx /usr/local/include/vpx/ /usr/local/include/vpx/
COPY --from=libwebp /usr/local/lib/pkgconfig/libwebp*.pc /usr/local/lib/pkgconfig/
COPY --from=libwebp /usr/local/lib/libwebp*.a /usr/local/lib/
COPY --from=libwebp /usr/local/include/webp/ /usr/local/include/webp/
COPY --from=libx264 /usr/local/lib/pkgconfig/x264.pc /usr/local/lib/pkgconfig/x264.pc
COPY --from=libx264 /usr/local/lib/libx264.a /usr/local/lib/libx264.a
COPY --from=libx264 /usr/local/include/x264*.h /usr/local/include/
COPY --from=libx265 /usr/local/lib/pkgconfig/x265.pc /usr/local/lib/pkgconfig/x265.pc
COPY --from=libx265 /usr/local/lib/libx265.a /usr/local/lib/libx265.a
COPY --from=libx265 /usr/local/include/x265*.h /usr/local/include/
COPY --from=libxavs2 /usr/local/lib/pkgconfig/xavs2.pc /usr/local/lib/pkgconfig/xavs2.pc
COPY --from=libxavs2 /usr/local/lib/libxavs2.a /usr/local/lib/libxavs2.a
COPY --from=libxavs2 /usr/local/include/xavs2*.h /usr/local/include/
COPY --from=libxvid /usr/local/lib/libxvidcore.* /usr/local/lib/
COPY --from=libxvid /usr/local/include/xvid.h /usr/local/include/xvid.h
COPY --from=libzimg /usr/local/lib/pkgconfig/zimg.pc /usr/local/lib/pkgconfig/zimg.pc
COPY --from=libzimg /usr/local/lib/libzimg.a /usr/local/lib/libzimg.a
COPY --from=libzimg /usr/local/include/zimg* /usr/local/include/
COPY --from=download /tmp/ffmpeg/ /tmp/ffmpeg/
ARG TARGETPLATFORM
WORKDIR /tmp/ffmpeg
RUN \
  case ${TARGETPLATFORM} in \
    linux/arm/v*) \
      config_opts="--extra-ldexeflags=-static" \
    ;; \
    *) \
      config_opts=" \
        --enable-libaom \
        --enable-libuavs3d \
        --enable-libvpx \
        --enable-libx265 \
      " \
    ;; \
  esac && \
  apk add --no-cache --virtual build \
    build-base nasm yasm pkgconf \
    zlib-dev zlib-static \
    bzip2-dev bzip2-static \
    libxml2-dev \
    expat-dev expat-static \
    graphite2-static \
    glib-static \
    tiff tiff-dev \
    libjpeg-turbo libjpeg-turbo-dev \
    libpng-dev libpng-static \
    giflib giflib-dev \
    brotli-dev brotli-static \
    soxr-dev soxr-static \
    tcl \
    numactl-dev \
    cunit cunit-dev \
    fftw-dev \
    libsamplerate-dev \
    freetype-dev freetype-static \
    fribidi-dev fribidi-static \
    harfbuzz-dev harfbuzz-static \
    fontconfig-dev fontconfig-static \
    vo-amrwbenc-dev vo-amrwbenc-static \
    snappy-dev snappy-static && \
  # sed changes --toolchain=hardened -pie to -static-pie
  # extra ldflags stack-size=2097152 is to increase default stack size from 128KB (musl default) to something
  # more similar to glibc (2MB). This fixing segfault with libaom-av1 and libsvtav1 as they seems to pass
  # large things on the stack.
  sed -i 's/add_ldexeflags -fPIE -pie/add_ldexeflags -fPIE -static-pie/' configure && \
  ./configure \
  ${config_opts} \
  --pkg-config-flags="--static" \
  --extra-cflags="-fopenmp" \
  --extra-ldflags="-fopenmp -Wl,-z,stack-size=2097152" \
  --toolchain=hardened \
  --disable-debug \
  --disable-doc \
  --disable-shared \
  --disable-ffplay \
  --enable-static \
  --enable-small \
  --disable-runtime-cpudetect \
  --enable-gpl \
  --enable-version3 \
  --enable-fontconfig \
  --enable-gray \
  --enable-iconv \
  --enable-libaribb24 \
  --enable-libass \
  --enable-libbluray \
  --enable-libdav1d \
  --enable-libdavs2 \
  --enable-libfreetype \
  --enable-libfribidi \
  --enable-libgme \
  --enable-libgsm \
  --enable-libkvazaar \
  --enable-libmodplug \
  --enable-libmp3lame \
  --enable-libmysofa \
  --enable-libopencore-amrnb \
  --enable-libopencore-amrwb \
  --enable-libopenjpeg \
  --enable-libopus \
  --enable-librav1e \
  --enable-librubberband \
  --enable-libshine \
  --enable-libsnappy \
  --enable-libsoxr \
  --enable-libspeex \
  --enable-libsvtav1 \
  --enable-libtheora \
  --enable-libtwolame \
  --enable-libvidstab \
  --enable-libvmaf \
  --enable-libvo-amrwbenc \
  --enable-libvorbis \
  --enable-libwebp \
  --enable-libx264 \
  --enable-libxavs2 \
  --enable-libxml2 \
  --enable-libxvid \
  --enable-libzimg \
  || (cat ffbuild/config.log ; false) \
  && make -j$(nproc) install && \
  apk del build

FROM scratch AS final
COPY --from=build /usr/local/bin/ffmpeg /usr/local/bin/ffprobe /
# sanity tests
RUN ["/ffmpeg", "-version"]
RUN ["/ffprobe", "-version"]
RUN ["/ffmpeg", "-hide_banner", "-buildconf"]
# stack size
RUN ["/ffmpeg", "-f", "lavfi", "-i", "testsrc", "-c:v", "libsvtav1", "-t", "100ms", "-f", "null", "-"]

FROM final
ENTRYPOINT ["/ffmpeg"]
