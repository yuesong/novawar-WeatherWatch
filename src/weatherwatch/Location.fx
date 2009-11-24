/*
 * Location.fx
 *
 * Created on Nov 21, 2009, 11:11:06 PM
 */

package weatherwatch;

/**
 * @author ywang29
 */

public class Location {
    public var lat : Double;
    public var long : Double;
    public var city : String;
    public var state : String;
    override function toString() {
        "{city}, {state} ({lat}, {long})";
    }
}
