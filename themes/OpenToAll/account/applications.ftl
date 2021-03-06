<#import "template.ftl" as layout>
<@layout.mainLayout active='applications' bodyClass='applications'; section>

<div class="row">
    <div class="col-md-10">
        <h2>${msg("applicationsHtmlTitle")}</h2>
    </div>
</div>

<form action="${url.revokeClientUrl}" method="post">
    <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker?html}">
    <input type="hidden" id="referrer" name="referrer" value="${stateChecker?html}">

    <table class="table">
        <thead>
        <tr>
            <th>${msg("application")}</th>
            <th>${msg("availablePermissions")}</th>
            <th>${msg("grantedPermissions")}</th>
            <th>${msg("grantedPersonalInfo")}</th>
            <th>${msg("additionalGrants")}</th>
            <th class="text-right">${msg("action")}</th>
        </tr>
        </thead>
        <tbody>
            <#list applications.applications as application>
            <tr>
                <td>
                    <#if application.client.baseUrl??><a href="${application.client.baseUrl}"></#if>
                    <#if application.client.name??>${advancedMsg(application.client.name)}<#else>${application.client.clientId}</#if>
                    <#if application.client.baseUrl??></a></#if>
                </td>

                <td>
                    <#list application.realmRolesAvailable as role>
                        <#if role.description??>${advancedMsg(role.description)}<#else>${advancedMsg(role.name)}</#if>
                        <#if role_has_next>, </#if>
                    </#list>
                    <#list application.resourceRolesAvailable?keys as resource>
                        <#if application.realmRolesAvailable?has_content>, </#if>
                        <#list application.resourceRolesAvailable[resource] as clientRole>
                            <#if clientRole.roleDescription??>${advancedMsg(clientRole.roleDescription)}<#else>${advancedMsg(clientRole.roleName)}</#if>
                        ${msg("inResource")}
                            <strong><#if clientRole.clientName??>${advancedMsg(clientRole.clientName)}<#else>${clientRole.clientId}</#if></strong>
                            <#if clientRole_has_next>, </#if>
                        </#list>
                    </#list>
                </td>

                <td>
                    <#if application.client.consentRequired>
                        <#list application.realmRolesGranted as role>
                            <#if role.description??>${advancedMsg(role.description)}<#else>${advancedMsg(role.name)}</#if>
                            <#if role_has_next>, </#if>
                        </#list>
                        <#list application.resourceRolesGranted?keys as resource>
                            <#if application.realmRolesGranted?has_content>, </#if>
                            <#list application.resourceRolesGranted[resource] as clientRole>
                                <#if clientRole.roleDescription??>${advancedMsg(clientRole.roleDescription)}<#else>${advancedMsg(clientRole.roleName)}</#if>
                            ${msg("inResource")}
                                <strong><#if clientRole.clientName??>${advancedMsg(clientRole.clientName)}<#else>${clientRole.clientId}</#if></strong>
                                <#if clientRole_has_next>, </#if>
                            </#list>
                        </#list>
                    <#else>
                        <strong>${msg("fullAccess")}</strong>
                    </#if>
                </td>

                <td>
                    <#if application.client.consentRequired>
                        <#list application.claimsGranted as claim>
                        ${advancedMsg(claim)}<#if claim_has_next>, </#if>
                        </#list>
                    <#else>
                        <strong>${msg("fullAccess")}</strong>
                    </#if>
                </td>

                <td>
                    <#list application.additionalGrants as grant>
                    ${advancedMsg(grant)}<#if grant_has_next>, </#if>
                    </#list>
                </td>

                <td class="td-actions text-right">
                    <#if (application.client.consentRequired && application.claimsGranted?has_content) || application.additionalGrants?has_content>
                        <button type="submit" class="btn btn-danger btn-simple btn-xs"
                                id='revoke-${application.client.clientId}'
                                name='clientId' value="${application.client.id}" rel="tooltip" title="${msg("revoke")}">
                            <i class="fa fa-times"></i>
                        </button>
                    </#if>
                </td>
            </tr>
            </#list>
        </tbody>
    </table>
</form>

</@layout.mainLayout>