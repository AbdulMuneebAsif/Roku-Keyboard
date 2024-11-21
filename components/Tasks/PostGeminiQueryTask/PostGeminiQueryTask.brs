sub Init()
    m.top.functionName = "GetContent"
end sub

sub GetContent()

    url = "https://kidstube.invotyx.com/api/v4/crashLogs/add/"
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL(url)
    xfer.AddHeader("Content-Type", "application/json")
    port = createObject("roMessagePort")
    xfer.SetMessagePort(port)

    data = {

    }
    xfer.AsyncPostFromString(FormatJson(data))
    msg = Wait(0, port)
end sub
