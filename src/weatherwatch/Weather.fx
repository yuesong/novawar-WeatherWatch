/*
 * Weather.fx
 *
 * Created on Nov 21, 2009, 11:11:53 PM
 */

package weatherwatch;

/**
 * @author ywang29
 */

public class Weather {
    public var station: String;
    public var temperature: Double;
    public var clouds: String;
    public var weatherCondition: String;
    override function toString() {
        "{temperature}C; clouds={clouds}; condition={weatherCondition} ({station})";
    }

}
