/*
 * Location.fx
 *
 * Created on Nov 21, 2009, 9:27:08 PM
 */

package weatherwatch;

import javafx.io.http.HttpRequest;

import java.io.InputStream;

import javafx.data.pull.PullParser;

import javafx.data.pull.Event;

/**
 * @author ywang29
 */

public class LocationService {

    public var zip : String on replace {
            updateLocation(zip);
    };
    public var location : Location;

    function updateLocation(zip : String) : Void {
        def req = HttpRequest {
            location : "http://local.yahooapis.com/MapsService/V1/geocode?appid=YD-9G7bey8_JXxQP6rxl.fBFGgCdNjoDMACQA--&zip={zip}";
            onInput: function (is : InputStream) {
                var loc = Location {};
                def parser = PullParser {
                    documentType: PullParser.XML;
                    input: is;
                    onEvent: function(event: Event) {
                        if (event.type == PullParser.END_ELEMENT) {
                            if (event.qname.name == "Latitude") {
                                loc.lat = Double.valueOf(event.text);
                            } else if (event.qname.name == "Longitude") {
                                loc.long = Double.valueOf(event.text);
                            } else if (event.qname.name == "City") {
                                loc.city = event.text;
                            } else if (event.qname.name == "State") {
                                loc.state = event.text;
                            }
                        } else if (event.type == PullParser.END_DOCUMENT) {
                            is.close();
                            location = loc;
                        }
                    }

                }
                parser.parse();
            }
        }
        req.start();
    }
}