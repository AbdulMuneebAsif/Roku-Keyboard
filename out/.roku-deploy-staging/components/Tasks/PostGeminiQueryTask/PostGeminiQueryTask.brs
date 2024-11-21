sub Init()
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    readkeyFromfile = ParseJson(ReadAsciiFile("pkg:/components/Gemini_API_Keys.json"))
    url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=" + readkeyFromfile.chat_API_KEY
    print "url = " url
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL(url)
    xfer.AddHeader("Content-Type", "application/json")
    port = createObject("roMessagePort")
    xfer.SetMessagePort(port)

    data = {
        "contents": [
            { "parts": [
                    {
                        "text": m.top.query
                    }
                ]
            }
        ]
    }
    xfer.AsyncPostFromString(FormatJson(data))
    msg = Wait(0, port)
    rsp = msg.GetString()
    rsp = ParseJson(rsp)
    if rsp <> invalid
        m.top.content = rsp.candidates[0].content.parts[0].text
        m.top.status = "OK"
    else
        m.top.content = "something Went wrong. try again later."
        m.top.status = "ERROR"
    end if
end sub
