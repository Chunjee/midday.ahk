
#Include %A_ScriptDir%\..\export.ahk
#Include %A_ScriptDir%\..\node_modules
#Include unit-testing.ahk\export.ahk

#NoTrayIcon
#NoEnv
#SingleInstance, force
SetBatchLines, -1

midday := new midday()
assert := new unittesting()

assert.group("to24")
assert.label("all hours")
assert.equal(midday.to24("12:00 AM"), "00:00")
assert.equal(midday.to24("12:30 AM"), "00:30")
assert.equal(midday.to24("1:30 AM"), "01:30")
assert.equal(midday.to24("2:30 AM"), "02:30")
assert.equal(midday.to24("3:30 AM"), "03:30")
assert.equal(midday.to24("4:30 AM"), "04:30")
assert.equal(midday.to24("5:30 AM"), "05:30")
assert.equal(midday.to24("6:30 AM"), "06:30")
assert.equal(midday.to24("7:30 AM"), "07:30")
assert.equal(midday.to24("8:30 AM"), "08:30")
assert.equal(midday.to24("9:30 AM"), "09:30")
assert.equal(midday.to24("10:30 AM"), "10:30")
assert.equal(midday.to24("11:30 AM"), "11:30")
assert.equal(midday.to24("12:30 PM"), "12:30")
assert.equal(midday.to24("1:30 PM"), "13:30")
assert.equal(midday.to24("2:30 PM"), "14:30")
assert.equal(midday.to24("3:30 PM"), "15:30")
assert.equal(midday.to24("4:30 PM"), "16:30")
assert.equal(midday.to24("5:30 PM"), "17:30")
assert.equal(midday.to24("6:30 PM"), "18:30")
assert.equal(midday.to24("7:30 PM"), "19:30")
assert.equal(midday.to24("8:30 PM"), "20:30")
assert.equal(midday.to24("9:30 PM"), "21:30")
assert.equal(midday.to24("10:30 PM"), "22:30")
assert.equal(midday.to24("11:30 PM"), "23:30")
assert.equal(midday.to24("11:59 PM"), "23:59")

assert.group("to12")
assert.label("with colon separator")
assert.equal(midday.to12("12:00"), "12:00 PM")
assert.equal(midday.to12("00:00"), "12:00 AM")
assert.equal(midday.to12("00:01"), "12:01 AM")
assert.equal(midday.to12("01:00"), "01:00 AM")
assert.equal(midday.to12("02:00"), "02:00 AM")
assert.equal(midday.to12("03:00"), "03:00 AM")
assert.equal(midday.to12("04:00"), "04:00 AM")
assert.equal(midday.to12("05:00"), "05:00 AM")
assert.equal(midday.to12("13:00"), "1:00 PM")
assert.equal(midday.to12("14:00"), "2:00 PM")
assert.equal(midday.to12("15:00"), "3:00 PM")
assert.equal(midday.to12("22:00"), "10:00 PM")
assert.equal(midday.to12("23:00"), "11:00 PM")
assert.equal(midday.to12("23:59"), "11:59 PM")
assert.equal(midday.to12("00:00"), "12:00 AM")

assert.label("without colon")
assert.equal(midday.to12("1200"), "12:00 PM")
assert.equal(midday.to12("0000"), "12:00 AM")
assert.equal(midday.to12("0001"), "12:01 AM")
assert.equal(midday.to12("0100"), "01:00 AM")
assert.equal(midday.to12("0200"), "02:00 AM")
assert.equal(midday.to12("0300"), "03:00 AM")
assert.equal(midday.to12("0400"), "04:00 AM")
assert.equal(midday.to12("0500"), "05:00 AM")
assert.equal(midday.to12("1300"), "1:00 PM")
assert.equal(midday.to12("1400"), "2:00 PM")
assert.equal(midday.to12("1500"), "3:00 PM")
assert.equal(midday.to12("2200"), "10:00 PM")
assert.equal(midday.to12("2300"), "11:00 PM")
assert.equal(midday.to12("2359"), "11:59 PM")
assert.equal(midday.to12("0000"), "12:00 AM")


assert.group("_regexpExec")
assert.label("generic")
assert.equal(midday._regexpExec("10:30 PM", "^(([01][012])|(\d)):([012345]\d)\s?(a|p)m$").1, "10")
assert.equal(midday._regexpExec("10:30 PM", "^(([01][012])|(\d)):([012345]\d)\s?(a|p)m$").4, "30")


assert.fullreport()

ExitApp
