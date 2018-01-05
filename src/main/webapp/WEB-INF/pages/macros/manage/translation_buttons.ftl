<#macro buttons location>
<div <#if location == "top">class="topButtons"<#else>class="bottomButtons"</#if>>
<div class="row">
  <div class="col-lg-12">
    <div class="userManageButtons">
      <@s.submit cssClass="button btn btn-default" name="save" key="button.save"/>
    </div>
  </div>
</div>
<br>
  <a class="button" href="mapping.do?r=${resource.shortname}&id=${property.extension.rowType?url}&mid=${mid}">
    <input class="button btn btn-default" type="button" value='<@s.text name='button.cancel'/>'/>
  </a>
  <@s.submit cssClass="btn btn-danger confirm" name="delete" key="button.delete"/>

  <a class="button" href='translationReload.do?r=${resource.shortname}&mapping=${property.extension.rowType?url}&term=${property.qualname?url}&mid=${mid}&rowtype=${property.extension.rowType?url}'>
    <input class="button btn btn-default" type="button" value='<@s.text name="button.reload"/>'/>
  </a>
  <#if property.vocabulary?has_content>
    <a class="button" href='translationAutomap.do?r=${resource.shortname}&mapping=${property.extension.rowType?url}&rowtype=${property.extension.rowType?url}&term=${property.qualname?url}&mid=${mid}'>
      <input class="button btn btn-default" type="button" value='<@s.text name="button.automap"/>'/>
    </a>
  </#if>
</div>
</#macro>
