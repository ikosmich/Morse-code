//
//  logic.swift
//  Morse code
//
//  Created by Artem Alekseev on 29.06.2022.
//

import Foundation
 
let morseDictionary = [
  ".-": "A", "-...": "B", "-.-.": "C", "-..": "D", ".": "E", "..-.": "F", "--.": "G", "....": "H",
  "..": "I", ".---": "J", "-.-": "K", ".-..": "L", "--": "M", "-.": "N", "---": "O", ".--.": "P",
  "--.-": "Q", ".-.": "R", "...": "S", "-": "T", "..-": "U", "...-": "V", ".--": "W", "-..-": "X",
  "-.--": "Y", "--..": "Z", " ": " ", ".----": "1", "..---": "2", "...--": "3", "....-": "4",
  ".....": "5", "-....": "6", "--...": "7", "---..": "8", "----.": "9", "-----": "0", "-.-.--": "!",
  ".-.-.-": ".", "...---...": "SOS", "   ": "   ",
]
 
func decodeMorse(morseCode: String) -> String {
  let morseArray = morseCode.components(separatedBy: "   ")
  var charArray: [String] = []
  var result = ""
  if !morseArray.isEmpty {
    for i in morseArray {
      charArray += i.components(separatedBy: " ")
      charArray.append(" ")
    }
    charArray.removeLast()
  } else {
    charArray = morseCode.components(separatedBy: " ")
  }
  for word in charArray {
    result += morseDictionary[word] ?? "?"
  }
  return result.trimmingCharacters(in: .whitespaces)
}
 
func codeToMorse(str: String) -> String {
  var stringArray: [String] = []
  var result = ""
  for i in str {
    if i != " " {
      stringArray.append(String(i))
      stringArray.append(" ")
    } else if stringArray.isEmpty {
      stringArray.append("   ")
    } else {
       stringArray.removeLast()
       stringArray.append("   ")
    }
  }
  for v in stringArray {
    result += morseDictionary.first(where: { $0.value == v })?.key ?? "?"
  }
  return result.trimmingCharacters(in: .whitespaces)
}
