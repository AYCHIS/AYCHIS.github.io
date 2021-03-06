<!-- Represents metadata section on resource overview page -->
<hr>
<h4>3. Metadata</h4> 
<p>Metadata describes your dataset. Basic Metadata like Author, License, Contact details etc. is mandatory.</p>
<div class="resourceOverview" id="metadata">
  <div class="titleOverview">
    <div class="head">
      <i class="infoImg fa fa-info-circle fa-lg"> </i>
      <div class="info autop">
        <@s.text name='manage.metadata.basic.required.message'/>
        <#if resource.coreType?has_content && resource.coreType==metadataType>
          </br></br>
          <@s.text name='manage.overview.source.hidden'><@s.param><a href="${baseURL}/manage/metadata-basic.do?r=${resource.shortname}&amp;edit=Edit"><@s.text name="submenu.basic"/></a></@s.param></@s.text>
        </#if>
      </div>
      <@s.text name='manage.overview.metadata'/>
    </div>
    <div class="actions">
      <form action='metadata-basic.do' method='get'>
        <input name="r" type="hidden" value="${resource.shortname}"/>
        <#if missingMetadata>
            <@s.submit name="edit" cssClass="button btn btn-default" key="button.edit"/>
            <i class="infoImg fa fa-exclamation-triangle"> </i>
            <div class="info autop">
              <@s.text name="manage.overview.missing.metadata"/>
            </div>
        <#else>
          <@s.submit name="edit" cssClass="button btn btn-default" key="button.edit"/>
        </#if>
      </form>
    </div>
  </div>
  <div class="bodyOverview">

      <p>
        <@s.text name="manage.overview.metadata.description"/>
      </p>

      <div class="details">
        <table>
          <tr>
            <#if metadataModifiedSinceLastPublication>
              <@s.text name='manage.home.last.modified'/> ${resource.getMetadataModified()?date?string.medium!}
            <#elseif resource.lastPublished??>
              <@s.text name="manage.overview.notModified"/>
            </#if>
          </tr>
        </table>
      </div>

  </div>
</div>
<hr>
<h4>4. Publishing</h4> 
<p>Almost done! Publish your dataset on APIs to get a unique identifier so that other scientists can cite your work.</p>
<p>You want to register your dataset as well to GBIF? No problem, move to step 5...</p>