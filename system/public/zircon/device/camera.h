// Copyright 2019 The Fuchsia Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef SYSROOT_ZIRCON_DEVICE_CAMERA_H_
#define SYSROOT_ZIRCON_DEVICE_CAMERA_H_

#include <ddk/metadata.h>
#include <fuchsia/camera/common/c/fidl.h>

// TODO(ZX-2677): Deleting this file is blocked by banjo being able to consume
// code generated by fidl.
// This allows banjo files to use FIDL generated structs. Once ZX-2677 is implemented
// this will not be needed and can be cleaned up.
typedef fuchsia_camera_common_FrameRate frame_rate_t;

#endif // SYSROOT_ZIRCON_DEVICE_SYSMEM_H_
