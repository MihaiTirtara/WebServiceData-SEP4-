import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.Timer;
import java.util.TimerTask;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class Transfer extends TimerTask
{
	private MongoDatabase database;
	private Timestamp lastReading ;
	private boolean added = false;

	@Override
	public void run() {
		try {
			added = false;
			MongoClientURI uri = new MongoClientURI(
					"mongodb+srv://Llamaxy:865feeBA@test-i10mg.mongodb.net/test?retryWrites=true");


			MongoClient mongoClient = new MongoClient(uri);
			database = mongoClient.getDatabase("Project");

		
			String url ="jdbc:sqlserver:// DESKTOP-13H0DEK\\SQLEXPRESS;databaseName=SEP;integratedSecurity=true";
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager
					.getConnection(url);

			
			Statement sta1 = conn.createStatement();
			String Sql1 = "(SELECT MAX(ReadingDate) as 'lastReading' FROM SEP.dbo.Readings)";
			ResultSet set = sta1.executeQuery(Sql1);
			while (set.next())
				lastReading = set.getTimestamp("lastReading");
			if(lastReading == null)
				lastReading =new Timestamp(0);
			MongoCollection<Document> collection = database.getCollection("PlantProfile");

			
			FindIterable<Document> iterDoc = collection.find();
			
			Iterator it = iterDoc.iterator();

			while (it.hasNext()) {
				Document document = (Document) it.next();
				
				

				int plantId = (int) document.get("PlantID");
				String plantName = (String) document.get("PlantName");
				double temperature = (double) document.get("Temperature");
				double humidity = (double) document.get("Humidity");
				double CO2 = (double) document.get("CO2");
				double light = (double) document.get("Light");
				double amountOfWater = (double) document.get("AmountOfWater");
				double HoursSinceWatering = (double) document.get("HoursSinceWatering");
				
				Timestamp date = new Timestamp(((Date) document.get("DateTime")).getTime() - 2*60 * 60 * 1000);

				if (date.compareTo(lastReading) > 0) {
				
					added = true;

					Statement sta2 = conn.createStatement();
					String Sql2 = "INSERT INTO SEP.dbo.Readings VALUES (" + plantId + "," + plantName + "," + temperature + ",'" + humidity + "', '" + CO2 + "', " + light + "', '" + amountOfWater +  ",'"  + HoursSinceWatering + " );";
					sta2.execute(Sql2);

				}

			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		if (added)
			System.out.println("New documents added to sql server");
		else
			System.out.println("No new documents added to the sql server");
	}

	public static void main(String args[]) {
		TimerTask timerTask = new Transfer();
	
		Timer timer = new Timer(true);

		timer.scheduleAtFixedRate(timerTask, 0, 30 * 1000);
		System.out.println("TimerTask started");
		
		try {
			Thread.sleep(500000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		timer.cancel();
		System.out.println("TimerTask cancelled");
		try {
			Thread.sleep(40000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}
