LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE                  := msm-vidc-test
LOCAL_VENDOR_MODULE           := true
LOCAL_PRELINK_MODULE          := false
LOCAL_HEADER_LIBRARIES        := generated_kernel_headers
LOCAL_SRC_FILES               := msm_vidc_test.c
LOCAL_SRC_FILES               += queue.c
LOCAL_SRC_FILES               += ring_queue.c
# This legacy diagnostic utility intentionally carries unused parser state and
# uses the pre-Treble ION ABI. Android 13 enables additional warnings globally;
# keep those warnings from breaking this optional test binary.
LOCAL_CFLAGS                  := -DLOG_TAG=\"MSM-VIDC-TEST\" \
                                 -Wno-error \
                                 -Wno-error=int-conversion \
                                 -Wno-error=pointer-integer-compare
LOCAL_MODULE_TAGS             := optional
LOCAL_32_BIT_ONLY             := true
include $(BUILD_EXECUTABLE)
