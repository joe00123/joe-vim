XPTemplate priority=lang-1
XPTinclude
      \ _common/common
XPT sout
console.log("`cursor^")
XPT require
`model^=require("`model^")
XPT util
util=require("util")
XPT inspect
require("util").inspect(`cursor^)
XPT test
abc`cursor22^||`cursor1^


