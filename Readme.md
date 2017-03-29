Blue Jeans Desktop App launch URL generator
===

Example Ruby code showing how to generate a meeting launch URL for the [Blue Jeans desktop app](https://www.bluejeans.com/downloads).

This allows you to programmatically start the Blue Jeans desktop app (if it's not already running) and make it join the given meeting. You can use the URL as the target of a shortcut file, the `href` of a hyperlink, or as a URL that you launch directly with `start` or `open`.

## Installation
```bash
$ git clone https://github.com/Aldaviva/ruby-bjn-app-url-generator.git
$ cd ruby-bjn-app-url-generator
$ bundle install
```
Tested with Ruby 2.1.5.

## Usage
```bash
$ ruby bjnAppUrlGenerator.rb
Blue Jeans desktop app launch URL generator
Meeting ID: 10990
Passcode:   0000

Launch context:
{
  "meeting_id": "10990",
  "role_passcode": "0000",
  "ctxver": "1.0.0",
  "user_full_name": null,
  "user_email": null,
  "user_token": null,
  "meeting_api": "https://bluejeans.com",
  "release_channel": "live"
}

Launch URL:
bjn://meeting/fch6utb5ehmpwtuzd5j24eh264r3je9g48p24wkfdhjnyw31edtp6vv4cmh3m8hg60r308hc49hq8y3pcnt24eh264q30bhg48p24xbkcnt5ytkndhp5yvk1dnjj4ekeenp6rb12entpawjzcnpp2ubc48x6wxbcdgp24xbkcnt5yx3fddjpw8hudtuprv1c49ppatbmd5q6eqv1e1mj4eh2d1u78w3k78qjyrkcenjpmtb1dttjwrvfdmh2r8kjcnp6arbkcnfp6u31dtq6av1278h6rubpcmh7u?ctxver=1.0.0
```

## Context properties
|name|required|description|default behavior|example value|
|---|---|---|---|---|
|`ctxver`|required|This URL syntax is versioned. Always use `"1.0.0"`.||`"1.0.0"`|
|`meeting_id`|required|Numeric ID of the Blue Jeans meeting you want to join||`"10990"`|
|`role_passcode`||Numeric passcode of the meeting, or `null` for a passcodeless meeting|`null`|`"0000"`|
|`user_full_name`||Your name in the participant list|logged-in app user's name|`"Ben"`|
|`user_email`||Your email address|logged-in app user's email|`"ben@bluejeans.com"`|
|`user_token`||Sign in to the app with this existing Blue Jeans access token|don't change users|`"57548fdc1c0141aeb4e758c40ec782c0"`|
|`meeting_api`||Which Blue Jeans cluster to join (prod, stage, QA, dev)|`"https://bluejeans.com"`|`"https://bluejeans.com"`|
|`release_channel`||Checking for app updates|`"live"`|`"live"`|

## Dependencies
This script uses [stesla/base32](https://rubygems.org/gems/base32) with the [alphabet](https://github.com/agnoster/base32-js/blob/v0.0.6/lib/base32.js#L6) from [agnoster/base32-js](https://www.npmjs.com/package/base32).

You can [test your base-32](https://output.jsbin.com/sigeva/1) with the reference library used by the Blue Jeans desktop app.
