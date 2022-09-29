using System;

namespace EXhibition.Models
{
    public class DBConnector : ExhibitionEntities
    {
        public DBConnector() : base()
        {
            base.Configuration.ProxyCreationEnabled = false;
            var str = Environment.GetEnvironmentVariable("SQL_CONNECTSTRING");
            Database.Connection.ConnectionString = str;
        }
    }
}