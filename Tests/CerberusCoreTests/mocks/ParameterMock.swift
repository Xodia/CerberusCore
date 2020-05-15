//
//  File.swift
//  
//
//  Created by Morgan Collino on 5/14/20.
//

import Foundation

let parameterJSON = """
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
}
"""

let badParameterJSON = """
{
"name" : "numberOfSongs",
"type" : "what",
"variants" : [
{
"variant" : "one of your favorite song",
"qualifier" : "one"
}
]
}
"""
