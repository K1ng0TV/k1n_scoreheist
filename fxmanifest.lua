fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'
shared_script '@ox_lib/init.lua'


dependencies {
    'ox_lib',
    'es_extended'
}

escrow_ignore {   
    'config.lua'
}