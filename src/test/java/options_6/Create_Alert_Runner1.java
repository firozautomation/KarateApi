package options_6;


import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@CucumberOptions( tags = {"~@ignore"})  //to ignore a particular scenario in a feature file in karate at runtime
//@CucumberOptions(tags = {"@regression" })   // To run all the tag with @regression
public class Create_Alert_Runner1 {
}
