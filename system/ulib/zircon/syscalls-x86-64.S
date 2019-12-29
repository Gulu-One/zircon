// Copyright 2016 The Fuchsia Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/* define and implement the zircon syscall wrappers for x86-64 */

#include "syscall-entry.h"
#include "zircon-syscall-x86-64.S"

.text

.cfi_sections .eh_frame, .debug_frame

// The following assembly code converts arguments from the x86-64 SysV
// ABI's function calling conventions to the conventions used for Zircon
// syscalls:
//
//   arg 1: stays in %rdi
//   arg 2: stays in %rsi
//   arg 3: stays in %rdx
//   arg 4: moved from %rcx to %r10
//   arg 5: stays in %r8
//   arg 6: stays in %r9
//   arg 7: moved from 8(%rsp) to %r12
//   arg 8: moved from 16(%rsp) to %r13

.macro m_syscall name, num, nargs, public
syscall_entry_begin \name
    mov $\num, %eax
    jmpq *zcore_syscall_entry(%rip)
// This symbol at the return address identifies this as an approved call site.
    .hidden CODE_SYSRET_\name\()_VIA_\name
CODE_SYSRET_\name\()_VIA_\name\():
syscall_entry_end \name \public
.endm

.pushsection .rodata
zcore_syscall_entry:
    .quad 0xdeadbeaf
.popsection

#include <zircon/syscalls-x86-64.S>

#include "syscalls-stubs.S"
