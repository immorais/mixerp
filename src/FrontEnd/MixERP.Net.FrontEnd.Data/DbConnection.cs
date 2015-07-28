﻿/********************************************************************************
Copyright (C) MixERP Inc. (http://mixof.org).

This file is part of MixERP.

MixERP is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, version 2 of the License.


MixERP is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with MixERP.  If not, see <http://www.gnu.org/licenses/>.
***********************************************************************************/

using MixERP.Net.Common;
using MixERP.Net.Common.Helpers;
using Npgsql;

namespace MixERP.Net.FrontEnd.Data
{
    public static class DbConnection
    {
        public static string GetConnectionString()
        {
            string host = ConfigurationHelper.GetDbServerParameter("Server");
            const string database = "postgres";
            string userId = ConfigurationHelper.GetDbServerParameter("UserId");
            string password = ConfigurationHelper.GetDbServerParameter("Password");
            int port = Conversion.TryCastInteger(ConfigurationHelper.GetDbServerParameter("Port"));

            return GetConnectionString(host, database, userId, password, port);
        }

        public static string GetConnectionString(string host, string database, string username, string password,
            int port)
        {
            CatalogHelper.ValidateCatalog(database);

            NpgsqlConnectionStringBuilder connectionStringBuilder = new NpgsqlConnectionStringBuilder
            {
                Host = host,
                Database = database,
                UserName = username,
                Password = password,
                Port = port,
                SyncNotification = true,
                Pooling = true,
                SSL = true,
                SslMode = SslMode.Prefer,
                MinPoolSize = 10,
                MaxPoolSize = 100,
                ApplicationName = "MixERP"
            };

            return connectionStringBuilder.ConnectionString;
        }
    }
}