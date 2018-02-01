<#escape x as x?html>
<#setting number_format="#####.##">
<#include "/WEB-INF/pages/inc/header.ftl">
<title><@s.text name='manage.metadata.keywords.title'/></title>
<#include "/WEB-INF/pages/macros/metadata.ftl"/>
 <#assign sideMenuEml=true />
 <#assign currentMenu="manage"/>
<script type="text/javascript">
$(document).ready(function(){
	initHelp();
});
</script>
<#include "/WEB-INF/pages/inc/menu.ftl">
<#include "/WEB-INF/pages/macros/forms.ftl"/>


<!-- <h3><span class="superscript"><@s.text name='manage.overview.title.label'/></span>
    <a href="resource.do?r=${resource.shortname}" title="${resource.title!resource.shortname}">${resource.title!resource.shortname}</a>
</h3> -->
<a href="resource.do?r=${resource.shortname}" title="${resource.title!resource.shortname}"><i class="fa fa-backward"></i> Overview</a>
<div class="col-md-12">
<h3><@s.text name='manage.metadata.keywords.title'/></h3>
<form class="topForm" action="metadata-${section}.do" method="post">
    <p><@s.text name='manage.metadata.keywords.intro'/></p>
	<div id="items">
		<#list eml.keywords as item>
			<div id="item-${item_index}" class="item">
			  <div class="newline"></div>
			  <div class="right">
				  <a id="removeLink-${item_index}" class="removeLink" href="">[ <@s.text name='manage.metadata.removethis'/> <@s.text name='manage.metadata.keywords.item'/> ]</a>
		    </div>
        <@input name="eml.keywords[${item_index}].keywordThesaurus" i18nkey="eml.keywords.keywordThesaurus" help="i18n" requiredField=true />
        <#-- work around for a bug that converts empty keywordsList into string "null". In this case, nothing should appear in text box -->
        <#-- TODO: remove check for "null" after fixing problem in gbif-metadata-profile -->
        <#assign keywordList = item.keywordsString />
        <#if keywordList?has_content && keywordList?lower_case == "null">
          <@text value="" name="eml.keywords[${item_index}].keywordsString" i18nkey="eml.keywords.keywordsString" help="i18n" requiredField=true/>
        <#else>
          <@text name="eml.keywords[${item_index}].keywordsString" i18nkey="eml.keywords.keywordsString" help="i18n" requiredField=true/>
        </#if>
		  </div>
		</#list>
	</div>
	<div class="addNew"><a id="plus" href=""><@s.text name='manage.metadata.addnew'/> <@s.text name='manage.metadata.keywords.item'/></a></div>
	<div class="buttons">
		<@s.submit cssClass="button btn btn-default" name="save" key="button.save" />
		<@s.submit cssClass="button btn btn-danger" name="cancel" key="button.cancel" />
	</div>
	<!-- internal parameter -->
	<input name="r" type="hidden" value="${resource.shortname}" />
</form>
</div>
<div id="baseItem" class="item" style="display:none;">
	<div class="right">
      <a id="removeLink" class="removeLink" href="">[ <@s.text name='manage.metadata.removethis'/> <@s.text name='manage.metadata.keywords.item'/> ]</a>
    </div>
	<@input name="keywordThesaurus" i18nkey="eml.keywords.keywordThesaurus" help="i18n" requiredField=true/>
	<@text name="keywordsString" i18nkey="eml.keywords.keywordsString" help="i18n" requiredField=true/>
</div>
<#include "/WEB-INF/pages/inc/footer.ftl">
</#escape>
