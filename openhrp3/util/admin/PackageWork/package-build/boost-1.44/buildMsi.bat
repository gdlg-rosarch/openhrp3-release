ruby collect.rb
ruby create_wxs.rb
candle boost.wxs -out boost.wixobj
light -ext WixUIExtension -out boost-1.44.msi boost.wixobj