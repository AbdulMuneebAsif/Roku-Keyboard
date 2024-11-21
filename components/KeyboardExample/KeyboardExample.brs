sub Init()
    initializeItems()
    observers()
end sub


sub initializeItems()
    m.keyboard = m.top.FindNode("keyboard")
    m.OKBtn = m.top.FindNode("OKBtn")
end sub

sub observers()
    m.OKBtn.observeField("buttonSelected", "OnOKBtnSelected")
end sub

sub OnOKBtnSelected()
    m.PostGeminiQueryTask = CreateObject("roSGNode", "PostGeminiQueryTask")
    m.PostGeminiQueryTask.query = m.keyboard.text
    m.PostGeminiQueryTask.control = "RUN"
end sub

function onKeyEvent(key as string, press as boolean) as boolean

    result = false
    if press
        if key = "down"
            m.OKBtn.setFocus(true)
            result = true
        else if key = "up"
            m.keyboard.setFocus(true)
            result = true
        end if
    end if
    return result

end function