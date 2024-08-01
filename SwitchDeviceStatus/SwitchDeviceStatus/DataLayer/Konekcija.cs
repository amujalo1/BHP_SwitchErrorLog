using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwitchDeviceStatus.DataLayer
{
    public static class Konekcija
    {
        public static SolarWindsDataContext KreirajKonekciju()
        {
            SolarWindsDataContext ctx = null;

            try
            {
                ctx = new SolarWindsDataContext(GlobalniParametri.SolarWinds);
                ctx.CommandTimeout = 360;
            }
            catch (Exception)
            {
            }

            return ctx;
        }
    }
}