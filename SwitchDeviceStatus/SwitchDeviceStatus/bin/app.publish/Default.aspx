<%@ Page Title="Switch Device Down Status Count" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SwitchDeviceStatus._Default" %>
<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="padding: 10px 15px 30px;">
        <div class="col-md-1" style="text-align: left; padding-right: 3px;">
            <dx:ASPxLabel ID="lblDatumOd" runat="server" Text="Datum od" Font-Bold="true" Font-Size="Small"></dx:ASPxLabel>
        </div>
        <div class="col-md-2">
            <dx:ASPxDateEdit ID="datumOd" runat="server" Font-Size="Small" EditFormat="Custom" EditFormatString="dd.MM.yyyy" Width="170px"></dx:ASPxDateEdit>
        </div>
    </div>
    <div class="row" style="padding: 5px 15px;">
        <div class="col-md-1" style="text-align: left; padding-right: 3px;">
            <dx:ASPxLabel ID="lblDatumDo" runat="server" Text="Datum do" Font-Bold="true" Font-Size="Small"></dx:ASPxLabel>
        </div>
        <div class="col-md-2">
            <dx:ASPxDateEdit ID="datumDo" runat="server" Font-Size="Small" EditFormat="Custom" EditFormatString="dd.MM.yyyy" Width="170px"></dx:ASPxDateEdit>
        </div>
    </div>
    <div class="row" style="padding: 5px 15px;">
        <div class="col-md-1" style="padding-top: 5px;"></div>
        <asp:UpdatePanel ID="updPanPrikazi" runat="server">
            <ContentTemplate>
               <div class="col-md-2">
                    <asp:Button ID="btnPrikazi" runat="server" Text="Prikaži" Font-Size="Small" OnClick="btnPrikazi_Click" Height="31px" Width="200px" CssClass="btn btn-primary btn-large" Style="margin-bottom: 10px;" />
                    <asp:Button ID="btnPrikaziSvihGresaka" runat="server" Text="Prikaži ukupno grešaka" CssClass="btn btn-primary btn-large" Font-Size="Small" Height="31px" OnClick="btnPrikaziSveGreske_Click" Width="200px" Style="margin-top: 10px;" />
                    <asp:Button ID="btnPrikaziSve" runat="server" Text="Prikaži sve" CssClass="btn btn-primary btn-large" Font-Size="Small" Height="31px" OnClick="btnPrikaziSve_Click" Width="200px" Style="margin-top: 10px;" />
                    <asp:Button ID="btnPokreniProceduru" runat="server" Text="Pokreni Proceduru" CssClass="btn btn-primary btn-large" Font-Size="Small" Height="31px" OnClick="btnPokreniProceduru_Click" Width="200px" Style="margin-top: 10px;" />
               </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="row" style="padding: 5px 15px;">
        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Na kraj" Font-Size="Small" CssClass="linkToTop" AutoPostBack="false" Visible="True" UseSubmitBehavior="false" Cursor="pointer">
            <ClientSideEvents Click="function(s, e) { window.scrollTo(0,document.body.scrollHeight); }" />
        </dx:ASPxHyperLink>        
    </div>
    <div class="row" style="padding: 10px 15px;">
        <div class="col-md-12">
            <asp:UpdatePanel ID="updPanGrid" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <dx:ASPxGridView ID="gridSwitch" runat="server" EnableCallbacks="False" KeyFieldName="Id" AutoGenerateColumns="False" ClientInstanceName="grid1" Width="100%" OnCustomColumnDisplayText="gridSwitch_CustomColumnDisplayText">
                        <SettingsBehavior AllowSelectSingleRowOnly="True" AllowDragDrop="False" AllowSort="True" />
                        <SettingsPager PageSize="10" Visible="False" />
                        <Settings VerticalScrollableHeight="500" ShowGroupedColumns="True" />
                        <Styles>
                            <Header Font-Bold="True" Font-Names="Arial" Font-Size="Small" BackColor="#007bff" ForeColor="white" />
                            <Row Font-Size="Smaller" />
                            <Footer HorizontalAlign="Right" Font-Bold="true">
                                <Paddings PaddingRight="10px" />
                            </Footer>
                        </Styles>
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Id" FieldName="Id" Visible="false">
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Datum" FieldName="Datum" />
                            <dx:GridViewDataTextColumn Caption="Interface" FieldName="Interface" />
                            <dx:GridViewDataTextColumn Caption="Hostname" FieldName="Hostname" />
                            <dx:GridViewDataTextColumn Caption="IP adresa" FieldName="IP" />
                            <dx:GridViewDataTextColumn Caption="Broj grešaka" FieldName="NumberOfErrors" />
                        </Columns>
                    </dx:ASPxGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="row" style="padding: 5px 15px;">
        <dx:ASPxHyperLink ID="linkToTop" runat="server" Text="Na početak" Font-Size="Small" CssClass="linkToTop" AutoPostBack="false" Visible="True" UseSubmitBehavior="false" Cursor="pointer">
            <ClientSideEvents Click="function(s, e) { window.scroll(0,0); }" />
        </dx:ASPxHyperLink>        
    </div>
</asp:Content>
