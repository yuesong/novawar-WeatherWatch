/*
 * WeatherService.fx
 *
 * Created on Nov 21, 2009, 2:22:57 PM
 */

package weatherwatch;

import javafx.io.http.HttpRequest;
import java.io.InputStream;

import javafx.data.pull.Event;
import javafx.data.pull.PullParser;


/**
 * @author ywang29
 */

public class WeatherService {

    public var location : Location on replace {
        updateWeather(location.lat, location.long);
    }

    public var weather : Weather;

    function updateWeather(lat : Double, long : Double) {
        def req = HttpRequest {
            location : "http://ws.geonames.org/findNearByWeatherXML?lat={lat}&lng={long}";
            onInput: function (is : InputStream) {
                var w = Weather {};
                def parser = PullParser {
                    documentType: PullParser.XML;
                    input: is;
                    onEvent: function(event: Event) {
                        if (event.type == PullParser.END_ELEMENT) {
                            if (event.qname.name == "stationName") {
                                w.station = event.text;
                            } else if (event.qname.name == "temperature") {
                                w.temperature = Double.valueOf(event.text);
                            } else if (event.qname.name == "clouds") {
                                w.clouds = event.text;
                            } else if (event.qname.name == "weatherCondition") {
                                w.weatherCondition = event.text;
                            }
                        } else if (event.type == PullParser.END_DOCUMENT) {
                            is.close();
                            weather = w;
                        }
                    }

                }
                parser.parse();
            }
        }
        req.start();
    }

}

