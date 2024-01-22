sub ShowKeyboardScreen()
    print " ************ Show Keyboard Screen method called ************ "
    m.KeyboardScreen = CreateObject("roSGNode", "KeyboardExample")
    ShowScreen(m.KeyboardScreen)
    m.KeyboardScreen.ObserveField("userTyped", "DisplayNewScreen")
    ' m.KeyboardScreen.content = m.KeyboardScreen.userTyped
end sub


sub DisplayNewScreen()
    print " ************ Display New Screen method called ************ "
    m.NewScreen = CreateObject("roSGNode", "NewScreen")
    print "Text extracted to new screen =>", m.KeyboardScreen.userTyped

    m.NewScreen.content = m.KeyboardScreen.userTyped
    ShowScreen(m.NewScreen)


    ' these both print statements get the same value
    print " m.KeyboardScreen.userTyped = > ", m.KeyboardScreen.userTyped
    print " m.NewScreen.content = > ", m.NewScreen.content
end sub