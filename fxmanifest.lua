fx_version 'cerulean'
game 'gta5'

author 'Anoxidus ANX'
description 'ESX Job Star Display'
version '1.0.0'

shared_scripts { 
    'config.lua',
    '@es_extended/imports.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua',
    'versioncheck.lua'
}

files {
    'html/ui.html'
}

ui_page 'html/ui.html'
