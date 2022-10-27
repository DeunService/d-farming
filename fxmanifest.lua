fx_version 'adamant'
game 'gta5'
description 'D-Farming from Deun Services. Link to our discord: deun.xyz'
version '1.05'
lua54 'yes'

client_script {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/de.lua',

  "client/client.lua",
  "client/blips.lua",
  "client/markerspawn.lua",
  "client/radiusspawn.lua",
  "client/propsspawn.lua",
  "client/objectspawn.lua",
  "config/config.lua"
}

server_script {
  '@es_extended/locale.lua',
  "config/config.lua",
  'locales/en.lua',
  'locales/de.lua',

  "@mysql-async/lib/MySQL.lua",
  "server/server.lua"
}

escrow_ignore {
  "client/client.lua",
  "server/server.lua",
  "config/config.lua",
  'locales/en.lua',
  'locales/de.lua',
}
