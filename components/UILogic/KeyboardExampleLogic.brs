sub ShowKeyboardScreen()
    m.KeyboardScreen = CreateObject("roSGNode", "KeyboardExample")
    ShowScreen(m.KeyboardScreen)
    m.KeyboardScreen.ObserveField("userTyped", "DisplayNewScreen")
end sub


sub DisplayNewScreen()
    m.NewScreen = CreateObject("roSGNode", "NewScreen")
    ShowScreen(m.NewScreen)
end sub