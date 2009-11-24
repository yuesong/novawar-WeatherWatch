/*
 * Test.fx
 *
 * Created on Nov 23, 2009, 7:36:58 PM
 */

package weatherwatch;

import javafx.io.http.HttpRequest;


import java.io.InputStream;
import java.lang.Thread;

import java.lang.System;

/**
 * @author ywang29
 */

var req = HttpRequest {
    location: "http://google.com"
    onInput: function(is : InputStream) {
        p("onInput: {is.available()} bytes");
        is.close();
        System.exit(0);
    }
}

function p(msg: String) {
    println("{System.currentTimeMillis()} [{Thread.currentThread().getId()}]: {msg}");
}

p("start");
req.start();
Thread.sleep(3000);
p("done");
