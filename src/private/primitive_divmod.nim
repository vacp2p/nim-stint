# Mpint
# Copyright 2018 Status Research & Development GmbH
# Licensed under either of
#
#  * Apache License, version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
#  * MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
#
# at your option. This file may not be copied, modified, or distributed except according to those terms.

proc divmod*(x, y: SomeInteger): tuple[quot, rem: SomeInteger] {.noSideEffect, inline.}=
  # hopefully the compiler fuse that in a single op
  (x div y, x mod y)
