<#escape x as x?html>
<#include "/WEB-INF/pages/inc/header.ftl">
	<title><@s.text name='manage.mapping.title'/></title>
<script type="text/javascript">
$(document).ready(function(){
	initHelp();
});   
</script>

<#assign currentMenu = "manage"/>
<#include "/WEB-INF/pages/inc/menu.ftl">
<#include "/WEB-INF/pages/macros/forms.ftl"/>

<div class="grid_17 suffix_7">
<form class="topForm" action="mapping.do" method="post">
    <!-- <h1>${mapping.extension.title}</h1> -->
  <div class="headline text-center">
    <h3>${mapping.extension.title}</h3>
  </div>
    <p>${mapping.extension.description}</p>
    <#if mapping.extension.link?has_content>
    <p><@s.text name="basic.link"/>: <a href="${mapping.extension.link}">${mapping.extension.link}</a></p>
    </#if>
  	<input type="hidden" name="r" value="${resource.shortname}" />
  	<input type="hidden" name="id" value="${mapping.extension.rowType}" />
  	<input type="hidden" name="mid" value="${mid!}" />
  	<input id="showAllValue" type="hidden" name="showAll" value="${Parameters.showAll!"true"}" />

    <h3><@s.text name='manage.mapping.source'/></h3>
    <p><@s.text name='manage.mapping.source.help'/></p>

    <@selectList name="source" options=resource.sources objValue="name" objTitle="name" i18nkey="manage.mapping.source" />

    <div class="row">
      <div class="col-lg-12">
        <div class="userManageButtons">
     	    <@s.submit cssClass="btn btn-default" name="save" key="button.save"/>
     	    <@s.submit cssClass="btn btn-default" name="cancel" key="button.cancel"/>
        </div>
      </div>
    </div>

</form>
</div>

<#include "/WEB-INF/pages/inc/footer.ftl">
</#escape>
