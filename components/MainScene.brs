sub Init()
    print "************ Init Method of Main Scene called************"
    m.top.backgroundColor = "0x68806876"
    m.top.backgroundURI = "pkg:/images/hack.jpeg"
    m.top.loadingIndicator = m.top.FindNode("loadingIndicator")
    
    InitScreenStack()
    ShowKeyboardScreen()

end sub

function OnkeyEvent(key as String, press as Boolean) as Boolean
    result = false
    if press
        ' handle "back" key press
        if key = "back"
            numberOfScreens = m.screenStack.Count()
            ' close top screen if there are two or more screens in the screen stack
            if numberOfScreens > 1
                CloseScreen(invalid)
                result = true
            end if
        end if
    end if
    ' The OnKeyEvent() function must return true if the component handled the event,
    ' or false if it did not handle the event.
    return result
end function
