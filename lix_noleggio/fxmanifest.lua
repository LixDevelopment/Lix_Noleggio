-- fxmanifest.lua
fx_version 'cerulean'
game 'gta5'

ui_page 'nui/index.html'

files {
    'nui/index.html'
}

shared_scripts {
    '@es_extended/imports.lua',
    'config.lua'
    
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}
