sub InitScreenStack()
    m.screenStack = []
end sub

sub ShowScreen(node as Object)
    prev = m.screenStack.Peek()
    if prev <> invalid
        prev.visible = false
    end if

    m.top.AppendChild(node)
    node.visible = true
    node.setFocus(true)
    m.screenStack.Push(node)
    
end sub


sub CloseScreen(node as Object)
    if node = invalid OR (m.screenStack.Peek() <> invalid AND m.screenStack.Peek.IsSameNode(node))
        last = m.screenStack.Pop()
        last.visible = false
        m.top.RemoveChild(node)

    end if

    prev = m.screenStack.Peek()
    if prev <> invalid
        prev.visible = true
        prev.setFocus(true)

    end if

end sub