sub Init()
    initializeItems()
    observers()
end sub


sub initializeItems()
    m.keyboard = m.top.FindNode("keyboard")
    m.keyboard.TextEditBox.maxTextLength = 150
    m.OKBtn = m.top.FindNode("OKBtn")
    m.ScrollingLabel = m.top.FindNode("ScrollingLabel")
end sub

sub observers()
    m.OKBtn.observeField("buttonSelected", "OnOKBtnSelected")
end sub

sub OnOKBtnSelected()
    showLoaderDialog()
    m.PostGeminiQueryTask = CreateObject("roSGNode", "PostGeminiQueryTask")
    m.PostGeminiQueryTask.query = m.keyboard.text
    m.PostGeminiQueryTask.ObserveField("status", "OnAPIStatus")
    m.PostGeminiQueryTask.control = "RUN"
end sub

sub OnAPIStatus()
    m.ScrollingLabel.text = m.PostGeminiQueryTask.content
    closeLoaderDialog()
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
        else if key = "right"
            m.ScrollingLabel.setFocus(true)
            result = true
        end if
    end if
    return result
end function



sub showLoaderDialog(msg = invalid)
    dialog = CreateObject("roSGNode", "StandardProgressDialog")
    if msg <> invalid
        dialog.title = msg
    else
        dialog.title = "Just a moment..."
    end if
    dialog.palette = m.greenPalette
    m.top.getScene().dialog = dialog
end sub

sub closeLoaderDialog()
    if m.top.getScene().dialog <> invalid
        m.top.getScene().dialog.close = true
    end if
end sub