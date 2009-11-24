/*
 * Main.fx
 *
 * Created on Nov 21, 2009, 2:21:44 PM
 */

package weatherwatch;

import javafx.scene.Scene;
import javafx.scene.text.Text;


import javafx.stage.Stage;
import javafx.scene.control.TextBox;
import javafx.scene.layout.VBox;


/**
 * @author ywang29
 */
var zipCode : String = "22182";

var locationService = LocationService {
    zip: bind zipCode
}

var weatherService = WeatherService {
    location: bind locationService.location
}

Stage {
    title: "Application title"
    width: 600
    height: 100
    scene: Scene {
      content: VBox {
        spacing: 5
        content: [
            TextBox {
                text: bind zipCode with inverse
                columns: 20
                selectOnFocus: true
            }
            Text {
                content: bind "{locationService.location}"
            }
            Text {
                content: bind "{weatherService.weather}"
            }
        ]
      }
    }
}