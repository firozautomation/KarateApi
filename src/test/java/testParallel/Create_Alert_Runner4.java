package testParallel;


import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
//@KarateOptions(features = "classpath:demo/read/post.feature")
//@KarateOptions(features = "classpath:animals/cats", tags = "~@ignore")
// this will run all feature files in 'animals/cats'
// except the ones tagged as @ignore



@CucumberOptions( tags = {"~@ignore"})  //to ignore a particular scenario in a feature file in karate at runtime
//@CucumberOptions(tags = {"@regression" })   // To run all the tag with @regression
@KarateOptions(features = "classpath:testParallel/get.feature", tags = {"~@ignore"})  // will ignore  get.feature

//@KarateOptions(features = "classpath:testParallel/get.feature")  // will run only one get.feature
public class Create_Alert_Runner4 {
}
