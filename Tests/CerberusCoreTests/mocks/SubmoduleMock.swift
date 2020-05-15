//
//  File.swift
//  
//
//  Created by Morgan Collino on 5/14/20.
//

import Foundation

let submoduleJSON = """
{
"name" : "daily",
"language" : [
{
"copy" : [
{
"key" : "title",
"value" : {
"value" : "Playlist of the day",
"parameters" : [

]
}
},
{
"key" : "description",
"value" : {
"value" : "Hello __userName__, there are __numberOfSongs__ in the playlist __playlistName__. Would you like to listen to it?",
"parameters" : [
{
"name" : "userName",
"type" : "string",
"variants" : [

]
},
{
"name" : "numberOfSongs",
"type" : "integer",
"variants" : [
{
"variant" : "one of your favorite song",
"qualifier" : "one"
},
{
"variant" : "__numberOfSongs__ of your favorite songs",
"qualifier" : "other"
}
]
},
{
"name" : "playlistName",
"type" : "string",
"variants" : [

]
}
]
}
},
{
"key" : "cta",
"value" : {
"value" : "Listen",
"parameters" : [

]
}
},
{
"key" : "cta_dismiss",
"value" : {
"value" : "dismiss",
"parameters" : [

]
}
}
],
"array" : [

],
"identifier" : "en-US"
},
{
"copy" : [
{
"key" : "title",
"value" : {
"value" : "Playlist du jour",
"parameters" : [

]
}
},
{
"key" : "description",
"value" : {
"value" : "Bonjour __userName__, la playlist  __playlistName__ contient __numberOfSongs__. Souhaitez-vous l'écouter?",
"parameters" : [
{
"name" : "userName",
"type" : "string",
"variants" : [

]
},
{
"name" : "numberOfSongs",
"type" : "integer",
"variants" : [
{
"variant" : "aucune chanson favorite",
"qualifier" : "zero"
},
{
"variant" : "une chanson favorite",
"qualifier" : "one"
},
{
"variant" : "__numberOfSongs__ chansons favorite",
"qualifier" : "other"
}
]
},
{
"name" : "playlistName",
"type" : "string",
"variants" : [

]
}
]
}
},
{
"key" : "cta",
"value" : {
"value" : "Écouter",
"parameters" : [

]
}
},
{
"key" : "cta_dismiss",
"value" : {
"value" : "retour",
"parameters" : [

]
}
}
],
"array" : [

],
"identifier" : "fr"
}
]
}
"""
