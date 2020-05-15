//
//  File.swift
//  
//
//  Created by Morgan Collino on 5/14/20.
//

import Foundation

let languageJSON = """
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
}
"""

let badLanguageJSON = """
{
"copies" : [
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
}
"""
