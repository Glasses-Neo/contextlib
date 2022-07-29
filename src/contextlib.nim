import macros

proc enter*(f: File): File =
  return f

proc exit*(f: File) =
  f.close()

macro with*(head, body: untyped): untyped =
  case head.kind
  of nnkInfix:
    if head[0].eqIdent"as":
      let
        variable = head[2]
        instance = head[1]
      result = quote do:
        block:
          defer: `instance`.exit()
          let `variable` = `instance`.enter()
          `body`
    else: error "Unsupported syntax"
  else:
    let instance = head
    result[0][1] = quote do:
      block:
        defer: `instance`.exit()
        `instance`.enter()
        `body`
