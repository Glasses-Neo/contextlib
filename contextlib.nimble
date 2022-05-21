# Package

version       = "0.1.0"
author        = "Glasses-Neo"
description   = "A new awesome nimble package"
license       = "WTFPL"
srcDir        = "src"


# Dependencies

requires "nim >= 1.6.0"

task tests, "Run all tests":
  exec "testament p 'tests/**.nim'"

task show, "Show testresults":
  exec "testament html"
  exec "open testresults.html"
