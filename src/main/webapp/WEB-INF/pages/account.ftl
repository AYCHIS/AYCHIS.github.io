<#ftl output_format="HTML">
<#include "/WEB-INF/pages/inc/header.ftl">
 <title><@s.text name="account.title"/></title>
<#include "/WEB-INF/pages/inc/menu.ftl">
<#include "/WEB-INF/pages/macros/forms.ftl">
<div class="grid_18 suffix_6">
 	<div class="headline text-center">
    <h3><@s.text name="account.title"/></h3>
  </div>
	<p><@s.text name="account.intro"/></p>
	<p><@s.text name="account.email.cantChange"/></p>
	
	<div class="row">
  	<@s.form cssClass="topForm" action="account" method="post" namespace="" includeContext="false">   
		<div class="col-md-6">         
			<@s.hidden name="id" value="${user.email!}" required="true"/>
			<@input name="user.email" disabled=true />  
			<@input name="user.firstname" />  
			<@input name="user.password" i18nkey="user.password.new" type="password"/>
		</div>
		<div class="col-md-6">
			<#assign val><@s.text name="user.roles.${user.role?lower_case}"/></#assign>
			<@readonly name="role" i18nkey="user.role" value=val />
			<@input name="user.lastname" />  
			<@input name="password2" i18nkey="user.password2" type="password"/>
		</div>
    <div class="col-lg-12">
		  <div class="userManageButtons">
		    <@s.submit cssClass="button btn btn-default" name="save" key="button.save"/>
		 	  <@s.submit cssClass="button btn btn-danger" name="cancel" key="button.cancel"/>
		  </div>
		</div>
		</@s.form>
	</div>
</div>
<#include "/WEB-INF/pages/inc/footer.ftl">
