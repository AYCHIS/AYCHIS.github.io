<#include "/WEB-INF/pages/inc/header.ftl">
 <title><@s.text name="title"/></title>
<script type="text/javascript">
	$(document).ready(function(){
		initHelp();
	});
</script>

<#assign currentMenu = "admin"/>
<#include "/WEB-INF/pages/inc/menu.ftl">
<div class="grid_18 suffix_6">
<table id="admintable">
	<@s.form cssClass="topForm" action="publishAll.do" method="post" namespace="" includeContext="false">
	<tr>
	  <td>
		<a href="${baseURL}/admin/config.do"><!-- <img src="${baseURL}/images/icons/settings.png" /></a> --><i class="fa fa-cog fa-3x"></i></a>
	  </td>
	  <td>
	  <@s.text name="admin.home.editConfig"/>
	  <i class="infoImg fa fa-info-circle fa-lg"> </i>
	  <div class="info"><@s.text name="admin.home.publishResources.help"/></div>
	  <@s.submit cssClass="button btn btn-default" name="publishAll" key="admin.home.publishResources"/>
	  </td>
	</tr>
	  </@s.form>
	<tr>
	  <td>
		<a href="${baseURL}/admin/users.do"><!-- <img src="${baseURL}/images/icons/users.png" /></a> --><i class="fa fa-user-circle-o fa-3x"></i></a>
	  </td>
	  <td colspan="2">
		<@s.text name="admin.home.manageUsers"/>
	  </td>
	</tr>
	<tr>
	  <td>
		<a href="${baseURL}/admin/registration.do"><!-- <img src="${baseURL}/images/icons/registry.png" /></a> --><i class="fa fa-sign-in fa-3x"></i></a>
	  </td>
	  <td colspan="2">
		<@s.text name="admin.home.editRegistration"/>
	  </td>
	</tr>
	<tr>
	  <td>
		  <#if registeredIpt?has_content>
				<a href="${baseURL}/admin/organisations.do"><!-- <img src="${baseURL}/images/icons/organisation.png" /></a> --><i class="fa fa-building-o fa-3x"></i></a>
		  <#else>
				<!-- <img src="${baseURL}/images/icons/organisation-grey.png" /> --><i class="fa fa-building-o fa-3x" style="color:#999"></i>
		  </#if>
	  </td>
	  <td colspan="2">
		<@s.text name="admin.home.editOrganisations"/>
		<#if !registeredIpt?has_content><div id="un-registered"><@s.text name="admin.home.editOrganisations.disabled"/></div></#if>
	  </td>
	</tr>

	<tr>
	  <td>
		<a href="${baseURL}/admin/extensions.do"><!-- <img src="${baseURL}/images/icons/extensions.png" /></a> --><i class="fa fa-cubes fa-3x"></i></a>
	  </td>
	  <td colspan="2">
		<@s.text name="admin.home.manageExtensions"/>
	  </td>
	</tr>
	<tr>
	  <td>
		<a href="${baseURL}/admin/logs.do"><!-- <img src="${baseURL}/images/icons/announcement.png" /></a> --><i class="fa fa-history fa-3x"></i></a>
	  </td>
	  <td colspan="2">
		<@s.text name="admin.home.manageLogs"/>
	  </td>
	</tr>
</table>
</div>
</div>
<#include "/WEB-INF/pages/inc/footer.ftl">
