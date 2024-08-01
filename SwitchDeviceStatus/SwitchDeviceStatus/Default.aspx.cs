using SwitchDeviceStatus.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SwitchDeviceStatus
{
    public partial class _Default : Page
    {
        SolarWindsDataContext ctx = Konekcija.KreirajKonekciju();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    datumOd.Value = DateTime.Now.AddDays(-1);
                    datumDo.Value = DateTime.Now;

                    List<GetAllErrorCountsResult> statusi = ctx.GetAllErrorCounts(Convert.ToDateTime(datumOd.Value), Convert.ToDateTime(datumDo.Value)).ToList();
                    Session["Statusi"] = statusi;
                    gridSwitch.DataSource = statusi;

                    // Resetuj prethodno grupisanje

                    // Grupisanje po više kolona
                    

                    gridSwitch.DataBind();

                    // Postavi veličinu stranice
                    gridSwitch.SettingsPager.PageSize = 20;
                    gridSwitch.Settings.VerticalScrollableHeight = 500;
                }
                catch (Exception ex)
                {
                    // Loguj grešku
                    Response.Write($"Greška pri učitavanju podataka: {ex.Message}");
                }
            }
            else
            {
                List<GetAllErrorCountsResult> statusi = Session["Statusi"] as List<GetAllErrorCountsResult>;
                if (statusi != null)
                {
                    gridSwitch.DataSource = statusi;
                    gridSwitch.DataBind();
                    updPanGrid.Update();
                }
            }
        }

        
        protected void gridSwitch_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName == "Datum" && e.Value != null)
            {
                try
                {
                    DateTime datum = Convert.ToDateTime(e.Value);
                    e.DisplayText = datum.ToString("dd/MM/yyyy"); 
                }
                catch (FormatException)
                {
                    e.DisplayText = "Nepoznat datum"; 
                }
            }

            if (e.Column.FieldName == "NumberOfErrors" && e.Value != null)
            {
                try
                {
                    int brojGrešaka = Convert.ToInt32(e.Value);
                    e.DisplayText = brojGrešaka.ToString("N0"); 
                }
                catch (FormatException)
                {
                    e.DisplayText = "Nepoznat broj grešaka"; 
                }
            }

            if (e.Column.FieldName == "Interface" && e.Value != null)
            {
                e.DisplayText = e.Value.ToString(); 
            }
            if (e.Column.FieldName == "Hostname" && e.Value != null)
            {
                e.DisplayText = e.Value.ToString(); 
            }
            if (e.Column.FieldName == "IP" && e.Value != null)
            {
                e.DisplayText = e.Value.ToString(); 
            }
        }
            protected void btnPrikazi_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime datumOdDate = Convert.ToDateTime(datumOd.Value);
                DateTime datumDoDate = Convert.ToDateTime(datumDo.Value);
                List<GetAllErrorCountsResult> statusi = ctx.GetAllErrorCounts(Convert.ToDateTime(datumOd.Value), Convert.ToDateTime(datumDo.Value)).ToList();
                Session["Statusi"] = statusi;
                gridSwitch.DataSource = statusi;

                gridSwitch.DataBind();

                gridSwitch.SettingsPager.PageSize = 20; // Na primer, postavi standardnu veličinu stranice
                gridSwitch.Settings.VerticalScrollableHeight = 500; // Standardna visina
                gridSwitch.CollapseAll();

                updPanGrid.Update();
            }
            catch (Exception ex)
            {
                // Loguj grešku i obavesti korisnika
                // LogError(ex); // Ako imaš metod za logovanje grešaka
                Response.Write($"Greška pri prikazivanju podataka: {ex.Message}");
            }
        }
        protected void btnPrikaziSve_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime minDate = DateTime.MinValue; // Minimal date
                DateTime maxDate = DateTime.MaxValue; // Maximal date
                DateTime datumOdDate = minDate;
                DateTime datumDoDate = maxDate;

                List<GetAllErrorCountsResult> statusi = ctx.GetAllErrorCounts(datumOdDate, datumDoDate).ToList();
                Session["Statusi"] = statusi;
                gridSwitch.DataSource = statusi;

                gridSwitch.DataBind();

                gridSwitch.SettingsPager.PageSize = 20; // Set default page size
                gridSwitch.Settings.VerticalScrollableHeight = 500; // Standard height
                gridSwitch.CollapseAll();

                updPanGrid.Update();
            }
            catch (Exception ex)
            {
                // Log the error and inform the user
                // LogError(ex); // If you have a method for logging errors
                Response.Write($"Error displaying data: {ex.Message}");
            }
        }
        protected void btnPrikaziSveGreske_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime datumOdDate = Convert.ToDateTime(datumOd.Value);
                DateTime datumDoDate = Convert.ToDateTime(datumDo.Value);
                List<GetErrorCountsGroupedResult> statusi = ctx.GetErrorCountsGrouped(Convert.ToDateTime(datumOd.Value), Convert.ToDateTime(datumDo.Value)).ToList();
                Session["Statusi"] = statusi;
                gridSwitch.DataSource = statusi;

                gridSwitch.DataBind();

                gridSwitch.SettingsPager.PageSize = 20; // Na primer, postavi standardnu veličinu stranice
                gridSwitch.Settings.VerticalScrollableHeight = 500; // Standardna visina
                gridSwitch.CollapseAll();

                updPanGrid.Update();
            }
            catch (Exception ex)
            {
                // Loguj grešku i obavesti korisnika
                // LogError(ex); // Ako imaš metod za logovanje grešaka
                Response.Write($"Greška pri prikazivanju podataka: {ex.Message}");
            }
        }
        protected void btnPokreniProceduru_Click(object sender, EventArgs e)
        {
            try
            {
                ctx.InsertErrorCountsTemp();
            }
            catch (Exception ex)
            {
                Response.Write($"Greška pri pokretanju procedure: {ex.Message}");
            }
        }

    }
}
