<#escape x as x?html>
<#include "/WEB-INF/pages/inc/header.ftl">
	<title><@s.text name='manage.source.title'/></title>
	<script type="text/javascript" src="${baseURL}/js/jconfirmation.jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	initHelp();
	$('.confirm').jConfirmAction({question : "<@s.text name="manage.source.confirmation.message"/>", yesAnswer : "<@s.text name="basic.yes"/>", cancelAnswer : "<@s.text name="basic.no"/>"});
	$("#peekBtn").click(function(e) {
		e.preventDefault();
		$("#modalcontent").load("peek.do?r=${resource.shortname}&id=${id!}");
		$("#modalbox").show();
    });
	$("#modalbox").click(function(e) {
		e.preventDefault();
		$("#modalbox").hide();
    });
});   
</script>	
 <#assign currentMenu = "manage"/>
<#include "/WEB-INF/pages/inc/menu.ftl">
<#include "/WEB-INF/pages/macros/forms.ftl"/>
<div class="grid_18 suffix_6" style="display:block;float:none">
<!-- <h1><span class="superscript"><@s.text name='manage.overview.title.label'/></span>
    <a href="resource.do?r=${resource.shortname}" title="${resource.title!resource.shortname}">${resource.title!resource.shortname}</a>
</h1> -->
  <div class="headline text-center">
    <h3>${resource.title!resource.shortname}</h3>
  </div>
</div>
<div class="grid_24">
<form class="topForm" action="source.do" method="post">
<h2 class="subTitle"><@s.text name='manage.source.title'/></h2>
  	<input type="hidden" name="r" value="${resource.shortname}" />
  	<input type="hidden" name="id" value="${id!}" />  	

    <#if source??>
      <!-- <p><@s.text name='manage.source.intro'/></p> -->
      <div class="clearfix">
        <div class="row">
          <div class="col-md-6">
            <@input name="source.name" help="i18n" disabled=id?has_content/>
          </div>
          <div class="col-md-6">
            <div class="detailsSource">
              <table id="source-properties">
                <tr><th><@s.text name='manage.source.readable'/></th><td><#if source.readable><i style="color:#35a948" class="fa fa-check"></i><#else><i style="color:#ff003b" class="fa fa-exclamation-triangle"></i> ${problem!}</#if></td></tr>
                <tr><th><@s.text name='manage.source.columns'/></th><td>${source.getColumns()}</td></tr>
                <#if source.fieldsTerminatedBy?has_content>
                  <!-- <tr><th><@s.text name='manage.source.file'/></th><td>${(source.file.getAbsolutePath())!}</td></tr> -->
                  <tr><th><@s.text name='manage.source.size'/></th><td>${source.fileSizeFormatted!"???"}</td></tr>
                  <tr><th><@s.text name='manage.source.rows'/></th><td>${source.rows!"???"}</td></tr>
                  <!-- <tr><th><@s.text name='manage.source.modified'/></th><td>${(source.lastModified?datetime?string.medium)!}</td></tr> -->
                  <!-- <#if (logExists)>
                      <tr><th><@s.text name='manage.source.source.log'/></th><td><a href="${baseURL}/sourcelog.do?r=${resource.shortname}&s=${source.name}"><@s.text name='manage.source.download'/></a></td></tr>
                  </#if> -->
                <#else>
                </#if>
              </table>

              <div class="buttons" style="min-width:300px">
                <@s.submit cssClass="btn btn-default" name="analyze" key="button.analyze"/>
                <button id="peekBtn" class="btn btn-default">View source data</button>
              </div>
            </div>
          </div>
        </div>  
      </div>

      <#-- inputs used by multiple source types -->
      <#macro multivalue>
        <@input name="source.multiValueFieldsDelimitedBy" help="i18n" helpOptions={"|":"[ | ] Pipe",";":"[ ; ] Semicolon",",":"[ , ] Comma"}/>
      </#macro>
      <#macro dateFormat>
        <@input name="source.dateFormat" help="i18n" helpOptions={"YYYY-MM-DD":"ISO format: YYYY-MM-DD","MM/DD/YYYY":"US dates: MM/DD/YYYY","DD.MM.YYYY":"DD.MM.YYYY"}/>
      </#macro>
      <#macro encoding>
        <@input name="source.encoding" help="i18n" helpOptions={"UTF-8":"UTF-8","Latin1":"Latin 1","Cp1252":"Windows1252"}/>
      </#macro>
      <#macro headerLines>
        <@input name="source.ignoreHeaderLines" help="i18n" helpOptions={"0":"None","1":"Single Header row"}/>
      </#macro>


        <div class="clearfix" style="margin-top: 40px;">
          <p style="color:#333;"><strong>APIs analyzed your source data!</strong></p>
          <p style="color:#333;">If you change the fields below, confirm by clicking on "Analyze".<br>APIs generates than a new dataset view based on your new input by clicking on "View source data".</p>

          <#if source.isSqlSource()>
          <#-- only for sql sources -->
            <div class="row">
              <div class="col-md-12">
                <@select name="rdbms" options=jdbcOptions value="${source.rdbms.name!}" i18nkey="sqlSource.rdbms" />
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <@input name="sqlSource.host" help="i18n"/>
              </div>
              <div class="col-md-6">
                <@input name="sqlSource.database" help="i18n"/>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <@input name="sqlSource.username" />
              </div>
              <div class="col-md-6">
                <@input name="sqlSource.password" type="password" />
              </div>
            </div>

            <div class="row">
              <div class="col-md-12">
              <@text name="sqlSource.sql" help="i18n"/>
              <#if sqlSource.sql?has_content>
                <@label i18nkey="sqlSource.sqlLimited" >
                ${sqlSource.getSqlLimited(10)}
                </@label>
              </div>
              </#if>
            </div>

              <div class="col-md-6">
                <@encoding/>
              </div>
              <div class="col-md-6">
                <@dateFormat/>
              </div>

              <div class="col-md-6">
                <@multivalue/>
              </div>
              <div class="col-md-6">
              </div>

          <#elseif source.isExcelSource()>
          <#-- excel source -->
              <div class="col-md-6">
                <@headerLines/>
              </div>
              <div class="col-md-6">
                <@select name="source.sheetIdx" options=source.sheets() value="${source.sheetIdx}" i18nkey="excelSource.sheets" />
              </div>
              <div class="col-md-6">
                <@multivalue/>
              </div>
              <div class="col-md-6">
              </div>

          <#else>
          <#-- file source -->
              <div class="col-md-6">
                <@headerLines/>
              </div>
              <div class="col-md-6">
              </div>
              <div class="col-md-6">
                <@input name="fileSource.fieldsTerminatedByEscaped" help="i18n" helpOptions={"\\t":"[ \\t ] Tab",",":"[ , ] Comma",";":"[ ; ] Semicolon","|":"[ | ] Pipe"}/>
              </div>
              <div class="col-md-6">
                <@input name="fileSource.fieldsEnclosedByEscaped" help="i18n" helpOptions={"":"None","&quot;":"Double Quote","'":"Single Quote"}/>
              </div>
              <div class="col-md-6">
                <@multivalue/>
              </div>
              <div class="col-md-6">
                <@encoding/>
              </div>
              <div class="col-md-6">
                <@dateFormat/>
              </div>
              <div class="col-md-6">
              </div>
          </#if>

        </div>

        <div class="row">
          <div class="col-md-4">
            <div class="userManageButtons">
            <@s.submit cssClass="btn btn-default" name="save" key="button.save"/>
            <@s.submit cssClass="btn btn-default" name="cancel" key="button.cancel"/>
            <#if id?has_content>
              <@s.submit cssClass="btn btn-danger confirm" name="delete" key="button.delete.source.file"/>
            </#if>
            </div>
          </div>
        </div>

    <#else>
        <div class="buttons">
          <@s.submit cssClass="btn btn-danger" name="cancel" key="button.back"/>
        </div>
    </#if>
</form>
</div>

<#include "/WEB-INF/pages/inc/footer.ftl">
</#escape>