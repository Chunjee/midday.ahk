# midday.ahk

Converts 24-hour (military) time string to 12-hour (meridiem) time string and vice versa.

![npm](https://img.shields.io/npm/dm/midday.ahk?style=for-the-badge)

## Installation
In a terminal or command line navigated to your project folder:
```bash
npm install midday.ahk
```

In your code only export.ahk needs to be included:
```autohotkey
#Include %A_ScriptDir%\node_modules
#Include midday.ahk\export.ahk

midday := new midday()
result := midday.to24("12:30 AM")
; => "00:30"

result := midday.to12("00:30")
; => "12:30 AM"
```
You may also review or copy the library from [./export.ahk on GitHub](https://raw.githubusercontent.com/chunjee/midday.ahk/master/export.ahk); #Incude as you would normally when manually downloading.

## API
Including the module provides a class `midday` with two methods: `.to12` and `.to24`

### to12(value)

Converts 24-hour (military) time string to 12-hour (meridiem) time string.

##### Arguments
time (String): the time string

##### Returns
time (String): converted 24-hour time string to 12-hour time

##### Exceptions
throws an error if the time string is invalid

##### Examples
```autohotkey
midday.to24("12:30 AM")
; => "00:30"
```


### .to24(value)
Converts 12-hour (meridiem) time string to 24-hour (military) time string.

##### Arguments
time (String): the time string

##### Returns
time (String): converted 24-hour time string to 12-hour time

##### Exceptions
throws an error if the time string is invalid

##### Examples
```autohotkey
midday.to12("00:30")
; => "12:30 AM"

midday.to12("0030")
; => "12:30 AM"
```
