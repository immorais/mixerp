﻿<%--
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
along with MixERP.  If not, see <http://www.gnu.org/licenses />.
--%>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopSellingProductOfAllTimeCurrentWidget.ascx.cs" Inherits="MixERP.Net.Core.Modules.Sales.Widgets.TopSellingProductOfAllTimeCurrentWidget" %>

<div class="eight wide column widget" id="TopSellingProductOfAllTimeCurrentWidget">
    <div class="ui attached segment">
        <div class="ui left floated column">
        <div class="ui header">
            <asp:Literal runat="server" ID="TopSellingProductsLiteral"/>
        </div>
        </div>
        <div class="right floated column">
            <i class="expand disabled icon"></i>
            <i class="move icon"></i>
            <i class="help icon"></i>
            <i class="close icon" onclick="$(this).closest('.widget').remove();"></i>
        </div>
    </div>
    <div class="ui attached segment">
        <asp:GridView runat="server" ID="TopSellingProductsOfAllTimeGridView" DataKeyNames="id" AutoGenerateColumns="False" CssClass="hidden">
            <Columns>
                <asp:BoundField HeaderText="ItemName" DataField="item_name" />
                <asp:BoundField HeaderText="TotalSales" DataField="total_sales" />
            </Columns>
        </asp:GridView>
        <canvas id="top-selling-products-canvas" width="500" height="180"></canvas>
        <div id="top-selling-products-legend"></div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        preparePieChart('TopSellingProductsOfAllTimeGridView', 'top-selling-products-canvas', 'top-selling-products-legend', 'pie', true);
    });
</script>