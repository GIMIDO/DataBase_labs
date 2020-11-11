#pragma checksum "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "dd9b17850182ee818deca6757212895625f3c77a"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Table_GetSources), @"mvc.1.0.view", @"/Views/Table/GetSources.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\_ViewImports.cshtml"
using WebApp;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\_ViewImports.cshtml"
using WebApp.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"dd9b17850182ee818deca6757212895625f3c77a", @"/Views/Table/GetSources.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"fc48f17eb9bac3476d8060730298bf398eb2fa5e", @"/Views/_ViewImports.cshtml")]
    public class Views_Table_GetSources : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List<WebApp.Models.SourceViewModel>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
  
    ViewBag.Title = "Таблица источников";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n");
#nullable restore
#line 6 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
Write(ViewBag.Title);

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
:
<div>
    <table border=""1"">
        <thead>
            <tr>
                <td>
                    Id
                </td>
                <td>
                    Название организации
                </td>
                <td>
                    Фонд организации
                </td>
                <td>
                    Название вышестоящей организации
                </td>
                <td>
                    Фонд вышестоящей организации
                </td>
                <td>
                    Фонд Министерства Энергетики
                </td>
                <td>
                    Республиканский бюджет
                </td>
                <td>
                    Местный бюджет
                </td>
            </tr>
        </thead>
");
#nullable restore
#line 38 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
         foreach (var elem in Model)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <tr>\r\n                <td>\r\n                    ");
#nullable restore
#line 42 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
               Write(elem.Id);

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n                <td>\r\n                    ");
#nullable restore
#line 45 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
               Write(elem.OrganizationName);

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n                <td>\r\n                    ");
#nullable restore
#line 48 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
               Write(elem.OrganizationFunds);

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n                <td>\r\n                    ");
#nullable restore
#line 51 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
               Write(elem.SuperiorOrganizationName);

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n                <td>\r\n                    ");
#nullable restore
#line 54 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
               Write(elem.SuperiorOrganizationFunds);

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n                <td>\r\n                    ");
#nullable restore
#line 57 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
               Write(elem.MinistryOfEnergyFund);

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n                <td>\r\n                    ");
#nullable restore
#line 60 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
               Write(elem.RepublicBudget);

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n                <td>\r\n                    ");
#nullable restore
#line 63 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
               Write(elem.LocalBudget);

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                </td>\r\n            </tr>\r\n");
#nullable restore
#line 66 "C:\Users\GIMIDO\Downloads\WebApp\WebApp\WebApp\Views\Table\GetSources.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </table>\r\n</div>\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List<WebApp.Models.SourceViewModel>> Html { get; private set; }
    }
}
#pragma warning restore 1591