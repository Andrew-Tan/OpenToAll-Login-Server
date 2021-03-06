<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("emailLinkIdpTitle", idpAlias)}
    <#elseif section = "header">
        ${msg("emailLinkIdpTitle", idpAlias)}
    <#elseif section = "form">
    <div class="form">
        <div class="content">
            <div class="form-group text-center">
                <p id="instruction1" class="text-primary">
                ${msg("emailLinkIdp1", idpAlias, brokerContext.username, realm.displayName)}
                </p>
                <p id="instruction2" class="text-primary">
                ${msg("emailLinkIdp2")} <a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailLinkIdp3")}
                </p>
                <p id="instruction3" class="text-primary">
                ${msg("emailLinkIdp4")} <a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailLinkIdp5")}
                </p>
            </div>
        </div>
    </div>
    </#if>
</@layout.registrationLayout>