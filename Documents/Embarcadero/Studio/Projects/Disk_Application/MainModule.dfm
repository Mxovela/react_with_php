object UniMainModule: TUniMainModule
  MonitoredKeys.Keys = <>
  Height = 480
  Width = 640
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'disk_application'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 224
    Top = 208
  end
end
