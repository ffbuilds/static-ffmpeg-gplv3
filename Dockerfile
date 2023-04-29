# syntax=docker/dockerfile:1

# bump: ffmpeg /FFMPEG_VERSION=([\d.]+)/ https://github.com/FFmpeg/FFmpeg.git|^5
# bump: ffmpeg after ./hashupdate Dockerfile FFMPEG $LATEST
# bump: ffmpeg link "Changelog" https://github.com/FFmpeg/FFmpeg/blob/n$LATEST/Changelog
# bump: ffmpeg link "Source diff $CURRENT..$LATEST" https://github.com/FFmpeg/FFmpeg/compare/n$CURRENT..n$LATEST
ARG FFMPEG_VERSION=5.1.3
ARG FFMPEG_URL="https://ffmpeg.org/releases/ffmpeg-$FFMPEG_VERSION.tar.bz2"
ARG FFMPEG_SHA256=5d5bef6a11f0c500588f9870ec965a30acc0d54d8b1e535da6554a32902d236d

# Must be specified
ARG ALPINE_VERSION

# Can be specified as anything@sha256:<hash>
ARG LIBAOM_VERSION=main
ARG LIBARIBB24_VERSION=main
ARG LIBASS_VERSION=main
ARG LIBBLURAY_VERSION=main
ARG LIBBROTLI_VERSION=main
ARG LIBDAV1D_VERSION=main
ARG LIBDAVS2_VERSION=main
ARG LIBGME_VERSION=main
ARG LIBGSM_VERSION=main
ARG LIBKVAZAAR_VERSION=main
ARG LIBMODPLUG_VERSION=main
ARG LIBMP3LAME_VERSION=main
ARG LIBMYSOFA_VERSION=main
ARG LIBOGG_VERSION=main
ARG LIBOPENCORE_AMR_VERSION=main
ARG LIBOPENJPEG_VERSION=main
ARG LIBOPUS_VERSION=main
ARG LIBRAV1E_VERSION=main
ARG LIBRUBBERBAND_VERSION=main
ARG LIBSAMPLERATE_VERSION=main
ARG LIBSHINE_VERSION=main
ARG LIBSPEEX_VERSION=main
ARG LIBSVTAV1_VERSION=main
ARG LIBTHEORA_VERSION=main
ARG LIBTWOLAME_VERSION=main
ARG LIBUAVS3D_VERSION=main
ARG LIBVIDSTAB_VERSION=main
ARG LIBVMAF_VERSION=main
ARG LIBVORBIS_VERSION=main
ARG LIBVPX_VERSION=main
ARG LIBWEBP_VERSION=main
ARG LIBX264_VERSION=main
ARG LIBX265_VERSION=main
ARG LIBXAVS2_VERSION=main
ARG LIBXML2_VERSION=main
ARG LIBXVID_VERSION=main
ARG LIBZIMG_VERSION=main

FROM alpine:${ALPINE_VERSION} AS base

FROM ghcr.io/ffbuilds/static-libaom-alpine_${ALPINE_VERSION}:${LIBAOM_VERSION} AS libaom
FROM ghcr.io/ffbuilds/static-libaribb24-alpine_${ALPINE_VERSION}:${LIBARIBB24_VERSION} AS libaribb24
FROM ghcr.io/ffbuilds/static-libass-alpine_${ALPINE_VERSION}:${LIBASS_VERSION} AS libass
FROM ghcr.io/ffbuilds/static-libbluray-alpine_${ALPINE_VERSION}:${LIBBLURAY_VERSION} AS libbluray
FROM ghcr.io/ffbuilds/static-libbrotli-alpine_${ALPINE_VERSION}:${LIBBROTLI_VERSION} AS libbrotli
FROM ghcr.io/ffbuilds/static-libdav1d-alpine_${ALPINE_VERSION}:${LIBDAV1D_VERSION} AS libdav1d
FROM ghcr.io/ffbuilds/static-libdavs2-alpine_${ALPINE_VERSION}:${LIBDAVS2_VERSION} AS libdavs2
FROM ghcr.io/ffbuilds/static-libgme-alpine_${ALPINE_VERSION}:${LIBGME_VERSION} AS libgme
FROM ghcr.io/ffbuilds/static-libgsm-alpine_${ALPINE_VERSION}:${LIBGSM_VERSION} AS libgsm
FROM ghcr.io/ffbuilds/static-libkvazaar-alpine_${ALPINE_VERSION}:${LIBKVAZAAR_VERSION} AS libkvazaar
FROM ghcr.io/ffbuilds/static-libmodplug-alpine_${ALPINE_VERSION}:${LIBMODPLUG_VERSION} AS libmodplug
FROM ghcr.io/ffbuilds/static-libmp3lame-alpine_${ALPINE_VERSION}:${LIBMP3LAME_VERSION} AS libmp3lame
FROM ghcr.io/ffbuilds/static-libmysofa-alpine_${ALPINE_VERSION}:${LIBMYSOFA_VERSION} AS libmysofa
FROM ghcr.io/ffbuilds/static-libogg-alpine_${ALPINE_VERSION}:${LIBOGG_VERSION} AS libogg
FROM ghcr.io/ffbuilds/static-libopencore-amr-alpine_${ALPINE_VERSION}:${LIBOPENCORE_AMR_VERSION} AS libopencore-amr
FROM ghcr.io/ffbuilds/static-libopenjpeg-alpine_${ALPINE_VERSION}:${LIBOPENJPEG_VERSION} AS libopenjpeg
FROM ghcr.io/ffbuilds/static-libopus-alpine_${ALPINE_VERSION}:${LIBOPUS_VERSION} AS libopus
FROM ghcr.io/ffbuilds/static-librav1e-alpine_${ALPINE_VERSION}:${LIBRAV1E_VERSION} AS librav1e
FROM ghcr.io/ffbuilds/static-librubberband-alpine_${ALPINE_VERSION}:${LIBRUBBERBAND_VERSION} AS librubberband
FROM ghcr.io/ffbuilds/static-libsamplerate-alpine_${ALPINE_VERSION}:${LIBSAMPLERATE_VERSION} AS libsamplerate
FROM ghcr.io/ffbuilds/static-libshine-alpine_${ALPINE_VERSION}:${LIBSHINE_VERSION} AS libshine
FROM ghcr.io/ffbuilds/static-libspeex-alpine_${ALPINE_VERSION}:${LIBSPEEX_VERSION} AS libspeex
FROM ghcr.io/ffbuilds/static-libsvtav1-alpine_${ALPINE_VERSION}:${LIBSVTAV1_VERSION} AS libsvtav1
FROM ghcr.io/ffbuilds/static-libtheora-alpine_${ALPINE_VERSION}:${LIBTHEORA_VERSION} AS libtheora
FROM ghcr.io/ffbuilds/static-libtwolame-alpine_${ALPINE_VERSION}:${LIBTWOLAME_VERSION} AS libtwolame
FROM ghcr.io/ffbuilds/static-libuavs3d-alpine_${ALPINE_VERSION}:${LIBUAVS3D_VERSION} AS libuavs3d
FROM ghcr.io/ffbuilds/static-libvidstab-alpine_${ALPINE_VERSION}:${LIBVIDSTAB_VERSION} AS libvidstab
FROM ghcr.io/ffbuilds/static-libvmaf-alpine_${ALPINE_VERSION}:${LIBVMAF_VERSION} AS libvmaf
FROM ghcr.io/ffbuilds/static-libvorbis-alpine_${ALPINE_VERSION}:${LIBVORBIS_VERSION} AS libvorbis
FROM ghcr.io/ffbuilds/static-libvpx-alpine_${ALPINE_VERSION}:${LIBVPX_VERSION} AS libvpx
FROM ghcr.io/ffbuilds/static-libwebp-alpine_${ALPINE_VERSION}:${LIBWEBP_VERSION} AS libwebp
FROM ghcr.io/ffbuilds/static-libx264-alpine_${ALPINE_VERSION}:${LIBX264_VERSION} AS libx264
FROM ghcr.io/ffbuilds/static-libx265-alpine_${ALPINE_VERSION}:${LIBX265_VERSION} AS libx265
FROM ghcr.io/ffbuilds/static-libxavs2-alpine_${ALPINE_VERSION}:${LIBXAVS2_VERSION} AS libxavs2
FROM ghcr.io/ffbuilds/static-libxml2-alpine_${ALPINE_VERSION}:${LIBXML2_VERSION} AS libxml2
FROM ghcr.io/ffbuilds/static-libxvid-alpine_${ALPINE_VERSION}:${LIBXVID_VERSION} AS libxvid
FROM ghcr.io/ffbuilds/static-libzimg-alpine_${ALPINE_VERSION}:${LIBZIMG_VERSION} AS libzimg

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
COPY --from=libbrotli /usr/local/lib/pkgconfig/libbrotli*.pc /usr/local/lib/pkgconfig/
COPY --from=libbrotli /usr/local/lib/libbrotli*-static.a /usr/local/lib/
COPY --from=libbrotli /usr/local/include/brotli/ /usr/local/include/brotli/
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
COPY --from=libsamplerate /usr/local/lib/pkgconfig/samplerate.pc /usr/local/lib/pkgconfig/samplerate.pc
COPY --from=libsamplerate /usr/local/lib/libsamplerate.a /usr/local/lib/libsamplerate.a
COPY --from=libsamplerate /usr/local/include/samplerate.h /usr/local/include/samplerate.h
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
COPY --from=libwebp /usr/local/lib/pkgconfig/lib*.pc /usr/local/lib/pkgconfig/
COPY --from=libwebp /usr/local/lib/lib*.a /usr/local/lib/
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
COPY --from=libxml2 /usr/local/lib/pkgconfig/libxml-2.0.pc /usr/local/lib/pkgconfig/libxml-2.0.pc
COPY --from=libxml2 /usr/local/lib/libxml2.a /usr/local/lib/libxml2.a
COPY --from=libxml2 /usr/local/include/libxml2/ /usr/local/include/libxml2/
COPY --from=libxvid /usr/local/lib/libxvidcore.* /usr/local/lib/
COPY --from=libxvid /usr/local/include/xvid.h /usr/local/include/xvid.h
COPY --from=libzimg /usr/local/lib/pkgconfig/zimg.pc /usr/local/lib/pkgconfig/zimg.pc
COPY --from=libzimg /usr/local/lib/libzimg.a /usr/local/lib/libzimg.a
COPY --from=libzimg /usr/local/include/zimg* /usr/local/include/
COPY --from=download /tmp/ffmpeg/ /tmp/ffmpeg/
ARG TARGETPLATFORM
ARG ALPINE_VERSION
ARG EXTRA_CONFIG_OPTS
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
    expat-dev expat-static \
    graphite2-static \
    glib-static \
    tiff tiff-dev \
    libjpeg-turbo libjpeg-turbo-dev \
    libpng-dev libpng-static \
    giflib giflib-dev \
    soxr-dev soxr-static \
    numactl-dev \
    cunit cunit-dev \
    fftw-dev \
    freetype-dev freetype-static \
    fribidi-dev fribidi-static \
    harfbuzz-dev harfbuzz-static \
    fontconfig-dev fontconfig-static \
    vo-amrwbenc-dev vo-amrwbenc-static \
    snappy-dev snappy-static && \
  for lib in common dec enc; do \
    ln -s /usr/local/lib/libbrotli${lib}-static.a /usr/local/lib/libbrotli${lib}.a; \
  done && \
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
  ${EXTRA_CONFIG_OPTS} \
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
