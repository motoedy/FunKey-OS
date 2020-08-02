#!/bin/sh
# post-image.sh - build full .itb image
set -x
set -e

BOARD_DIR="$( dirname "${0}" )"
MKIMAGE="${HOST_DIR}/bin/mkimage"
IMAGE_ITS="image.its"
BOOT_CMD="boot.cmd"
OUTPUT_NAME="image.itb"

# We have to copy .its file over to images/ for /incbin/ to work
cp "${BOARD_DIR}/${IMAGE_ITS}" "${BINARIES_DIR}"

# We have to copy .cmd file over to images/ for /incbin/ to work
cp "${BOARD_DIR}/${BOOT_CMD}" "${BINARIES_DIR}"

cd "${BINARIES_DIR}"

# This will create ${BINARIES_DIR}/${OUTPUT_NAME} FIT image
"${MKIMAGE}" -f ${IMAGE_ITS} ${OUTPUT_NAME}

rm ${IMAGE_ITS}
