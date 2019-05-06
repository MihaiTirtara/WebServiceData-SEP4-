﻿using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebServiceData.Models
{
    public class PlantProfile
    {
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }

        [BsonRepresentation(BsonType.Int32)]
        public int PlantID
        {
            get; set;
        }

        [BsonRepresentation(BsonType.String)]
        public string PlantName
        {
            get; set;
        }

        [BsonRepresentation(BsonType.Double)]
        public double Temperature
        {
            get; set;
        }

        [BsonRepresentation(BsonType.Double)]
        public double CO2
        {
            get; set;
        }

        [BsonRepresentation(BsonType.Double)]
        public double Humidity
        {
            get; set;
        }

        [BsonRepresentation(BsonType.Double)]
        public double AmountOfWater
        {
            get; set;
        }

        [BsonRepresentation(BsonType.Double)]
        public double HoursSinceWatering
        {
            get; set;
        }

        [BsonRepresentation(BsonType.DateTime)]
        public DateTime DateTime
        {
            get; set;
        }

        [BsonRepresentation(BsonType.Int32)]
        public int Light
        {
            get; set;
        }
        public PlantProfile(int plantID, string plantName, double temperature, double CO2, double humidity, double amountOfWater, double hoursSinceWatering, int light, DateTime dateTime)
        {
            this.PlantID = plantID;
            this.PlantName = plantName;
            this.Temperature=temperature;
            this.CO2 = CO2;
            this.Humidity = humidity;
            this.AmountOfWater = amountOfWater;
            this.HoursSinceWatering = hoursSinceWatering;
            this.Light = light;
            this.DateTime = dateTime;
           
        }

      
    }
}
