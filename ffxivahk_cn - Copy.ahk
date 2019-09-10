; Version 0.1.8
Replace(MyString){
    StringCaseSense On
    MyString := StrReplace(MyString, "骑你", "骑.你")
    return %MyString%
}
sendMode, Input
SetTitleMatchMode RegEx
#IfWinActive (最终幻想 ?(14|XIV)|Final Fantasy (14|XIV))
;#IfWinActive (记事本|[Nn]otepad)
^o::
    SendInput ^a
    clipboard = 
        Send ^x
        ClipWait 0.1
    if ErrorLevel
    {
        clipboard := ""
        Return
    }
    clipboard := Replace(clipboard)
    SendInput ^v
Return
^v::
    clipboard := Replace(clipboard)
    SendInput ^v
Return