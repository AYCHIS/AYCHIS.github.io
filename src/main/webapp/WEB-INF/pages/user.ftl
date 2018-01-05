<#escape x as x?html>
<#include "/WEB-INF/pages/inc/header.ftl">
<title><@s.text name="admin.user.title.new"/></title>
<script type="text/javascript" src="${baseURL}/js/jconfirmation.jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  initHelp();
  $('.confirm').jConfirmAction({question : "<@s.text name="basic.confirm"/>", yesAnswer : "<@s.text name="basic.yes"/>", cancelAnswer : "<@s.text name="basic.no"/>"});
});   
</script> 

<#assign currentMenu = "home"/>
<#include "/WEB-INF/pages/inc/menu-2.ftl">
<#include "/WEB-INF/pages/macros/forms.ftl">

<div class="grid_18 suffix_6">
  <div class="headline text-center">
    <h3><@s.text name="admin.user.title.new"/></h3>
  </div>
  <p><@s.text name="admin.user.intro"/></p>
  <p><@s.text name="admin.user.intro2"/></p>
  <p><@s.text name="admin.user.intro3"/></p>
  <div class="row">
    <@s.form cssClass="topForm" action="user.do" method="post" namespace="" includeContext="false">
    <div class="col-md-6">  
      <@s.hidden name="id" value="${user.email!}" required="true"/>
      <@input name="user.firstname" />  
      <@input name="user.email" disabled=id?has_content/>  
      <@select name="user.role" value=user.role javaGetter=false options={"Manager":"user.roles.manager", "Publisher":"user.roles.publisher"}/>
    </div>
    <div class="col-md-6">
      <@input name="user.lastname" />
      <@input name="user.password" type="password" />
      <@input name="password2" i18nkey="user.password2" type="password"/>  
    </div>
    <div class="col-lg-12">
      <div class="userManageButtons">
        <@s.submit cssClass="btn btn-default" name="save" key="button.register"/>
      </div>
    </div>  
    </@s.form>
  </div>
</div>



<#include "/WEB-INF/pages/inc/footer.ftl">
</#escape>