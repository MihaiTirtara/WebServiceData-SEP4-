using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
namespace SqlTest
{
    class Program
    {
        public static DateTime lastReading;
        public static bool added = false;
        static void Main(string[] args)
        {


            var mongoClient = new MongoClient(@"mongodb+srv://Llamaxy:865feeBA@test-i10mg.mongodb.net/test?retryWrites=true");

            var mongoDatabase = mongoClient.GetDatabase("Project");
            var PlantsCollection = mongoDatabase.GetCollection<PlantProfile>("PlantProfiles");
            var allPlants = PlantsCollection.AsQueryable<PlantProfile>().ToList();

            var plants = new List<PlantProfile>();

            allPlants.ForEach(plant => plants.Add(plant));

            Console.WriteLine(plants[0].CO2);

            SqlConnection SqlConnection;
            SqlCommand SqlCommand;


            string connection = @"Data Source = .\SQLEXPRESS ; Integrated Security = True;";
            SqlConnection = new SqlConnection(connection);


            try
            {
                
                for (int i = 0; i < plants.Count; i++)
                {

                    string Sql1 = "(SELECT MAX(ReadingDate) as 'lastReading' FROM Reading)";
                    SqlCommand set = new SqlCommand(Sql1, SqlConnection);
                    SqlDataReader d = set.ExecuteReader();

                    while (d.Read())
                        lastReading = d.GetDateTime(9);
                    if (lastReading == null)
                        lastReading = new DateTime(0);

                    int date = (plants[i].DateTime.CompareTo(lastReading));
                    if (date > 0)
                    {
                        added = true;
                        string sql2 = "Insert into [SEP].[dbo].[Readings] (PlantID, PlantName,Temperature,Light,CO2,Humidity,AmountOfWater,HoursSinceWatering,DateTime) values (@PlantID,@PlantName,@Temperature,@Light,@CO2,@Humidity,@AmountOfWater,@HoursSinceWatering,@DateTime);";
                        SqlCommand update = new SqlCommand(sql2, SqlConnection);
                        SqlConnection.Open();
                        SqlCommand = new SqlCommand(sql2, SqlConnection);
                        SqlCommand.Parameters.Add("@PlantID", SqlDbType.Int).Value = plants[i].PlantID;
                        SqlCommand.Parameters.Add("@PlantName", SqlDbType.NChar).Value = plants[i].PlantName;
                        SqlCommand.Parameters.Add("@Temperature", SqlDbType.Float).Value = plants[i].Temperature;
                        SqlCommand.Parameters.Add("@Light", SqlDbType.Float).Value = plants[i].Light;
                        SqlCommand.Parameters.Add("@CO2", SqlDbType.Float).Value = plants[i].CO2;
                        SqlCommand.Parameters.Add("@Humidity", SqlDbType.Float).Value = plants[i].Humidity;
                        SqlCommand.Parameters.Add("@AmountOfWater", SqlDbType.Float).Value = plants[i].AmountOfWater;
                        SqlCommand.Parameters.Add("@HoursSinceWatering", SqlDbType.Float).Value = plants[i].HoursSinceWatering;
                        SqlCommand.Parameters.Add("@DateTime", SqlDbType.DateTime).Value = plants[i].DateTime;
                        SqlCommand.ExecuteNonQuery();
                        SqlCommand.Dispose();
                        SqlConnection.Close();

                    }
                    else
                    {

                    
                    string sql = "Insert into [SEP].[dbo].[Readings] (PlantID, PlantName,Temperature,Light,CO2,Humidity,AmountOfWater,HoursSinceWatering,DateTime) values (@PlantID,@PlantName,@Temperature,@Light,@CO2,@Humidity,@AmountOfWater,@HoursSinceWatering,@DateTime);";
                    SqlConnection.Open();
                    SqlCommand = new SqlCommand(sql, SqlConnection);
                    SqlCommand.Parameters.Add("@PlantID", SqlDbType.Int).Value = plants[i].PlantID;
                    SqlCommand.Parameters.Add("@PlantName", SqlDbType.NChar).Value = plants[i].PlantName;
                    SqlCommand.Parameters.Add("@Temperature", SqlDbType.Float).Value = plants[i].Temperature;
                    SqlCommand.Parameters.Add("@Light", SqlDbType.Float).Value = plants[i].Light;
                    SqlCommand.Parameters.Add("@CO2", SqlDbType.Float).Value = plants[i].CO2;
                    SqlCommand.Parameters.Add("@Humidity", SqlDbType.Float).Value = plants[i].Humidity;
                    SqlCommand.Parameters.Add("@AmountOfWater", SqlDbType.Float).Value = plants[i].AmountOfWater;
                    SqlCommand.Parameters.Add("@HoursSinceWatering", SqlDbType.Float).Value = plants[i].HoursSinceWatering;
                    SqlCommand.Parameters.Add("@DateTime", SqlDbType.DateTime).Value = plants[i].DateTime;
                    SqlCommand.ExecuteNonQuery();
                    SqlCommand.Dispose();
                    SqlConnection.Close();

                    Console.WriteLine("Data added succesfully");
                    }

                }


            }
            catch (System.Exception)
            {

                throw;
            }


        }
    }
}
    