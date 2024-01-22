'********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

sub Main()
    showChannelSGScreen()
  end sub
  
  sub showChannelSGScreen()
        print " ************ Main Method called ************ "  
        ' app_info = createObject("roAppInfo")
        ' ? "App Title: ", app_info.getTitle()
        ' ? "App Version: ", app_info.getVersion()
        ' ? "Channel ID: ", app_info.getID()
        ' ? "isDev: ", app_info.isDev()
        ' ? "Custom Field: ", app_info.getValue("custom_field")
        ' ' Print information from device
        ' ? "- - - - - - - - - - - - - - - - "
        ' device_info = createObject("roDeviceInfo")
        ' ? "Model: ", device_info.getModel()
        ' ? "Display Name: ", device_info.getModelDisplayName()
        ' ? "Firmware: ", device_info.getVersion()
        ' ? "Device ID: ", device_info.GetChannelClientId()
        ' ? "Friendly Name: ", device_info.getFriendlyName()
        ' display_size = device_info.getDisplaySize()
        ' ? "Display Size: ", display_size.w;"x";display_size.h
        ' ? "UI Resolution: ", device_info.getUIResolution()
        ' ? "Video Mode: ", device_info.getVideoMode()
        ' ? "IP Address: ",device_info.getExternalIp()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("MainScene")
    screen.show()
  
    while(true)
      msg = wait(0, m.port)
      msgType = type(msg)
  
      if msgType = "roSGScreenEvent"
        if msg.isScreenClosed() then return
      end if
    end while
  
  end sub
  