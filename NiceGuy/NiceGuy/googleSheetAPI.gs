//
//  googleSheetAPI.gs (Javascript/Google Sheets Script)
//  Functions for Interacting With Values in Google Sheets
//
//  Created by Justin Kaufman on 11/10/15.
//  Copyright © 2015 Justin Kaufman. All rights reserved.
//

// Returns a compliment from the spreadsheet located at:
// https://docs.google.com/spreadsheets/d/1hFUsI3PYRpYAXTGbU83uo1lZV0RdahyBtmtv3kGzVyA/edit#gid=0&vpid=A2
// 'e' is a placeholder for the 'id' and 'user' parameters
// If no 'id' specified, doGet(e) returns a random compliment in range
// If 'user' is specified, doGet(e) returns compliment with "Hey user, " formatting
function doGet(e) {

    var id = Number(e.parameters.id*1);
    var user = String(e.parameter.user);

    // Open our spreadsheet
    var cBase = SpreadsheetApp.openById("1hFUsI3PYRpYAXTGbU83uo1lZV0RdahyBtmtv3kGzVyA");

    // Outlet for first sheet in the doc
    var cList = cBase.getSheets()[0];

    // Validate our compliment id
    if ((id < 2) || (id > 126) || (isNaN(id) == true)) {
        id = getRandomInt(2, 126);
    }

    // First row in our list is 2 and our sheet has 2 columns
    var range = cList.getRange(id, 2);

    // Save the value of cell at row: id, column, 1
    var value = range.getValues();
    var result = value[0][0];

    if ((typeof user === 'string') && (user != "undefined")) {
        result = 'Hey ' + user + ', ' + result;
    }

    // Log the result for review later
    var logString = "[" + String(user) + "/" + String(id) + "] " + result;
    Logger.log(logString);

    // Return result as JSON
    return ContentService.createTextOutput(JSON.stringify(result)).setMimeType(ContentService.MimeType.JSON);

}

function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}