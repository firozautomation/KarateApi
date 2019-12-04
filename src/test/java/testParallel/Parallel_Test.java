package testParallel;


import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.Assert.*;
import org.junit.Test;

public class Parallel_Test {

    @Test
    public void testParallel() {
        Results results = Runner.parallel(getClass(), 5, "target/surefire-reports");
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }
}
