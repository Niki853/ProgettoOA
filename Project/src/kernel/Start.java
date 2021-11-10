package kernel;

import java.nio.file.Path;
import java.util.List;

public class Start
{
	public static void main(String[] args)
	{
		//String pathmps = ".\\MPS\\Instance1.mps";
		/*String pathmps = args[0];
		String pathlog = args[1];
		String pathConfig = args[2];*/
		//System.out.println("Hi");
		//System.out.println(Path.of(".\\"));
		String pathmps = "C:\\Users\\Xavier\\Documents\\DataSet\\testMps.mps";
		String pathlog = ".\\log";
		String pathConfig = "C:\\Users\\Xavier\\Documents\\XP - Asus\\Università\\Magistrale 1 anno\\Optimization Algorithms\\Project\\config.txt";

		Configuration config = ConfigurationReader.read(pathConfig);
		KernelSearch ks = new KernelSearch(pathmps, pathlog, config);
		ks.start();
		
		List<List<Double>> objValues = ks.getObjValues();	
	}
}