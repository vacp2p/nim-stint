packageName   = "mpint"
version       = "0.0.1"
author        = "Status Research & Development GmbH"
description   = "Efficient multiprecision int in Nim"
license       = "Apache License 2.0 or MIT"
srcDir        = "src"

### Dependencies

requires "nim >= 0.18"

proc test(name: string, lang: string = "c") =
  if not dirExists "build":
    mkDir "build"
  if not dirExists "nimcache":
    mkDir "nimcache"
  --run
  --nimcache: "nimcache"
  switch("out", ("./build/" & name))
  setCommand lang, "tests/" & name & ".nim"

task test_debug, "Run all tests - test implementation (MpUint[64] = 2x uint32":
  switch("define", "mpint_test")
  test "all_tests"

task test_prod, "Run all tests - prod implementation (MpUint[64] = uint64":
  test "all_tests"

task test, "Run all tests - test and production implementation":
  exec "nimble test_debug"
  exec "nimble test_prod"
