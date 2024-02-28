package ui_features;
import com.intuit.karate.junit5.Karate;
//import com.intuit.karate.junit5.Karate.Test;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.KarateOptions;
import net.masterthought.cucumber.ReportBuilder;
import net.masterthought.cucumber.Configuration;
import static org.junit.jupiter.api.Assertions.*;
import java.io.File;
import java.util.Collection;
import java.util.List;
import java.util.ArrayList;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.*;
import org.junit.jupiter.engine.*;
import org.junit.jupiter.api.Test;


@SuppressWarnings("deprecation")
@KarateOptions(tags= {"~@ignore"}, features= "classpath:")
public class UI_TestRunner {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:api_features").parallel(20);
        // Results results = Runner.parallel(getClass(),1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
        generateReport(results.getReportDir());
    }
      
    public static void generateReport(String KarateOututPath)
    {  	
    	Collection <File> jsonFiles=FileUtils.listFiles(new File(KarateOututPath), new String[] {"json"}, true);
        final List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
    	jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
    	
//    	for(File file: jsonFiles)
//        {
//            jsonPaths.add(file.getAbsolutePath());
//        }
        Configuration config = new Configuration(new File ("target"), "demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    
    }
}

/*	public class TestRunner {
	
		@Test
		public void runTest1() {
			Karate.run("getAPI").relativeTo(getClass());		
		}
	
	    @Karate.Test
		Karate testSample1() {
		    return Karate.run("json").relativeTo(getClass());
		}
		  
	   @Karate.Test
		Karate testSample() {
		    //return Karate.run("classpath:api_features/json.feature");	
		      return Karate.run("src/test/java/api_features/json.feature");
	    }	
	
	}
*/
  
 //https://github.com/karatelabs/karate#junit-5
 // mvn test
